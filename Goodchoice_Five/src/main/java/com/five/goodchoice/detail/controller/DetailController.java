package com.five.goodchoice.detail.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class DetailController {
	
	@RequestMapping(value="/details/detail.gc" )
	public String tiles_detail_1() {
		
		return "details/detail.tiles1";
		//    /WEB-INF/views/tiles1/details/detail.jsp  페이지를 만들어야 한다.
	}

	
	
}
