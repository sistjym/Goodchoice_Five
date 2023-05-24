package com.five.goodchoice.khs.controller;

import org.springframework.web.bind.annotation.RequestMapping;

public class MypageController {
	
	@RequestMapping(value="/myreservation.gc") 
	public String my_page_4() {
		return "my/reservation.tiles4";
	}
	@RequestMapping(value="/mypage.gc") 
	public String my_page_5() {
		return "my/page.tiles4";
	}
	@RequestMapping(value="/mypoint.gc") 
	public String my_page_6() {
		return "my/point.tiles4";
	}
}
