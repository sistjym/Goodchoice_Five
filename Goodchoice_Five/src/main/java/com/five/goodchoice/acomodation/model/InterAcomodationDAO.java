package com.five.goodchoice.acomodation.model;

import java.util.List;
import java.util.Map;

public interface InterAcomodationDAO {

	
	// 입력된 날짜에 대해 예약이 가능한 객실번호를 조회해오는 메소드
	List<String> getAvailableRoomId(Map<String, Object> filter_condition_Map);

	// 예약이 가능한 객실번호 중에서 가격 조건을 적용한 방들의 리스트
	List<String> getPriceFilterRoomId(Map<String, Object> filter_condition_Map);

	// 가장 저렴한 객실의 가격을 기준으로 하는 숙소번호와 가격을 가져오는 메소드
	List<Map<String, String>> getAcomListByRowPrice(Map<String, Object> filter_condition_Map);

	// 입력받은 시설 정보를 필터링하여 숙소번호를 구해오는 메소드
	List<String> getAcomListByfacilties(Map<String, Object> filter_condition_Map);
		
	// 거리기준으로 정렬된 숙소리스트를 가져온다.
	List<Map<String, String>> getSortedListByDistance(List<Map<String, String>> acomSearchList);
		
	// 숙소 데이터별 평점과 리뷰 갯수를 얻어온다.
	List<Map<String, String>> getRatingReviewCntByAcom(List<Map<String, String>> acomSearchList);

	// 숙소별 이름과 주소를 가져온다.
	List<Map<String, String>> getNameAddressbyAcom(List<Map<String, String>> acomSearchList);

	// -----------------------------------------------------------------------------------------------------------
	
	// 카테고리별  시설 목록을 불러온다.
	List<Map<String, String>> getFacilityListByAcomCategory(String category_no);
	
	


}
