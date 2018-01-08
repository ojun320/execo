package com.java.web.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.java.web.service.NewsListServiceInterface;
import com.java.web.util.HttpUtil;

import net.sf.json.JSONObject;
import net.sf.json.JSONSerializer;

@Controller
public class CustomerController {
	
	@Autowired
	NewsListServiceInterface nlsi;
	
	
	@RequestMapping("/customer") // 고객지원 new&events 화면
	public ModelAndView customer(ModelAndView mav){
		mav.setViewName("customer");
	return mav;
	}
	
	@RequestMapping("/Write1") //글작성하기
	public ModelAndView write(ModelAndView mav, HttpSession session){
		mav.setViewName("Write1");
	return mav;
	}
	
	@RequestMapping("/newsData")
	public ModelAndView newsData(HttpServletRequest req, ModelAndView mav){

		HashMap<String, Object> param = new HashMap<String, Object>();
		if(req.getParameter("start") != null){
			param.put("start", Integer.parseInt(req.getParameter("start")));
		}else{
			param.put("start", 0);
		}
		if(req.getParameter("viewRow") != null){
			param.put("viewRow", Integer.parseInt(req.getParameter("viewRow")));
		}else {
			param.put("viewRow", 10);
		}
		// 디비에서 받아 온 hashmap 데이터를 json으로 변경하여 model 값으로 넣어 준다.
		JSONObject jsonObject = new JSONObject();
		jsonObject = JSONObject.fromObject(JSONSerializer.toJSON(nlsi.getNewsList(param)));
		mav.addObject("message", jsonObject.toString());		
		mav.setViewName("json");
		return mav;
	}
	
		@RequestMapping(value = "/inwriting", method = RequestMethod.POST)
	    public ModelAndView inwriting (HttpServletRequest req, ModelAndView mav,@RequestParam("file") MultipartFile[] file, @RequestParam("img") MultipartFile[] img){
		    HashMap<String, Object> map = new HashMap<String, Object>();
		    System.out.println("img : "+img[0].getOriginalFilename());
		    System.out.println("file : "+file[0].getOriginalFilename());
		    System.out.println("req : "+req.getParameter("content"));
	        JSONObject jsonObject = new JSONObject(); 
		    jsonObject = JSONObject.fromObject(JSONSerializer.toJSON(nlsi.fileOutput(file, req,img)));
		    mav.addObject("message", jsonObject.toString());      
		    mav.setViewName("json");
		    return mav;
	  }
		
		@RequestMapping("/detail1")
		   public ModelAndView detail1(ModelAndView mav, HttpServletRequest req, HttpSession session, HttpServletResponse resp){
		        mav.setViewName("detail1"); 
		         return mav;
		      }

		 
		   
		   @RequestMapping("/newsDetail")
		   public ModelAndView newsDetail(HttpServletRequest req, HttpSession session, HttpServletResponse resp){
			   HashMap<String, Object> param = new HashMap<String, Object>();
			   param.put("newsNo", Integer.parseInt(req.getParameter("newsNo")));
			   
				HashMap<String, Object> map = new HashMap<String, Object>();
		         map = nlsi.Detail1(param);
		      
		      return HttpUtil.makeHashToJsonModelAndView(map);
		   }
		
	
}
