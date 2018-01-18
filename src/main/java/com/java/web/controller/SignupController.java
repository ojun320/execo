package com.java.web.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.java.web.service.SignupServiceInterface;
import com.java.web.util.HttpUtil;

@Controller
public class SignupController {
	
	@Autowired
	SignupServiceInterface ssi;
	
	@RequestMapping("/signup") // 회원가입페이지
	public ModelAndView signup(ModelAndView mav){
		mav.setViewName("signup");
	return mav;
	}
	
	@RequestMapping("/login") // 로그인페이지
	public ModelAndView login(ModelAndView mav){
		mav.setViewName("login");
	return mav;
	}

	// 회원가입
	@RequestMapping(value="/SignupData", method = RequestMethod.POST)
	public ModelAndView signupData(ModelAndView mav, HttpServletRequest req){ 
		HashMap<String, Object> param = HttpUtil.getParameterMap(req);      
		param = ssi.setSignupData(param);    
	return HttpUtil.makeHashToJsonModelAndView(param);
	}
	
	// 회원가입 아이디 중복체크
	@RequestMapping(value="/checkid", method = RequestMethod.POST)
	public void checkid(HttpServletRequest req, HttpServletResponse resp){
	   HashMap<String, Object> checkid = HttpUtil.getParameterMap(req);      
	   HashMap<String, Object> checkiddata = (HashMap<String, Object>) ssi.checkid(checkid);
	   HttpUtil.sendResponceToJson(resp, checkiddata);
	}
	
	// 로그인
	@RequestMapping(value = "/LoginData", method = RequestMethod.POST)
	public void loginData(HttpServletRequest req, HttpServletResponse resp, HttpSession session){
		HashMap<String, Object> param = HttpUtil.getParameterMap(req);	   
		HashMap<String, Object> result = ssi.getLoginData(param);	   
		session.setAttribute("user", result);	   
		HttpUtil.sendResponceToJson(resp, result);
	}
	
	// 로그아웃
	@RequestMapping("/Logout")
	public ModelAndView logout(ModelAndView mav, HttpSession session){
		session.invalidate();
		mav.setViewName("redirect:/");
		return mav;
	}
	
	// 로그인유지
	@RequestMapping(value="/LoginCheck", method = RequestMethod.POST)
	public void LoginCheck(HttpServletResponse resp, HttpSession session){
		HashMap<String, Object> user = (HashMap<String, Object>) session.getAttribute("user");
		HashMap<String, Object> map = new HashMap<String, Object>();
			if(user == null){
				map.put("status", 0);
			}else{
				map.put("status", 1);
				map.put("user", user);
			}
			HttpUtil.sendResponceToJson(resp, map);
		}
	}
