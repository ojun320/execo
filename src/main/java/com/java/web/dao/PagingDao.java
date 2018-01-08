package com.java.web.dao;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class PagingDao implements PagingDaoInterface {	
	
	@Resource(name="sqlSession")
	SqlSession session;
	
	@Override
	public List<HashMap<String, Object>> select(HashMap<String, Object> param) {
		return session.selectList("question.select", param);
	}

	@Override
	public HashMap<String, Object> totCnt() {
		return session.selectOne("question.totCnt");
	}

}
