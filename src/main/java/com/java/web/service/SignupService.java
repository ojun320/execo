package com.java.web.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.web.dao.SignupDaoInterface;


@Service
public class SignupService implements SignupServiceInterface {

	@Autowired
	SignupDaoInterface sdi;	   
	public HashMap<String, Object> map;
	
	@Override
	 public HashMap<String, Object> getData(){
	    map = new HashMap<String, Object>();
	    map.put("list", sdi.getData());
	    return map;
	}
	
	// 회원가입
	@Override
	public HashMap<String, Object> setSignupData(HashMap<String, Object> param) {
		map = new HashMap<String, Object>();
		map.put("status", sdi.setSignupData(param));
	return map;
	}
	
	// 회원가입아이디 중복확인
	@Override
	public HashMap<String, Object> checkid(HashMap<String, Object> param){
		map = new HashMap<String, Object>();
		map.put("checkid", sdi.checkid(param));
	return map;
	}
	
	// 로그인
	@Override
		public HashMap<String, Object> getLoginData(HashMap<String, Object> param) {
		   map = new HashMap<String, Object>();	     
		   map.put("data", sdi.getLoginData(param));	      
		   return map;
	}

}
