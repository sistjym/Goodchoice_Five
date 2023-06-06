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

}
