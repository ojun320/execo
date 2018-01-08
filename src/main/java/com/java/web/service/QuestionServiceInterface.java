package com.java.web.service;

import java.util.HashMap;

public interface QuestionServiceInterface {
	   public HashMap<String, Object> getData();
	   public HashMap<String, Object> getDetailData(HashMap<String, Object> param);
	   public HashMap<String, Object> getSearchData(HashMap<String, Object> param);
	   public HashMap<String, Object> setWriteData(HashMap<String, Object> param);
	   public HashMap<String, Object> setAnswerData(HashMap<String, Object> param);
	}
