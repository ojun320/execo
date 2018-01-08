package com.java.web.service;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

public interface NewsListServiceInterface {
	public HashMap<String,Object> getNewsList(HashMap<String,Object> param);
	public HashMap<String,Object> selectDetail(HashMap<String,Object> param);
	
	public HashMap<String,Object> inwriting(HashMap<String,Object> param);
	
	public HashMap<String, Integer> fileOutput(MultipartFile file, HttpServletRequest req, MultipartFile img);
	public HashMap<String, Integer> fileAdd(HashMap<String, Object> param);
	
	public HashMap<String, Object> Detail1(HashMap<String, Object> param);
}
