package com.five.goodchoice.khs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MypageController {
	
	@RequestMapping(value="/myreservation.gc") 
	public String my_page_1() {
		return "my/reservation.tiles4";
	}
	@RequestMapping(value="/mypage.gc") 
	public String my_page_2() {
		return "my/page.tiles4";
	}
	@RequestMapping(value="/mypoint.gc") 
	public String my_page_3() {
		return "my/point.tiles4";
	}
}
