package com.java.web.dao;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class NewsListDao implements NewsListDaoInterface {

	//데이터베이스에서 값을 주고 받기 위한 통로 (root-context.xml)
	@Resource(name="sqlSession")
	SqlSession session;
	
	@Override
	public List<HashMap<String, Object>> getNewsList(HashMap<String,Object>param) {
		return session.selectList("sql.selectList",param);
	}

	@Override
	public HashMap<String, Object> totCnt() {
		return session.selectOne("sql.totCnt");
	}

	@Override
	public HashMap<String, Object> selectDetail(HashMap<String, Object> param) {
		return session.selectOne("sql.selectDetail", param);
	}
	
	@Override
	   public HashMap<String, Object> Detail1(HashMap<String, Object> param) {
	      return session.selectOne("sql.selectDetail", param);
	}
	
	   @Override
	   public int inwriting(HashMap<String, Object> param) {
		   System.out.println(param);
	   return session.insert("sql.InsertNews",param);
	   }
	   
	   @Override
	   public int fileAdd(HashMap<String, Object> param) {
	   return session.insert("sql.InsertNews", param);
	   }
	
	
}
