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
		
	@RequestMapping(value="/index.gc")//   http://localhost:9090/index/      로 검색해보세요
	public ModelAndView index ( ModelAndView mav) {
		mav.setViewName("index");		
		return mav ;
	}

	@RequestMapping(value="/test/tiles_test_1.gc") // tiles test 입니다.
	public String tiles_test_1() {
		
		return "tile_test.tiles1" ;
	}

	@RequestMapping(value="/test/tiles_test_2.gc") // tiles test 입니다.
	public String tiles_test_2() {
		
		return "product/content.tiles2" ;
	}

	@RequestMapping(value="/test/tiles_test_3.gc") // tiles2 
	public String tiles_test_3() {
		return "test/test.tiles2";
	}
	
	// 메인용 
	@RequestMapping(value="/main/home.gc") // tiles test 입니다.
	public String main() {
		
		return "main/home.tiles1" ;
		// /WEB-INF/views/tiles1/{1}/{2}.jsp
	}
	
	@RequestMapping(value="/my/page.gc") 
	public String my_page_1() {
		return "my/page.tiles2";
	}
	@RequestMapping(value="/my/point.gc") 
	public String my_page_2() {
		return "my/point.tiles2";
	}
	@RequestMapping(value="/my/reservation.gc") 
	public String my_page_3() {
		return "my/reservation.tiles2";
	}
	
	// 아래가 진짜
	@RequestMapping(value="/my/reservation1.gc") 
	public String my_page_4() {
		return "my/reservation.tiles3";
	}
	@RequestMapping(value="/my/page1.gc") 
	public String my_page_5() {
		return "my/page.tiles3";
	}
	@RequestMapping(value="/my/point1.gc") 
	public String my_page_6() {
		return "my/point.tiles3";
	}
}
