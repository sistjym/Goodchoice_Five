package com.five.goodchoice.model.service;

import java.util.Map;

public interface InterHostService {
	
	
	// 사업자등록 중복 유무 검사
	boolean checkDuplicateBusinessNum(String business_id);
	
	// 업주회원가입 
	boolean gohostRegister(Map<String, String> paraMap);

}
