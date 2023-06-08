package com.five.goodchoice.model.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;

import com.five.goodchoice.member.model.MemberVO;
import com.five.goodchoice.member.model.InterMemberDAO;

public class MypageService implements InterMypageService {

	@Autowired
	InterMemberDAO dao;
	
	@Override
	public ModelAndView mypageEnd(ModelAndView mav, HttpServletRequest request, Map<String, String> paraMap) {
		
		MemberVO loginuser = dao.loginMember(paraMap);
		
		
		
		return mav;
	}

}
