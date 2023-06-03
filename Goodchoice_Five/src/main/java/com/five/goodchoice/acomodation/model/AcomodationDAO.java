package com.five.goodchoice.acomodation.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AcomodationDAO implements InterAcomodationDAO {

	@Autowired
	private SqlSessionTemplate sqlsession;
	
	
	// 입력된 날짜에 대해 예약이 가능한 객실번호를 조회해오는 메소드
	@Override
	public List<String> getAvailableRoomId(Map<String, Object> filter_condition_Map) {
		List<String> availableRoomIdList = sqlsession.selectList("acomodation.getAvailableRoomId", filter_condition_Map);
		return availableRoomIdList; 
	}

	// 예약이 가능한 객실번호 중에서 가격 조건을 적용한 방들의 리스트
	@Override
	public List<String> getPriceFilterRoomId(Map<String, Object> filter_condition_Map) {
		List<String> priceFilterRoomIdList = sqlsession.selectList("acomodation.getPriceFilterRoomId", filter_condition_Map);
		return priceFilterRoomIdList;
	}

	//가장 저렴한 객실의 가격을 기준으로 하는 숙소번호와 가격을 가져오는 메소드
	@Override
	public List<Map<String, String>> getAcomListByRowPrice(Map<String, Object> filter_condition_Map) {
		List<Map<String, String>> acomListByRowPrice = sqlsession.selectList("acomodation.getAcomListByRowPrice", filter_condition_Map);
		return acomListByRowPrice;
	}
	
	// 입력받은 시설 정보를 필터링하여 숙소번호를 구해오는 메소드
	@Override
	public List<String> getAcomListByfacilties(Map<String, Object> filter_condition_Map) {
		List<String> acomListByfacilties = sqlsession.selectList("acomodation.getAcomListByfacilties", filter_condition_Map);
		return acomListByfacilties;
	}
	
	// 거리기준으로 정렬된 숙소리스트를 가져온다.
		@Override
		public List<Map<String, String>> getSortedListByDistance(List<Map<String, String>> acomSearchList) {
			List<Map<String, String>> resultMapList = sqlsession.selectList("acomodation.getSortedListByDistance", acomSearchList);
			return resultMapList;
	}
		
		
	// 숙소 데이터별 평점과 리뷰 갯수를 얻어온다.
		@Override
		public List<Map<String, String>> getRatingReviewCntByAcom(List<Map<String, String>> acomSearchList) {
			List<Map<String, String>> ratingReviewCntList = sqlsession.selectList("acomodation.getRatingReviewCntByAcom", acomSearchList);
			return ratingReviewCntList;
	}

	//	숙소별 이름과 주소를 구하기
		@Override
		public List<Map<String, String>> getNameAddressbyAcom(List<Map<String, String>> acomSearchList) {
			List<Map<String, String>> nameAddressListbyAcom = sqlsession.selectList("acomodation.getNameAddressbyAcom", acomSearchList);
			return nameAddressListbyAcom;
		}

	// -------------------------------------------------------------------------------------------------------------------------------	
		
		// 카테고리별  시설 목록을 불러온다.
		@Override
		public List<Map<String, String>> getFacilityListByAcomCategory(String category_no) {
			List<Map<String, String>> facilityListByAcomCategory = sqlsession.selectList("acomodation.getFacilityListByAcomCategory", category_no);
			return facilityListByAcomCategory;
		}
		
		
		

	
	

}
