package com.five.goodchoice.member.model;

public interface InterMemberDAO {


	
	// 이메일이 존재하는 이메일인지 확인하기
	boolean checkDuplicateEmail(String email);

}
