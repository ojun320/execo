package com.java.web.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.web.dao.PagingDaoInterface;


@Service
public class PagingService implements PagingServiceInterface {
	
	private int viewRow = 10;
	private int start;
	
	@Autowired
	PagingDaoInterface pdi; //pagingDaoInterface를 변수로 pid라고 선언 
	
	@Override
	public HashMap<String, Object> select(HashMap<String, Object> param) {
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("totCnt", pdi.totCnt());
		
		HashMap<String,Object> map2 = pdi.totCnt();
		
		start = Integer.parseInt(map2.get("tot").toString()) - viewRow;
		
		param.put("viewRow", 10);
		
//		System.out.println("param data : "+param);
		List<HashMap<String, Object>> list = pdi.select(param);
		map.put("data", list);
		
//		System.out.println("List data : " + map.get("data"));
		
		return map;
	}

}
