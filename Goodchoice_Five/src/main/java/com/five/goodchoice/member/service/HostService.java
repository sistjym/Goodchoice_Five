package com.five.goodchoice.member.service;


import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.five.goodchoice.common.AES256;
import com.five.goodchoice.member.model.InterHostDAO;

@Service
public class HostService implements InterHostService {

	@Autowired
	private InterHostDAO dao;
	
	@Autowired
    private AES256 aes;
	
	// 사업자등록 중복 유무 검사
	@Override
	public boolean checkDuplicateBusinessNum(String business_id) {
		business_id = business_id.substring(0, 3)+"-"+business_id.substring(3, 7)+"-"+business_id.substring(7);
				
		
		boolean result = dao.checkDuplicateBusinessNum(business_id);
		return result;
	}

	// 업주회원가입
	@Override
	public boolean gohostRegister(Map<String, String> paraMap) {
		
		String business_id = paraMap.get("business_id");
		business_id = business_id.substring(0, 3)+"-"+business_id.substring(3, 7)+"-"+business_id.substring(7);
		
		String email = paraMap.get("email");
		try {
			email = aes.encrypt(email);
			paraMap.put("email", email);
			paraMap.put("business_id", business_id);
		} catch (UnsupportedEncodingException | GeneralSecurityException e) {
			e.printStackTrace();
		}
		
		boolean result = dao.gohostRegister(paraMap);
		
		return result;
	}
	
	
	
		
	
	
	
	
}
