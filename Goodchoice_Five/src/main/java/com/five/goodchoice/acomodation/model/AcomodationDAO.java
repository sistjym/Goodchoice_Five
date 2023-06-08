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

		// isExistCategory_no 는 입력받은 category_no 가 DB 내부에 존재하는 확인하는 메소드이다.
		@Override
		public boolean isExistCategory_no(String category_no) {
			boolean boolExistCategoryNo = false; 
			String n = sqlsession.selectOne("acomodation.isExistCategory_no", category_no);
			
			if(Integer.parseInt(n) > 0) { // category_no exist
				boolExistCategoryNo = true;
			}
			
			return boolExistCategoryNo;
		}

		// 카테고리에 따른 지역번호가 존재하는지 확인하는 메소드
		@Override
		public String isDistrictNoByCategoryNo(Map<String, String> paraMap) {
			String isExist = sqlsession.selectOne("acomodation.isDistrictNoByCategoryNo", paraMap);
			return isExist;
		}

		// category_id 별 존재하는  fac_no 인지 확인하는 메소드
		@Override
		public String isExistFacNo(Map<String, String> paraMap) {
			String isExist = sqlsession.selectOne("acomodation.isExistFacNo", paraMap);
			return isExist;
		}

		// district_no 입력해서 prov_name 과 sub_city_name 을 알아오는 메소드
		@Override
		public Map<String, String> getSubtopBtnData(String district_no) {
			Map<String, String> subTopBtnDataMap = sqlsession.selectOne("acomodation.getSubtopBtnData", district_no);
			
			return subTopBtnDataMap;
		}

		// category_no를 입력받아서 그에 해당하는 prov_no 를 가져오는 메소드
		@Override
		public List<Map<String, String>> getCityListByCategory(String category_no) {
			List<Map<String, String>> cityListByCategoryMap = sqlsession.selectList("acomodation.getCityListByCategory", category_no);
			
			return cityListByCategoryMap;
		}

		// category_no 와 prov_no 를 입력받아서 지역별 어느 지역구가 있는지 조회
		@Override
		public List<Map<String, String>> getDistrictListByCategoryProvNo(Map<String, String> paraMap) {
			List<Map<String, String>> districtListByCategoryProvNoMap = sqlsession.selectList("acomodation.getDistrictListByCategoryProvNo", paraMap);
			return districtListByCategoryProvNoMap;
		}

		//  입력된 날짜에 대해 예약이 가능한 지역번호별 객실번호를 가져온다.
		@Override
		public List<String> getAvailableRoomIdByProvNo(Map<String, Object> filter_condition_Map) {
			List<String> availableRoomIdList = sqlsession.selectList("acomodation.getAvailableRoomIdByProvNo", filter_condition_Map);
			return availableRoomIdList;
		}

		// 모텔이 존재하는 지역번호와 지역명을 가져와야 한다.
		@Override
		public List<Map<String, String>> getcityListByMotel() {
			List<Map<String, String>> cityListByMotel = sqlsession.selectList("acomodation.getcityListByMotel");
			return cityListByMotel;
		}

		@Override
		public List<Map<String, String>> getDistrictListByProvNo(String prov_no) {
			List<Map<String, String>> districtListByProvNoMap = sqlsession.selectList("acomodation.getDistrictListByProvNo", prov_no);
			return districtListByProvNoMap;
		}
		
		
		
		

	
	

}
