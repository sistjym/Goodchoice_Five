package com.five.goodchoice.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.five.goodchoice.member.model.InterMemberDAO;
import com.five.goodchoice.member.model.MemberVO;

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
