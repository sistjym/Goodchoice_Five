package com.five.goodchoice.model.service;

import java.util.List;
import java.util.Map;

public interface InterAdminService {
	
	//권한을 승인하길 기다리는 모든 호스트를 보여주기 
	List<String> HostList();

	// 모든 숙소 보여주기 
	List<Map<String, String>> getAcommList(Map<String, Object> paraMap);

	// 카테고리 리스트 가져오기 
	List<String> categoryNameList();

	// 분류 리스트 불러오기 
	List<String> specNameList();

	// 관리자 모든 업주보기 + 권한 승인 기능
	List<Map<String, String>> getHostList(Map<String, Object> paraMap);

	//권한 업데이트 하기 
	int updatePermission(Map<String, String> paraMap);

}
