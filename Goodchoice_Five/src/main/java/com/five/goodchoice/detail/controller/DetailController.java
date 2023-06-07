package com.five.goodchoice.detail.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class DetailController {
	
	@RequestMapping(value="/details/detail.gc" , method = {RequestMethod.GET})
	public String tiles_detail_1(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		return "details/detail.tiles5";
		//    /WEB-INF/views/tiles1/details/detail.jsp  페이지를 만들어야 한다.
	}

	
	
}
