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
	public List<String> getAvailableRoomNo(Map<String, Object> filter_condition_Map) {
		List<String> availableRoomNoList = sqlsession.selectList("acomodation.getAvailableRoomNo", filter_condition_Map);
		return availableRoomNoList; 
	}

	// 예약이 가능한 객실번호중에서 최소가격과 최대 가격으로 필터링 한 방들의 리스트
	@Override
	public List<String> getPriceFilterRoomNo(Map<String, Object> filter_condition_Map) {
		List<String> priceFilterRoomNoList = sqlsession.selectList("acomodation.getPriceFilterRoomNo", filter_condition_Map);		
		return priceFilterRoomNoList;		
	}

	// 객실번호별 가장 저렴한 가격을 기준으로 하는 숙소데이터를 가져오는 메소드
	@Override
	public List<Map<String, String>> getAcomodationByLowPrice(Map<String, Object> filter_condition_Map) {
		List<Map<String, String>> searchAcomList = sqlsession.selectList("acomodation.getAcomodationByLowPrice", filter_condition_Map);
		return searchAcomList;
	}

	// 숙소 데이터별 평점과 리뷰 갯수를 얻어온다.
	@Override
	public List<Map<String, String>> getRatingReviewCntByAcom(List<Map<String, String>> searchAcomList) {
		List<Map<String, String>> ratingReviewCntList = sqlsession.selectList("acomodation.getRatingReviewCntByAcom", searchAcomList);
		return ratingReviewCntList;
	}

	// 거리기준으로 정렬된 숙소리스트를 가져온다.
	@Override
	public List<Map<String, String>> getSortedListByDistance(List<Map<String, String>> searchAcomList) {
		List<Map<String, String>> resultMapList = sqlsession.selectList("acomodation.getSortedListByDistance", searchAcomList);
		return resultMapList;
	}

	// 낮은 가격 순으로 정렬된 숙소리스트를 가져온다.
	@Override
	public List<Map<String, String>> getSortedListByRowPrice(List<Map<String, String>> searchAcomList) {
		List<Map<String, String>> resultMapList = sqlsession.selectList("acomodation.getSortedListByRowPrice", searchAcomList);
		return resultMapList;
	}
	
	
	

}
