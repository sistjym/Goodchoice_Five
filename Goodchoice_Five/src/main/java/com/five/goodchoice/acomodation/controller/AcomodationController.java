package com.five.goodchoice.acomodation.controller;

import java.util.*;

import javax.servlet.http.HttpServletRequest;

import org.apache.poi.hpsf.Array;
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
	public String acomodation_search_view(HttpServletRequest request, @PathVariable String category_no, @PathVariable String district_no
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
		String[] arr_fac_no = request.getParameterValues("fac_no");
		
		/*
		  category 별 district_no 가 존재하는 지 확인하는 작업이 필요할 것 같다.
		  URL 에 누가 장난을 칠수도 있기 때문
		  
		  */
		
		
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
		filter_condition_Map.put("min_price", min_price); // 객실 최소값
		filter_condition_Map.put("max_price", max_price); // 객실 최대값
		filter_condition_Map.put("arr_fac_no", arr_fac_no);
		filter_condition_Map.put("sort", sort);

		// 검색조건의 결과물의 숙소리스트를 가져온다.
		List<Map<String, String>> acomSearchList = service.getAcomSearchList(filter_condition_Map);
		
		/*
		for(Map<String, String> acomList : acomSearchList) {
	
				System.out.println("acom_no : " + acomList.get("acom_no"));
				System.out.println("acom_name : " + acomList.get("acom_name"));
				System.out.println("address : " + acomList.get("address"));
				System.out.println("price : " + acomList.get("price"));
				System.out.println("rating_avg : " + acomList.get("rating_avg"));
				System.out.println("rating_cnt : " + acomList.get("rating_cnt"));
				System.out.println("distance : " + acomList.get("distance"));
				System.out.println("------------------------------------------------------");
		
		}
		*/

		// 카테고리별  시설 목록을 불러온다.
		List<Map<String, String>> facilityListByAcomCategory = service.getFacilityListByAcomCategory(category_no);   

		/*
		for(Map<String, String> map : facilityListByAcomCategory) {
			
			System.out.println("category_fac_name : " + map.get("category_fac_name"));
			System.out.println("category_fac_no : " + map.get("category_fac_no"));
			System.out.println("fac_type : " + map.get("fac_type"));
			System.out.println("----------------------------------------------------");
			
		}
		
		
		category_fac_name : 야외테라스
		category_fac_no : 18
		fac_type : 0
		----------------------------------------------------
		category_fac_name : 스파
		category_fac_no : 19
		fac_type : 0
		----------------------------------------------------
		category_fac_name : 미니바
		category_fac_no : 20
		fac_type : 0
		----------------------------------------------------
		category_fac_name : 욕실TV
		category_fac_no : 21
		fac_type : 1
		----------------------------------------------------
		category_fac_name : 빔프로젝터
		category_fac_no : 22
		fac_type : 1
		----------------------------------------------------
		category_fac_name : 당구대
		category_fac_no : 23
		fac_type : 1
		----------------------------------------------------
		category_fac_name : 노래방
		category_fac_no : 24
		fac_type : 1
		----------------------------------------------------
		category_fac_name : 사우나
		category_fac_no : 17
		fac_type : 0
		----------------------------------------------------
		
		*/
		request.setAttribute("facilityListByAcomCategory", facilityListByAcomCategory);
		request.setAttribute("acomSearchList", acomSearchList);
		request.setAttribute("filter_condition_Map", filter_condition_Map);
		
		
		
		
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
