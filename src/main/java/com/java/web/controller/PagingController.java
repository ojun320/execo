package com.java.web.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.java.web.service.PagingServiceInterface;

import net.sf.json.JSONObject;
import net.sf.json.JSONSerializer;

@Controller
public class PagingController {
   
   @Autowired
   PagingServiceInterface psi;
   
   @RequestMapping("/listView")
   public ModelAndView listView(ModelAndView mav){
      mav.setViewName("paging/list");
      return mav;
   }
   
   @RequestMapping("/listData")
   public ModelAndView listData(ModelAndView mav, HttpServletRequest req){
//	   System.out.println(req.getParameter("start"));
	   HashMap<String, Object> param = new HashMap<String, Object>();
	   param.put("start", Integer.parseInt(req.getParameter("start")));
	      /*param.put("viewRow", Integer.parseInt(req.getParameter("viewRow")));*/

	      JSONObject jsonObject = new JSONObject();
	      jsonObject = JSONObject.fromObject(JSONSerializer.toJSON(psi.select(param)));
	      mav.addObject("message", jsonObject.toString());
	      mav.setViewName("json");
	      return mav;
   }
}