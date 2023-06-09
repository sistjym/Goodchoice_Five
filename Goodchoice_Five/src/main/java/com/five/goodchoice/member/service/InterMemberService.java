package com.five.goodchoice.member.service;

import java.util.Map;

import com.five.goodchoice.member.model.HostVO;
import com.five.goodchoice.member.model.MemberVO;

public interface InterMemberService {


	
	// 이메일이 존재하는 이메일인지 확인하기
	boolean checkDuplicateEmail(String email);
	
	// 회원가입
	boolean registerMember(Map<String, String> paraMap);
	
	// 멤버로 로그인하기
	MemberVO loginMember(Map<String, String> paraMap);
	
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
	
	// 카카오 계정으로 가입
	boolean registerMemberforKakao(Map<String, String> paraMap);

}
