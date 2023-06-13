package com.five.goodchoice.mypage.controller;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.five.goodchoice.member.model.MemberVO;
import com.five.goodchoice.mypage.service.InterMypageService;


@Controller
public class MypageController {
	
	@Autowired  //  TYPE 에 따라서 , SPRING 에서 알아서 BEAN 을 주입 해준다.
	private InterMypageService service ;
	
	@RequestMapping(value="/myreservation.gc") 
	public ModelAndView my_page_1(ModelAndView mav, HttpServletRequest request) {

		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
		
		if(loginuser != null) {
			mav.setViewName("my/reservation_list.tiles4");
		}
		else {
			String message = "로그인이 필요한 페이지입니다.";
			String loc = "javascript:history.back()";
			
			mav.addObject("message", message);
			mav.addObject("loc", loc);
			mav.setViewName("msg");
		}
		return mav;
		
		
	}
	@RequestMapping(value="/mypage.gc") 
	public ModelAndView my_page_2(ModelAndView mav, HttpServletRequest request) {
		
		
		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
		
		if(loginuser != null) {
			mav.setViewName("my/page.tiles4");
		}
		else {
			String message = "로그인이 필요한 페이지입니다.";
			String loc = "javascript:history.back()";
			
			mav.addObject("message", message);
			mav.addObject("loc", loc);
			mav.setViewName("msg");
		}
		return mav;
		
	}

	@RequestMapping(value="/mypoint.gc", method = {RequestMethod.POST}) 
	public ModelAndView my_page_3(ModelAndView mav, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
		
		if(loginuser != null) {
			mav.setViewName("my/point.tiles4");
		}
		else {
			String message = "로그인이 필요한 페이지입니다.";
			String loc = "javascript:history.back()";
			
			mav.addObject("message", message);
			mav.addObject("loc", loc);
			mav.setViewName("msg");
		}
		return mav;
		
	}
	@RequestMapping(value="/reservation-detail.gc") 
	public ModelAndView my_page_4(ModelAndView mav, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
		
		if(loginuser != null) {
			mav.setViewName("my/reservation-detail.tiles4");
		}
		else {
			String message = "로그인이 필요한 페이지입니다.";
			String loc = "javascript:history.back()";
			
			mav.addObject("message", message);
			mav.addObject("loc", loc);
			mav.setViewName("msg");
		}
		return mav;
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
