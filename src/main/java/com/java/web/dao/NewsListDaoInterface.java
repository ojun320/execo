package com.java.web.dao;

import java.util.HashMap;
import java.util.List;

public interface NewsListDaoInterface {
	public List<HashMap<String,Object>> getNewsList(HashMap<String,Object> param);
	public HashMap<String,Object> totCnt();
	public HashMap<String,Object> selectDetail(HashMap<String, Object> param);
	
	public int inwriting(HashMap<String,Object> param);
    public int fileAdd(HashMap<String, Object> param);
    
    public HashMap<String, Object> Detail1(HashMap<String, Object> param);
}
