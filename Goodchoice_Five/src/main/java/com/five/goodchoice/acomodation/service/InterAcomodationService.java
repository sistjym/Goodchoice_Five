package com.five.goodchoice.acomodation.service;

import java.util.List;
import java.util.Map;

public interface InterAcomodationService {

	// 조회조건에 따른 숙소 리스트를 가져오는 메소드
	//List<Map<String, String>> acomodationBySearchCondition(Map<String, String> filter_condition_Map);

	// 입력된 날짜에 대해 예약이 가능한 객실번호를 조회해오는 메소드
	List<String> getAvailableRoomNo(Map<String, Object> filter_condition_Map);

	// 예약이 가능한 객실번호중에서 최소가격과 최대 가격으로 필터링 한 방들의 리스트
	List<String> getPriceFilterRoomNo(Map<String, Object> filter_condition_Map);

	// 객실번호별 가장 저렴한 가격을 기준으로 하는 숙소데이터를 가져오는 메소드
	List<Map<String, String>> getAcomodationByLowPrice(Map<String, Object> filter_condition_Map);

	// 숙소 데이터별 평점과 리뷰 갯수를 얻어온다.
	List<Map<String, String>> getRatingReviewCntByAcom(List<Map<String, String>> searchAcomList);

	// 거리기준으로 정렬된 숙소리스트를 가져온다.
	List<Map<String, String>> getSortedListByDistance(List<Map<String, String>> searchAcomList);

	List<Map<String, String>> getSortedListByRowPrice(List<Map<String, String>> searchAcomList);

}
