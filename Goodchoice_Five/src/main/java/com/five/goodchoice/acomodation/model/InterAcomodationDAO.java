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
	List<Map<String, String>> getDistrictListByCategoryProvNo(Map<String, String> paraMap);

	// 입력된 날짜에 대해 예약이 가능한 지역번호별 객실번호를 가져온다.
	List<String> getAvailableRoomIdByProvNo(Map<String, Object> filter_condition_Map);

	// 모텔이 존재하는 지역번호와 지역명을 가져와야 한다.
	List<Map<String, String>> getcityListByMotel();

	// 지역별 하위지역 리스트를 가져온다.
	List<Map<String, String>> getDistrictListByProvNo(String prov_no);

	// 숙소번호별 스펙을 가져온다.
	Map<String, String> getspecByAcom(String acom_no);
	
	


}
