package com.java.web.dao;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class MainDao implements MainDaoInterface {

	@Resource(name="sqlSession")
	SqlSession session;

	@Override
	public List<HashMap<String,Object>> model(){
	return session.selectList("sql.test");

	}

}
