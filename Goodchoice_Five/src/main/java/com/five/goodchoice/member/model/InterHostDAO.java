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
	
	/*
	 * // 숙소번호 알아오기 int getAcomNo(Map<String, String> paraMap);
	 */
	
	// 숙소추가이미지
	int addAcomoImage(Map<String, Object> fileMap);
	
	// 객실테이블에 insert	
	int roomRegister(Map<String, String> paraMap);
	
	// 객실추가이미지
	void addRoomImage(Map<String, Object> fileMap1);
	
	// 공용시설추가
	int insertpublicServices(Map<String, Object> numMap);
	

}
