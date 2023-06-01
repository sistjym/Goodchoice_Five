package com.five.goodchoice.model.service;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.five.goodchoice.common.AES256;
import com.five.goodchoice.member.model.InterMemberDAO;

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

}
