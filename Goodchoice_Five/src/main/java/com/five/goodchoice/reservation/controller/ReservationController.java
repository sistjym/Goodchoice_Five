package com.five.goodchoice.reservation.controller;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class ReservationController {
	
	
	@RequestMapping(value="/reservation/reservation.gc")
	public String reservation(){
		
		return "reservation/reservation.tiles1";
		
	}
}
