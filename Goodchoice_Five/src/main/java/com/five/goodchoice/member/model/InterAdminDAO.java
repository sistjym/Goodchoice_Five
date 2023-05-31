package com.five.goodchoice.member.model;

import java.util.List;
import java.util.Map;


public interface InterAdminDAO {

	// 모든 숙소 보여주기 
	List<Map<String, String>> getAcommList(Map<String, Object> paraMap);

	// 카테고리 리스트 가져오기 
	List<String> categoryNameList();

	// 분류 리스트 가져오기
	List<String> specNameList();

}
