package com.five.goodchoice.model.service;


public interface InterMemberService {


	
	// 이메일이 존재하는 이메일인지 확인하기
	boolean checkDuplicateEmail(String email);
}
