package com.five.goodchoice.acomodation.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.five.goodchoice.acomodation.model.AcomodationDAO;
import com.five.goodchoice.acomodation.model.InterAcomodationDAO;

@Service
public class AcomodationService implements InterAcomodationService {

	@Autowired
	InterAcomodationDAO dao = new AcomodationDAO();

	// 검색조건의 결과물의 숙소리스트를 가져온다.
	@Override
	public List<Map<String, String>> getAcomSearchList(Map<String, Object> filter_condition_Map) {
		
		List<Map<String, String>> acomSearchList = new ArrayList<>();
		
		// 1. 입력된 날짜에 대해 예약이 가능한 객실번호를 가져온다.
		List<String> availableRoomIdList = dao.getAvailableRoomId(filter_condition_Map);
		
		if(availableRoomIdList == null || availableRoomIdList.size() == 0) {
			return new ArrayList<>();
		}
		
		filter_condition_Map.put("availableRoomIdList", availableRoomIdList);
		
		// 2. 예약이 가능한 객실번호 중에서 가격 조건을 적용한 방들의 리스트
		availableRoomIdList = dao.getPriceFilterRoomId(filter_condition_Map);
		if(availableRoomIdList == null || availableRoomIdList.size() == 0) {
			return new ArrayList<>();
		}
		
		filter_condition_Map.put("availableRoomIdList", availableRoomIdList); // 기존의 availableRoomIdList 에 덮어 씌우기

		
		// 3. 가장 저렴한 객실의 가격을 기준으로 하는 숙소번호와 가격을 가져오는 메소드
		acomSearchList = dao.getAcomListByRowPrice(filter_condition_Map);		
		filter_condition_Map.put("acomSearchList", acomSearchList);
		
		// 4. 입력받은 시설 정보를 필터링하여 숙소번호를 구해오는 메소드(조건부)
		String[] arr_fac_no = (String[])filter_condition_Map.get("arr_fac_no");
		List<Map<String, String>> tempList = new ArrayList<>();
		
		
		if(arr_fac_no != null && arr_fac_no.length > 0) { 
			
			filter_condition_Map.put("arrFacLen", arr_fac_no.length);
			
			List<String> availableAcomList = dao.getAcomListByfacilties(filter_condition_Map); // 임시 저장

			for(Map<String, String> acomMap : acomSearchList) { // 구한 숙소번호의 acom_no 와 price 를 acomSearchList 에서 뽑아서 잠시
																// tempList 에 저장한다.	
				for(String availAcom : availableAcomList) {
					
					if(acomMap.get("acom_no").equals(availAcom)) {
						
						Map<String, String> tempMap = new HashMap<>();
						tempMap.put("acom_no", acomMap.get("acom_no"));
						tempMap.put("price", acomMap.get("price"));
						tempList.add(tempMap);	
						break;
						
					}
				}
				
			}
			
			if(tempList == null || tempList.size() == 0) {
				return new ArrayList<>();
			}
			
			acomSearchList = tempList;
						
		} // end of if(arr_fac_no != null && arr_fac_no.length > 0) ----------------------
				
		
		// 5. 거리, 낮은 가격순, 높은 가격순으로 정렬한다.
		String sort = (String)filter_condition_Map.get("sort");
		
		Comparator<Map<String, String>> priceComparator = null;
		
		switch (sort) {
			case "DISTANCE":
				
				tempList = dao.getSortedListByDistance(acomSearchList); // 거리순으로 정렬된 숙소 리스트

				for(Map<String, String> tempMap : tempList) {
					
					for(Map<String, String> acomMap : acomSearchList) {
						
						if(tempMap.get("acom_no").equals(acomMap.get("acom_no"))) {
							tempMap.put("price", acomMap.get("price"));
						}	
					}					
				}
				
				acomSearchList = tempList;
				
				break;
				
			case "ROWPRICE":
				
				priceComparator = new Comparator<Map<String, String>>(){
					@Override
					public int compare(Map<String, String> acomMap1, Map<String, String> acomMap2) {
						String price1 = acomMap1.get("price");
		                String price2 = acomMap2.get("price");
		                
		                int intPrice1 = Integer.parseInt(price1);
		                int intPrice2 = Integer.parseInt(price2);

		                // 오름차순으로 정렬합니다.
		                return Integer.compare(intPrice1, intPrice2);

					}
				};
				
				Collections.sort(acomSearchList, priceComparator);
				break;
				
			case "HIGHPRICE":
				
				priceComparator = new Comparator<Map<String, String>>(){
					@Override
					public int compare(Map<String, String> acomMap1, Map<String, String> acomMap2) {
						String price1 = acomMap1.get("price");
		                String price2 = acomMap2.get("price");
		                
		                int intPrice1 = Integer.parseInt(price1);
		                int intPrice2 = Integer.parseInt(price2);

		                // 내림차순으로 정렬합니다.
		                return Integer.compare(intPrice2, intPrice1);

					}
				};
				
				Collections.sort(acomSearchList, priceComparator);
				break;		
				
		default:
			break;
		}
		
		
		// 6. 숙소 데이터별 평점과 리뷰 갯수를 얻어온다.
		tempList = dao.getRatingReviewCntByAcom(acomSearchList); 
			
		for(Map<String, String> acomMap : acomSearchList) {
			
			for(Map<String, String> tempMap : tempList) {
				
				if(acomMap.get("acom_no").equals(tempMap.get("acom_no"))) {
					
					acomMap.put("rating_avg", tempMap.get("rating_avg"));
					acomMap.put("rating_cnt", tempMap.get("rating_cnt"));
					break;
				}
				
			}
		}
			
		// 7. 마지막으로 숙소별 이름과 주소를 더하고 종료
		
		tempList = dao.getNameAddressbyAcom(acomSearchList);
		
		for(Map<String, String> acomMap : acomSearchList) {
			
			for(Map<String, String> tempMap : tempList) {
				
				if(acomMap.get("acom_no").equals(tempMap.get("acom_no"))) {
					
					acomMap.put("acom_name", tempMap.get("acom_name"));
					acomMap.put("address", tempMap.get("address"));
					break;
				}
				
			}
		}

		return acomSearchList;
	}

	
	// 카테고리별  시설 목록을 불러온다.
	@Override
	public List<Map<String, String>> getFacilityListByAcomCategory(String category_no) {
		List<Map<String, String>> facilityListByAcomCategory = dao.getFacilityListByAcomCategory(category_no);

		return facilityListByAcomCategory;
	}

	
	// isExistCategory_no 는 입력받은 category_no 가 DB 내부에 존재하는 확인하는 메소드이다.
	@Override
	public boolean isExistCategory_no(String category_no) {
		boolean boolExistCategoryNo = dao.isExistCategory_no(category_no);
		return boolExistCategoryNo;
	}


	// 카테고리에 따른 지역번호가 존재하는지 확인하는 메소드
	@Override
	public String isDistrictNoByCategoryNo(Map<String, String> paraMap) {
		String isExist = dao.isDistrictNoByCategoryNo(paraMap); 
		return isExist;
	}


	// category_id 별 존재하는  fac_no 인지 확인하는 메소드
	@Override
	public String isExistFacNo(Map<String, String> paraMap) {
		String isExist = dao.isExistFacNo(paraMap); 
		return isExist;
	}

	
 	

	
	
}
