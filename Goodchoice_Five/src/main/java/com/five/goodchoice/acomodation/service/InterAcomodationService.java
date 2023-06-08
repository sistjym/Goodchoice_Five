package com.five.goodchoice.acomodation.service;

import java.util.List;
import java.util.Map;

public interface InterAcomodationService {
	
	// 검색조건의 결과물의 숙소리스트를 가져온다.
	List<Map<String, String>> getAcomSearchList(Map<String, Object> filter_condition_Map);

	// 카테고리별  시설 목록을 불러온다.
	List<Map<String, String>> getFacilityListByAcomCategory(String category_no);

	// isExistCategory_no 는 입력받은 category_no 가 DB 내부에 존재하는 확인하는 메소드이다.
	boolean isExistCategory_no(String category_no);

	// 카테고리에 따른 지역번호가 존재하는지 확인하는 메소드
	String isDistrictNoByCategoryNo(Map<String, String> paraMap);

	// category_id 별 존재하는  fac_no 인지 확인하는 메소드
	String isExistFacNo(Map<String, String> paraMap);

	// district_no 입력해서 prov_name 과 sub_city_name 을 알아오는 메소드
	Map<String, String> getSubtopBtnData(String district_no);

	// category_no를 입력받아서 그에 해당하는 prov_no 를 가져오는 메소드
	List<Map<String, String>> getCityListByCategory(String category_no);

	// category_no 와 prov_no 를 입력받아서 지역별 어느 지역구가 있는지 조회
	List<Map<String, String>> getDistrictListByProvNo(Map<String, String> paraMap);

	// 지역번호별 숙소리스트를 가져온다.
	List<Map<String, String>> getAcomListByProvNo(Map<String, Object> filter_condition_Map);

}
