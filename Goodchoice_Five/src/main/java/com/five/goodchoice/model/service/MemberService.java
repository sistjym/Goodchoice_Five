package com.five.goodchoice.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.five.goodchoice.model.InterMemberDAO;
import com.five.goodchoice.model.MemberVO;

@Service
public class MemberService implements InterMemberService{

	@Autowired
	InterMemberDAO dao;
	
	@Override
	public MemberVO test_select() {
		MemberVO mvo = dao.test_select();
		
		return mvo;
	}

}
