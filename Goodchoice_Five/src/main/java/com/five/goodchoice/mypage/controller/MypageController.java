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

import com.five.goodchoice.common.AES256;
import com.five.goodchoice.member.model.MemberVO;
import com.five.goodchoice.mypage.service.InterMypageService;


@Controller
public class MypageController {
	
	@Autowired
	private AES256 aes;
	
	@Autowired  //  TYPE 에 따라서 , SPRING 에서 알아서 BEAN 을 주입 해준다.
	private InterMypageService service ;
	
	@RequestMapping(value="/myreservation.gc") 
	public String my_page_1() {
		return "my/reservation.tiles4";
	}
	@RequestMapping(value="/mypage.gc") 
	public ModelAndView memberEdit(ModelAndView mav, HttpServletRequest request) {
		// 내정보(회원정보)를 수정하기 위한 전제조건은 먼저 로그인을 해야 하는 것이다.
		if(service.checkLogin()) {
			// 로그인 했으면
			String email = request.getParameter("email");

			HttpSession session = request.getSession();
			MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");

			try {
				if(loginuser.getMember_email().equals(aes.encrypt(email))) {
					// 로그인한 사용자가 자신의 정보를 수정하는 경우

					mav.setViewName("my/page.tiles4");
				}
				else {
					// 로그인한 사용자가 다른 사용자의 정보를 수정하려고 시도하는 경우
					String message = "다른 사용자의 정보 변경은 불가합니다!!";
					String loc = request.getContextPath()+"/main/home.gc";

					mav.addObject("message", message);
					mav.addObject("loc", loc);

					mav.setViewName("msg");
				}
			} catch (UnsupportedEncodingException | GeneralSecurityException  e) {
				e.printStackTrace();
			}
		}
		else {
			// 로그인 안 했으면
			String message = "회원정보를 수정하기 위해서는 먼저 로그인을 하세요!!";
			String loc = "javascript:history.back()";

			mav.addObject("message", message);
			mav.addObject("loc", loc);

			mav.setViewName("msg");
		}

		return mav;
	}

	@RequestMapping(value="/mypoint.gc", method = {RequestMethod.POST}) 
	public ModelAndView my_page_3(ModelAndView mav, HttpServletRequest request) {
		
		
		mav.setViewName("my/point.tiles4");
		
		return mav;
	}
	@RequestMapping(value="/reservation-detail.gc") 
	public String my_page_4(HttpServletRequest request) {
		
		return "my/reservation-detail.tiles4";
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
