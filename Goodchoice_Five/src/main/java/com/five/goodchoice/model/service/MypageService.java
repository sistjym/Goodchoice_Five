package com.five.goodchoice.model.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.five.goodchoice.member.model.InterMypageDAO;

@Service
public class MypageService implements InterMypageService {

	@Autowired  // Type 에 따라 알아서 Bean 을 주입해준다.
	private InterMypageDAO dao;
	
	
	@Override
	public boolean checkLogin(HttpServletRequest request) {
		boolean result = dao.checkLogin(request);
		return result;
	}

}
