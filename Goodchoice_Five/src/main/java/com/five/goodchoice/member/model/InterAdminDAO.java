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

	// 모든 호스트 가져오기 
	List<Map<String, String>> getHostList(Map<String, Object> paraMap);

	// 호스트 권한 업데이트 하기
	int updatePermission(Map<String, String> paraMap);

	// 숙소 등록 권한 업데이트 하기 
	int updatePermissionAcomm(Map<String, String> paraMap);

	// 지역 리스트 불러오기 
	List<String> districtNameList();

	// 스펙별 숙소 갯수 구하기 
	List<Map<String, String>> totalAcommByspec();

	// 지역별 숙소 갯수
	List<Map<String, String>> acommCntByDistrict();
	
	// 지역별  도시별 숙소 통계 
	List<Map<String, String>> acommCntByCity(String district);

	// 리뷰리스트 불러오기
	List<Map<String, String>> getReviewList();

	// 검색에 따른 게시문의 총합을 가져오는 함수
	int getTotalCount(Map<String, Object> paraMap);

	// 페이징 처리가 있는 숙소 리스트 불러오기 
	List<Map<String, String>> getAcommListWithPaging(Map<String, Object> paraMap);

}
