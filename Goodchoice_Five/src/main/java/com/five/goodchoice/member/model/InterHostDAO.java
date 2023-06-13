package com.five.goodchoice.member.model;

import java.util.Map;

public interface InterHostDAO {
	
	// 사업자등록 중복 유무 검사
	boolean checkDuplicateBusinessNum(String business_id);
	
	// 업주회원가입
	boolean gohostRegister(Map<String, String> paraMap);
	
	// 지역구번호 알아오기
	int getDistrictno(Map<String, String> paraMap);

	// 숙소테이블에 insert	
	int acomoRegister(Map<String, String> paraMap);
	

}
