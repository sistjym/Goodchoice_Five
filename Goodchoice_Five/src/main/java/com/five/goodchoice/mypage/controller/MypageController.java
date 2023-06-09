package com.five.goodchoice.mypage.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.five.goodchoice.member.model.MemberVO;

@Controller
public class MypageController {
	
	/*
	 * @Autowired private InterMypageService service;
	 */
	
	@RequestMapping(value="/myreservation.gc") 
	public String my_page_1() {
		return "my/reservation.tiles4";
	}
	@RequestMapping(value="/mypage.gc") 
	public ModelAndView my_page_2(ModelAndView mav, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
		
		Map<String, String> paraMap = new HashMap<>();
		paraMap.put("member_email", loginuser.getMember_email());
		paraMap.put("member_nickname", loginuser.getMember_nickname());
		paraMap.put("member_pwd", loginuser.getMember_pwd());
		
		
		
		return mav;
	}
	@RequestMapping(value="/mypoint.gc") 
	public String my_page_3() {
		return "my/point.tiles4";
	}
	@RequestMapping(value="/reservation-detail.gc") 
	public String my_page_4() {
		return "my/reservation-detail.tiles4";
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
