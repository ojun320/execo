package com.java.web.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.java.web.service.MainServiceInterface;

@Controller
public class MainController {
	
	@Autowired
	MainServiceInterface msi;
	
	public HashMap<String, Object> map;
	
	@RequestMapping("/")
	public ModelAndView model(ModelAndView mav){
		mav.setViewName("model");
		HashMap<String, Object> map = msi.model();
		mav.addObject("model", map.get("model"));
		return mav;
	}
	
	@RequestMapping(value="/alert") // 얼렛창 띄우기
	public ModelAndView alert(ModelAndView mav){
		return mav;
	}
	
	@RequestMapping("/mainsec") // 메인페이지
	public ModelAndView modeltest(ModelAndView mav){
		mav.setViewName("main");
		return mav;
	}
	
	@RequestMapping("/introduce1") // 회사소개페이지(인시말)
	public ModelAndView introduce1(ModelAndView mav){
		mav.setViewName("introduce1");
	return mav;
	}
	
	@RequestMapping("/introduce2") // 회사소개페이지(회사연혁)
	public ModelAndView introduce2(ModelAndView mav){
		mav.setViewName("introduce2");
	return mav;
	}
	
	@RequestMapping("/introduce3") // 회사소개페이지(오시는길)
	public ModelAndView introduce3(ModelAndView mav){
		mav.setViewName("introduce3");
	return mav;
	}
	
	@RequestMapping("/introduce4") // 회사소개페이지(해외사업협력사)
	public ModelAndView introduce4(ModelAndView mav){
		mav.setViewName("introduce4");
	return mav;
	}
	
	@RequestMapping("/business1") // 사업분야1 화면
	public ModelAndView business1(ModelAndView mav){
		mav.setViewName("business1");
	return mav;
	}
	
	@RequestMapping("/business2") // 사업분야2 화면
	public ModelAndView business2(ModelAndView mav){
		mav.setViewName("business2");
	return mav;
	}
	
	@RequestMapping("/business3") // 사업분야3 화면
	public ModelAndView business3(ModelAndView mav){
		mav.setViewName("business3");
	return mav;
	}
	
	@RequestMapping("/business4") // 사업분야4 화면
	public ModelAndView business4(ModelAndView mav){
		mav.setViewName("business4");
	return mav;
	}
	
	@RequestMapping("/introducelsr") // 제품소개1 화면
	public ModelAndView introducelsr(ModelAndView mav){
		mav.setViewName("introducelsr");
	return mav;
	}
	
	@RequestMapping("/introducelsr1") // 제품소개2 화면
	public ModelAndView introducelsr1(ModelAndView mav){
		mav.setViewName("introducelsr1");
	return mav;
	}
	
	@RequestMapping("/introducelsr2") // 제품소개3 화면
	public ModelAndView introducelsr2(ModelAndView mav){
		mav.setViewName("introducelsr2");
	return mav;
	}
	
	@RequestMapping("/introducelsr3") // 제품소개4 화면
	public ModelAndView introducelsr3(ModelAndView mav){
		mav.setViewName("introducelsr3");
	return mav;
	}
	
	@RequestMapping("/introducelsr4") // 제품소개5 화면
	public ModelAndView introducelsr4(ModelAndView mav){
		mav.setViewName("introducelsr4");
	return mav;
	}
	
}
