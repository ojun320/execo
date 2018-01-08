package com.java.web.service;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.web.dao.MainDaoInterface;


@Service
public class MainService implements MainServiceInterface {
	HttpServletRequest req;
	
	@Autowired
	MainDaoInterface mdi;
	
	public HashMap<String, Object> map;

	@Override
	public HashMap<String, Object> model() {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("model", mdi.model());
		return map;
	}

}
