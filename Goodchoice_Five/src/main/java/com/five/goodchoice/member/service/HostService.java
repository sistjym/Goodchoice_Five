package com.five.goodchoice.member.service;


import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.five.goodchoice.common.AES256;
import com.five.goodchoice.member.model.InterHostDAO;

import java.util.HashMap;
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
	
	
	// 지역구번호 알아오기
	@Override
	public int getDistrictno(String postcode) {
		
		int index = postcode.indexOf(" ");
		int secondIndex = postcode.indexOf(" ", index + 1);
		String districtname = postcode.substring(0, 2);
		String subdistrictname = postcode.substring(index+1, secondIndex);
		
		
		Map<String, String> paraMap = new HashMap<>();
		paraMap.put("districtname", districtname);
		paraMap.put("subdistrictname", subdistrictname);
		int n = dao.getDistrictno(paraMap);
		
		return n;
		
	}
	
	
	// 숙소테이블에 insert
	@Override
	public int acomoRegister(Map<String, String> paraMap) {
		int n = dao.acomoRegister(paraMap);
		return n;
	}
	
	
	
	/*
	 * // 숙소번호 알아오기
	 * 
	 * @Override public int getAcomNo(Map<String, String> paraMap) { int n =
	 * dao.getAcomNo(paraMap); return n; }
	 */
	
	
	// 숙소추가이미지
	@Override
	public int addAcomoImage(Map<String, Object> fileMap) {
		int n = dao.addAcomoImage(fileMap);
		return n;
	}
	
	
	// 객실 테이블에 insert
	@Override
	public int roomRegister(Map<String, String> paraMap) {
		int n = dao.roomRegister(paraMap);
		return n;
	}
	
	
	// 객실추가이미지
	@Override
	public void addRoomImage(Map<String, Object> fileMap1) {
		 dao.addRoomImage(fileMap1);
		
	}
	
	
	// 공용시설 추가
	@Override
	public int insertpublicServices(Map<String, Object> numMap) {
		 int n = dao.insertpublicServices(numMap);
		  return n;
	}
	
	
	
	
		
	
	
	
	
}
