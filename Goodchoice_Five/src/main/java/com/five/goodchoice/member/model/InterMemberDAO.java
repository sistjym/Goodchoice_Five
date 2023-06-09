package com.five.goodchoice.member.model;

import java.util.Map;

public interface InterMemberDAO {


	
	// 이메일이 존재하는 이메일인지 확인하기
	boolean checkDuplicateEmail(String email);
	
	// 회원가입 insert
	boolean registerMember(Map<String, String> paraMap);
	
	// 멤버로 로그인
	MemberVO loginMember(Map<String, String> paraMap);
	
	// tbl_member 테이블의 is_dormanant 컬럼의 값을 1로 변경하기
	int is_dormanant(String string);

	// tbl_loginhitory 테이블에 insert하기
	int insertloginhistory(Map<String, String> paraMap);

	// 업주로 로그인
	HostVO loginHost(Map<String, String> paraMap);
	
	// 이메일 있는 지없는지 유무확인
	boolean isEmailExist(String Email);
	
	// 비밀번호 업데이트
	int pwUpdate(Map<String, String> paraMap);
	
	// 카카오 계정이 저장되어있는지 확인
	boolean isKakaoExist(String id);
	
	// 카카오 계정으로 로그인하기
	MemberVO loginMemberforKakao(Map<String, String> paraMap);
	
	// 카카오 계정으로 가입하기
	boolean registerMemberforKakao(Map<String, String> paraMap);

	


}
