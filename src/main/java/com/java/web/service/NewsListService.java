package com.java.web.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.java.web.dao.NewsListDaoInterface;
import com.java.web.util.HttpUtil;



@Service
public class NewsListService implements NewsListServiceInterface {

	@Autowired
	NewsListDaoInterface nldi;
	public HashMap<String, Object> map;
	
	@Override
	public HashMap<String, Object> getNewsList(HashMap<String,Object> param) {
		map = new HashMap<String,Object>();
		map.put("list", nldi.getNewsList(param));
		HashMap<String, Object> totCnt = nldi.totCnt();
		map.put("totCnt", totCnt);
		return map;
	}

	@Override
	public HashMap<String, Object> selectDetail(HashMap<String, Object> param) {
		map = new HashMap<String,Object>();
		map.put("detail", nldi.selectDetail(param));
		return map;
	}
	
	@Override
    public HashMap<String, Object> Detail1(HashMap<String, Object> param) {
      HashMap<String, Object> map = new HashMap<String, Object>();
      map.put("data",nldi.Detail1(param));
      return map;
   }

	   @Override
	      public HashMap<String,Object> inwriting(HashMap<String,Object> param){
	       HashMap<String,Object> map = new HashMap<String,Object>();
	       map.put("list", nldi.inwriting(param));
	       return map;
	   }
	   @Override
		public HashMap<String, Integer> fileAdd(HashMap<String, Object> param) {
			HashMap<String, Integer> map = new HashMap<String, Integer>();
			System.out.println("여기도 왔어~~");
			map.put("status", nldi.fileAdd(param));
			return map;
		}

	   @Override
	   public HashMap<String, Integer> fileOutput(MultipartFile[] file, HttpServletRequest req, MultipartFile[] img) {
		 
	      HashMap<String, Integer> map2 = new HashMap<String, Integer>();
	      map = new HashMap<String, Object>();
	      HashMap<String, Object> param = HttpUtil.getParameterMap(req);
		  for(int i = 0; i < img.length; i++){
		         String imgname = img[i].getOriginalFilename();
		         String imgpath2 = "resources/images/";
		         try {
		            byte[] bytes = img[i].getBytes();
		            
		            String imgpath = "";
		            // 개발 툴에서만 사용 할것!
		            imgpath = "C:/Users/GD/git/execo/execo/src/main/webapp/" + imgpath2;
		            /*imgpath = req.getSession().getServletContext().getRealPath("/") + imgpath2;*/
		            
		            File f = new File(imgpath);
		            if(f.exists()){
		               f = new File(imgpath + imgname);
		               OutputStream out = new FileOutputStream(f);
		               out.write(bytes);
		               out.close();
		               
//		               HashMap<String, Object> map = new HashMap<String, Object>();
		               map.put("picPath", imgpath2);
		               map.put("picName", imgname);	               
		            }

		         } catch (IOException e) {
		            e.printStackTrace();
		         } finally {
		         }
		      }
		  
		  
	      for(int i = 0; i < file.length; i++){
	         String name = file[i].getOriginalFilename();
	         String path2 = "resources/upload/";
	         try {
	            byte[] bytes = file[i].getBytes();
	            
	            String path = "";
	            // 개발 툴에서만 사용 할것!
	            path = "C:/Users/GD/git/execo/execo/src/main/webapp/" + path2;
//	            path = req.getSession().getServletContext().getRealPath("/") + path2;
	            
	            File f = new File(path);
	            
	            if(f.exists()){
	               f = new File(path + name);
	               OutputStream out = new FileOutputStream(f);
	               out.write(bytes);
	               out.close();
	               
//	               HashMap<String, Object> map = new HashMap<String, Object>();
	               map.put("path", path2);
	               map.put("name", name);
	               map.put("title", param.get("title"));
	               map.put("days", param.get("days"));
	               map.put("content", param.get("content"));
	               map.put("no", param.get("no"));
	               System.out.println(map);
	               if(("null").equals(param.get("no"))){
	            	   map2 = fileAdd(map);
	               }else{
//	            	   map2 = fileUpdate(map);
	               }
	            }
	         } catch (IOException e) {
	            e.printStackTrace();
	         }
	      }
	      
	      return map2;
	   }
}
