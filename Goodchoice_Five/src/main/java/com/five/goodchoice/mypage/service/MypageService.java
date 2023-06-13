package com.five.goodchoice.mypage.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.five.goodchoice.mypage.model.InterMypageDAO;

@Service
public class MypageService implements InterMypageService {

	@Autowired  // Type 에 따라 알아서 Bean 을 주입해준다.
	private InterMypageDAO dao;
	
	
	@Override
	public boolean checkLogin() {
		boolean result = dao.checkLogin();
		return result;
	}

}
