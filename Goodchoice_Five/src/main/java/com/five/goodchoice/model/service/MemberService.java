package com.five.goodchoice.model.service;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.five.goodchoice.common.AES256;
import com.five.goodchoice.member.model.HostVO;
import com.five.goodchoice.member.model.InterMemberDAO;
import com.five.goodchoice.member.model.MemberVO;

@Service
public class MemberService implements InterMemberService{

	@Autowired
	InterMemberDAO dao;
	
	@Autowired
    private AES256 aes;
	
	
	// 이메일이 존재하는 이메일인지 확인하기
	@Override
	public boolean checkDuplicateEmail(String email) {
		
		try {
			email = aes.encrypt(email);
		} catch (UnsupportedEncodingException | GeneralSecurityException e) {
			e.printStackTrace();
		}
		
		boolean result = dao.checkDuplicateEmail(email);
		
		
		return result;
	}

	// 회원가입
	@Override
	public boolean registerMember(Map<String, String> paraMap) {
		
		String email = paraMap.get("email");
		try {
			email = aes.encrypt(email);
			paraMap.put("email", email);
		} catch (UnsupportedEncodingException | GeneralSecurityException e) {
			e.printStackTrace();
		} 
		boolean result = dao.registerMember(paraMap);
		
		
		return result;
	}
	
	
	// 멤버로 로그인
	@Override
	public MemberVO loginMember(Map<String, String> paraMap) {
		String Email = paraMap.get("Email");
		
		try {
			Email = aes.encrypt(Email);
			paraMap.put("Email", Email);
		} catch (UnsupportedEncodingException | GeneralSecurityException e) {
			e.printStackTrace();
		}
		
		MemberVO loginuser = dao.loginMember(paraMap);
		// System.out.println("서비스loginuser : " +loginuser);
		
		
		if(loginuser != null && loginuser.getIs_dormanant() != 1) {
			int result = dao.insertloginhistory(paraMap);
		}
		
		if(loginuser != null && loginuser.getPwdchangegap() >= 3) {
			// 마지막으로 암호를 변경한 날짜가 현재시각으로부터 3개월이 지났으면
			loginuser.setRequirePwdChange(true);  // 로그인시 암호를 변경하라는 alert를 띄우도록 한다.
 		}
		
		if(loginuser != null && loginuser.getIs_dormanant() == 0 && loginuser.getLastlogingap() >= 12) {
			// 마지막으로 로그인  한 날짜가 현재시각으로부터 1년이 지났으면 휴면으로 지정 해야함
			loginuser.setIs_dormanant(1);
			
			// === tbl_member 테이블의 is_dormanant 컬럼의 값을 1로 변경하기 === //
			int n = dao.is_dormanant(paraMap.get("Email"));
		}
		
		
		
		return loginuser;
	}

	// 업주로 로그인
	@Override
	public HostVO loginHost(Map<String, String> paraMap) {
		String Email = paraMap.get("Email");
		
		try {
			Email = aes.encrypt(Email);
			paraMap.put("Email", Email);
		} catch (UnsupportedEncodingException | GeneralSecurityException e) {
			e.printStackTrace();
		}
		
		HostVO loginuser = dao.loginHost(paraMap);
		// System.out.println("서비스loginuser : " +loginuser);
		
		
		return loginuser;
	}

	@Override
	public boolean isEmailExist(String Email) {
		try {
			Email = aes.encrypt(Email);
		} catch (UnsupportedEncodingException | GeneralSecurityException e) {
			e.printStackTrace();
		}
		boolean isEmailExist = dao.isEmailExist(Email);
		return isEmailExist;
	}
	
	
	// 비밀번호 업데이트
	@Override
	public int pwUpdate(Map<String, String> paraMap) {
		int n = dao.pwUpdate(paraMap);
		return n;
	}
	
	
	
	
	
}
