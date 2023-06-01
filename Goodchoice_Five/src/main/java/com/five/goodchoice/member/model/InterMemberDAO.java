package com.five.goodchoice.member.model;

import java.util.Map;

public interface InterMemberDAO {


	
	// 이메일이 존재하는 이메일인지 확인하기
	boolean checkDuplicateEmail(String email);
	
	// 회원가입 insert
	boolean registerMember(Map<String, String> paraMap);

}
