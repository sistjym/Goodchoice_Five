package com.five.goodchoice.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class IndexController {
	
	@	RequestMapping(value="/")
	public ModelAndView home ( ModelAndView mav) {
		
		mav.setViewName("redirect:/index.gc");		
		return mav ;
	}
		
	@	RequestMapping(value="/index.gc")//   http://localhost:9090/index/      로 검색해보세요
	public ModelAndView index ( ModelAndView mav) {
		mav.setViewName("index");		
		return mav ;
	}

	@RequestMapping(value="/test/tiles_test_1.gc") // tiles test 입니다.
	public String tiles_test_1() {
		
		return "tile_test.tiles1" ;
	}

	
}
