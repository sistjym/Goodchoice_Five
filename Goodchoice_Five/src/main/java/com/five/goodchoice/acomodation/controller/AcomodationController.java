package com.five.goodchoice.acomodation.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AcomodationController {
	
	@RequestMapping(value="/acomodation/search/2/view.gc") 
	public String acomodation_view_2() {
		
		return "acomodation/acom_content.tiles2";
	}
	
}
