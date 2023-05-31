package com.five.goodchoice.acomodation.controller;

import java.util.*;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.five.goodchoice.acomodation.service.AcomodationService;
import com.five.goodchoice.acomodation.service.InterAcomodationService;
import com.five.goodchoice.util.Myutil;

@Controller
public class AcomodationController {
	
	@Autowired
	InterAcomodationService service = new AcomodationService();
	// 모텔 View	
	
	@GetMapping("/acomodation/search/{category_no}/{district_no}")
	public String acomodation_view_motel(HttpServletRequest request, @PathVariable String category_no, @PathVariable String district_no
										, @RequestParam(name="sort", required = false, defaultValue="DISTANCE") String sort) {

		// default 값은 아래와 같다.
		// https://www.goodchoice.kr/product/search/1/7052?sort=DISTANCE&check_in_date=2023-05-25&check_out_date=2023-05-26&min_price=10000&max_price=300000
		// 7052는 서울의 강남/역삼/삼성/논현 와 같은 데이터를 의미하고
		// check_in_date 는 체크인 날짜 check_out_date 는 체크아웃 날짜를 의미한다. default 는 오늘과 내일 1박2일이다.
		// min_price 는 최소금액 max_price 는 최대금액을 의미한다.
		// DISTANCE 는 거리순을 의미한다.
		
		String check_in_date = request.getParameter("check_in_date"); 
		String check_out_date = request.getParameter("check_in_date");
		String min_price = request.getParameter("min_price"); 
		String max_price = request.getParameter("max_price");
		
		
		if(Myutil.check_Invalid_String(min_price) || Myutil.check_Invalid_String(max_price)){
			min_price = "10000"; // min_price 가 공백이나 null 이 오는 경우에는 10000 으로 설정
			max_price = "-1";	 // max_price 가 공백이나 null 이 오는 경우에는 -1 으로 설정		
		}
		
		if(Myutil.check_Invalid_String(check_in_date) || Myutil.check_Invalid_String(check_out_date)) {
			check_in_date = Myutil.getDefaultCheckInDate(); // 체크인 날짜가 null 이거나 공백으로 오면 오늘 날짜를 가져온다.
			check_out_date = Myutil.getDefaultCheckOutDate(); // 체크아웃 날짜가 null 이거나 공백으로 오면 내일 날짜를 가져온다.
		}
		 	
		
		Map<String, Object> filter_condition_Map = new HashMap<>();
		
		filter_condition_Map.put("category_no", category_no); // 호텔, 모텔, 펜션
		filter_condition_Map.put("district_no", district_no); // 지역구명: 강남구, 송파구	
		filter_condition_Map.put("check_in_date", check_in_date); // 예약 체크인 시간
		filter_condition_Map.put("check_out_date", check_out_date); // 예약 체크아웃 시간
		
		// 예약이 가능한 객실번호의 리스트 가져오기
		List<String> availableRoomNoList = service.getAvailableRoomNo(filter_condition_Map);
		
		/*
		for(String room_no : availableRoomNoList) {
			System.out.println("room_no : " + room_no);
		}
		*/
		
		filter_condition_Map.put("availableRoomNoList", availableRoomNoList); // 예약 가능한 room_id
		filter_condition_Map.put("min_price", min_price); // 객실 최소값
		filter_condition_Map.put("max_price", max_price); // 객실 최대값
		
		// 예약이 가능한 객실번호중에서 최소가격과 최대 가격으로 필터링 한 방들의 리스트 가져오기
		availableRoomNoList = service.getPriceFilterRoomNo(filter_condition_Map);
		
		/*
		for(String room_no : availableRoomNoList) {
			System.out.println("room_no : " + room_no);
		}
		*/
				
		// 객실번호별 가장 저렴한 가격을 기준으로 하는 숙소데이터를 가져오기
		filter_condition_Map.put("availableRoomNoList", availableRoomNoList);
		
		List<Map<String, String>> searchAcomList = service.getAcomodationByLowPrice(filter_condition_Map);
		
	/*	
		for(Map<String, String> map : searchAcomList) {
			System.out.println(map.get("acom_no"));
			System.out.println(map.get("acom_name"));
			System.out.println(map.get("full_address"));
			System.out.println(map.get("price"));
		}
	*/	
		
		// 숙소 데이터별 평점과 리뷰 갯수를 얻어온다.
		List<Map<String, String>> ratingReviewCntList = service.getRatingReviewCntByAcom(searchAcomList);
		
		/*
		for(Map<String, String> map : ratingReviewCntList) {
			System.out.println("rating_no : " + map.get("acom_no"));
			System.out.println("rating_avg : " + map.get("rating_avg"));
			System.out.println("rating_cnt : " + map.get("rating_cnt"));
		}
		*/
		
		// searchAcomList 에 구해온 별점과 별점갯수를 추가한다.
		for(Map<String, String> acomMap : searchAcomList) {			 
			
			for(Map<String, String> ratingMap : ratingReviewCntList) {
					
				if(ratingMap.get("acom_no").equals(acomMap.get("acom_no"))) {
					
					acomMap.put("rating_avg", ratingMap.get("rating_avg"));
					acomMap.put("rating_cnt", ratingMap.get("rating_cnt"));
					
					break;
				}	
			}
			
		}
		/*
		for(Map<String, String> map : searchAcomList) {
			System.out.println("acom_no : " + map.get("acom_no"));
			System.out.println("acom_name : " + map.get("acom_name"));
			System.out.println("full_address : " + map.get("full_address"));
			System.out.println("price : " + map.get("price"));
			System.out.println("rating_avg : " + map.get("rating_avg"));
			System.out.println("rating_cnt : " + map.get("rating_cnt"));
			System.out.println("-----------------------------------------");
		}
		*/
		
		List<Map<String, String>> resultMapList = null;
		
		switch (sort) {
		
		case "DISTANCE" : // 거리순

			// 거리기준으로 정렬된 숙소리스트를 가져온다.
			resultMapList = service.getSortedListByDistance(searchAcomList);
			
			for(Map<String, String> resultMap : resultMapList) {
				
				for(Map<String, String> acomMap : searchAcomList) {
					
					if(resultMap.get("acom_no").equals(acomMap.get("acom_no"))) {
						
						resultMap.put("acom_name", 	  acomMap.get("acom_name"));
						resultMap.put("full_address", acomMap.get("full_address"));
						resultMap.put("price", 		  acomMap.get("price"));
						resultMap.put("rating_avg",   acomMap.get("rating_avg"));
						resultMap.put("rating_cnt",   acomMap.get("rating_cnt"));	
						break;
					}	
				}	
			}
						
			break;
			
		case "ROWPRICE": // 낮은 가격 순
			// 낮은 가격 순으로 정렬된 숙소리스트를 가져온다.	
			resultMapList = service.getSortedListByRowPrice(searchAcomList);			 				
			
			for(Map<String, String> resultMap : resultMapList) {
				
				for(Map<String, String> acomMap : searchAcomList) {
					
					if(resultMap.get("acom_no").equals(acomMap.get("acom_no"))) {
						
						resultMap.put("acom_name", 	  acomMap.get("acom_name"));
						resultMap.put("full_address", acomMap.get("full_address"));
						resultMap.put("rating_avg",   acomMap.get("rating_avg"));
						resultMap.put("rating_cnt",   acomMap.get("rating_cnt"));	
						break;
					}	
				}	
			}
			
			break;
		
		case "HIGHPRICE": // 높은 가격 순

			// 낮은 가격 순으로 정렬된 숙소리스트를 가져온 뒤 reverse 한다.	
			resultMapList = service.getSortedListByRowPrice(searchAcomList);			 				
			
			for(Map<String, String> resultMap : resultMapList) {
				
				for(Map<String, String> acomMap : searchAcomList) {
					
					if(resultMap.get("acom_no").equals(acomMap.get("acom_no"))) {
						
						resultMap.put("acom_name", 	  acomMap.get("acom_name"));
						resultMap.put("full_address", acomMap.get("full_address"));
						resultMap.put("rating_avg",   acomMap.get("rating_avg"));
						resultMap.put("rating_cnt",   acomMap.get("rating_cnt"));	
						break;
					}	
				}	
			}
			
			Collections.reverse(resultMapList);
			break;			

		default:
			break;
		}
		
		for(Map<String, String> resultMap : resultMapList) {
			System.out.println("acom_no : " +    resultMap.get("acom_no"));
			System.out.println("distance : " +   resultMap.get("distance"));
			System.out.println("acom_name : " +  resultMap.get("acom_name"));
			System.out.println("full_address : " + resultMap.get("full_address"));
			System.out.println("price : " + 	 resultMap.get("price"));
			System.out.println("rating_avg : " + resultMap.get("rating_avg"));
			System.out.println("rating_cnt : " + resultMap.get("rating_cnt"));
			System.out.println("-----------------------------------------");
		}

		
		
		
		return "acomodation/acom_content.tiles2";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 업소 등록
	@RequestMapping(value="/hostRegister.gc") 
	public String hostRegister() {
		return "host/accommodations_register.tiles3";
	}
	
	
	// 업소 정보 수정
	@RequestMapping(value="/hostEdit.gc") 
	public String hostEdit() {
		return "host/accommodations_edit.tiles3";
	}
}
