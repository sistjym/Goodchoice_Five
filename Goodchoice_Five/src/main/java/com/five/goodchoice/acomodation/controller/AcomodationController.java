package com.five.goodchoice.acomodation.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.concurrent.TimeUnit;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

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
		String check_out_date = request.getParameter("check_out_date");
		String min_price = request.getParameter("min_price"); 
		String max_price = request.getParameter("max_price");
		String[] arr_fac_no = request.getParameterValues("fac_no");
		
		Map<String, Object> filter_condition_Map = new HashMap<>();
		
		filter_condition_Map.put("category_no", category_no); // 호텔, 모텔, 펜션
		filter_condition_Map.put("district_no", district_no); // 지역구명: 강남구, 송파구	
		filter_condition_Map.put("check_in_date", check_in_date); // 예약 체크인 시간
		filter_condition_Map.put("check_out_date", check_out_date); // 예약 체크아웃 시간
		filter_condition_Map.put("min_price", min_price); // 객실 최소값
		filter_condition_Map.put("max_price", max_price); // 객실 최대값
		filter_condition_Map.put("arr_fac_no", arr_fac_no);
		filter_condition_Map.put("sort", sort);
		
		filter_condition_Map = filterConditionDefaultSet(filter_condition_Map); // 값이 넘어오지 않는 경우 default 값을 세팅하는 메소드

		Map<String, String> parametersValidityMap = getParametersValidity(filter_condition_Map); // 파라미터가 유효한 value 인지 확인하는 메소드
		
		if(Boolean.parseBoolean(parametersValidityMap.get("bool"))) {
			
			request.setAttribute("message", parametersValidityMap.get("message"));
			request.setAttribute("loc", parametersValidityMap.get("loc"));
			return "msg";
			
		}


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
		List<Map<String, String>> facilityListByAcomCategory = service.getFacilityListByAcomCategory((String)filter_condition_Map.get("category_no"));   

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
		String str_fac_no;
		
		str_fac_no = arr_fac_no == null ? "" : String.join(",", arr_fac_no);
		filter_condition_Map.put("str_fac_no", str_fac_no); // 시설 체크박스의 값을 유지하기 위함
		
		request.setAttribute("facilityListByAcomCategory", facilityListByAcomCategory);
		request.setAttribute("acomSearchList", acomSearchList);
		request.setAttribute("filter_condition_Map", filter_condition_Map);
		
		
		
		
		return "acomodation/acom_content.tiles2";
	}
	
	
	private Map<String, Object> filterConditionDefaultSet(Map<String, Object> filter_condition_Map) {


		
		Map<String, Object> resultMap = filter_condition_Map;
		/*
		  
		  현재 URL 을 통하여 넘어오는 데이터는 다음과 같다.
		 category_no, district_no, check_in_date, check_out_date, min_price
		 , max_price, fac_no, sort
		 
		 category_no : Integer인지 확인이 필요하며 음수인지 확인이 필요 DB내부에 존재하는지 확인이 필요하다.(부합할 경우  default 는 1)
		 district_no : Integer이고 음수인지 확인 category_no 별 DB내부에 존재하는지 확인이 필요하다. (부합할 경우 default 는 2)
		 
		 check_in_date : date 타입이어야 한다. 2022-06-05 형식으로 정규표현식을 적용할 것 (정규표현식에 부합할 경우 default 오늘 날짜)
		 check_out_date : date 타입이어야 한다. 2022-06-08 형식으로 정규표현식을 적용할 것 (정규표현식에 부합할 경우 default 내일 날짜)
		  두 날짜의 차이의 일수가 7 이상이면 default 로 오늘과 내일의 날짜를 세팅할 것
		 check_in_date 가 check_out_date 보다 이후 날짜인 경우에도 오늘과 내일 날짜로 세팅할 것
		 check_in_date 와 check_out_date 가 동일한 경우에도 처리할 것

		 min_price : Integer.parseInt 음수인지 확인(default 10000) 
		 max_price : Integer.parseInt -1을 제외한 음수인지 확인(default -1)
		 
		 fac_no : null 이 아닐때만 실행하며 Integer 이다. 음수인지 확인 각각의 fac_no 에 대해서 입력받은 category_id 에 존재하는 fac_no 인지 사실확인이 필요하다.
		 sort : DISTANCE, ROWPRICE, HIGHPRICE 이외에는 올 수 없으며 그 이외가 오면 default는 DISTANCE이다.
		 
		 */
		
		// category_no
		String category_no = (String)filter_condition_Map.get("category_no");
		
		if(Myutil.checkIsNull(category_no)) {
			category_no = "1";
		}
		
		// district_no
		String district_no = (String)filter_condition_Map.get("district_no");
		
		if(Myutil.checkIsNull(district_no)) {
			district_no = "2";
		}
		
		// 위의 것은 QueryString 이 아닌데 처리해야하는 것인지 의문이다.
		
		// check_in_date, check_out_date
		String check_in_date = (String)filter_condition_Map.get("check_in_date");
		String check_out_date = (String)filter_condition_Map.get("check_out_date");
		
		if(Myutil.check_Invalid_String(check_in_date) || Myutil.check_Invalid_String(check_out_date)) {
			check_in_date = Myutil.getDefaultCheckInDate(); // 체크인 날짜가 null 이거나 공백으로 오면 오늘 날짜를 가져온다.
			check_out_date = Myutil.getDefaultCheckOutDate(); // 체크아웃 날짜가 null 이거나 공백으로 오면 내일 날짜를 가져온다.
		}
				 
		// min_price, max_price
		String min_price = (String)filter_condition_Map.get("min_price");
		String max_price = (String)filter_condition_Map.get("max_price");	
		
		if(Myutil.check_Invalid_String(min_price) || Myutil.check_Invalid_String(max_price)){
			min_price = "10000"; // min_price 가 공백이나 null 이 오는 경우에는 10000 으로 설정
			max_price = "-1";	 // max_price 가 공백이나 null 이 오는 경우에는 -1 으로 설정		
		}
		else if("10000".equals(min_price) && "300000".equals(min_price)){ // null은 아니지만 10000 ~ 300000 은 만원 이상으로 간주한다.
			min_price = "10000"; 
			max_price = "-1";	 
		}
		
		
		// fac_no 는 null 일 때를 처리하지 않는다.
		// Service 단에서 (arr_fac_no != null && arr_fac_no.length > 0) 조건을 붙여 처리하기 때문
		// sort는 RequestParam 으로 default를 DISTANCE 로 정의하고 있다.
				 	
		resultMap.put("category_no", category_no);
		resultMap.put("district_no", district_no);
		resultMap.put("check_in_date", check_in_date);
		resultMap.put("check_out_date", check_out_date);
		resultMap.put("min_price", min_price);
		resultMap.put("max_price", max_price);
			
		return resultMap;
	}
	
	private Map<String, String> getParametersValidity(Map<String, Object> filter_condition_Map) {
		
		Map<String, String> parametersValidityMap = new HashMap<>();
		
		String bool = "false"; // 초기치 false
		String message = "";
		String loc = "";
		String regex = "";
		Pattern pattern = null;
		
		Map<String, String> paraMap = new HashMap<>(); // Mapper 에 데이터를 전달하기 위한 Map 
		
		// 입력받은 category_no 에 해당하는 district_no 가 있는지 확인해야한다.
		String category_no = (String)filter_condition_Map.get("category_no");
		String district_no = (String)filter_condition_Map.get("district_no");
				
		paraMap.put("category_no", category_no);
		paraMap.put("district_no", district_no);
		
		
		// category_no, district_no
		if("0".equals(service.isDistrictNoByCategoryNo(paraMap))) { // 카테고리에 따른 지역번호가 존재하는지 확인하는 메소드
			
			bool = "true";
			message = "유효하지 않은 페이지입니다. (지역번호가 존재하지 않음)";
			loc = "javascript:history.back()";
			
			parametersValidityMap.put("bool", bool); // 초기치 false
			parametersValidityMap.put("message", message);
			parametersValidityMap.put("loc", loc);
			
			return parametersValidityMap;
			
		}
		
		///////////////////////////////////////////////////////////////////////////////////
	 	
		// check_in_date, check_out_date
		String check_in_date = (String)filter_condition_Map.get("check_in_date");
		String check_out_date = (String)filter_condition_Map.get("check_out_date");
				
		
		regex = "^[1-9]\\d{3}-\\d{2}-\\d{2}$"; // 년도의 맨 앞 숫자는 0을 허용하지 않는다.
		pattern = Pattern.compile(regex);
				
		if(!pattern.matcher(check_in_date).matches() || !pattern.matcher(check_out_date).matches()) { // 둘 중 하나라도 유효성 검사에 맞지 않는 경우 

			bool = "true";
			message = "체크인 날짜와 체크아웃 날짜가 형식에 맞지 않습니다.";
			loc = "javascript:history.back()";
			
			parametersValidityMap.put("bool", bool); // 초기치 false
			parametersValidityMap.put("message", message);
			parametersValidityMap.put("loc", loc);
			
			return parametersValidityMap;

			
		}
	
		// 두 날짜의 일수의 차이는 7 이상이 될 수 없음
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd"); // 2023-06-05
		long diffInDays = 0; // 두날짜의 차이
		try {
			
			Date date1 = dateFormat.parse(check_in_date);
			Date date2 = dateFormat.parse(check_out_date);
			
			long diffInMilliseconds = date2.getTime() - date1.getTime();
			diffInDays = TimeUnit.DAYS.convert(diffInMilliseconds, TimeUnit.MILLISECONDS);
			
			// Ms 를 Day로 convert
			
		}
		catch (ParseException e) {
			e.printStackTrace();
		}
		
		if(diffInDays >= 7) {			
			bool = "true";
			message = "예약 가능한 일수는 최대 7일입니다.";
		}
		else if(diffInDays == 0){
			bool = "true";
			message = "체크인 날짜와 체크아웃날짜는 동일할 수 없습니다.";
		}
		else if(diffInDays < 0) {
			bool = "true";
			message = "체크인 날짜는 체크아웃 날짜보다 이전이어야 합니다.";
		}
		
		///////////////////////////////////////////////////////////////////////////////////
		
		
		// min_price, max_price
		
		String min_price = (String)filter_condition_Map.get("min_price");
		String max_price = (String)filter_condition_Map.get("max_price");
		
		regex = "^[1-9]\\d{0,3}0{4}$"; // 1만 부터 9999만 까지 올 수 있음
		pattern = Pattern.compile(regex);
		
		if(!Myutil.isNumericalStr(min_price) || !Myutil.isNumericalStr(max_price)) {
			bool = "true";
			message = "숫자가 아닌 값은 가격으로 올 수 없습니다.";
		}
		else if(Integer.parseInt(min_price) < 0 || ( Integer.parseInt(max_price) != -1  && Integer.parseInt(max_price) < 0)) {
			bool = "true";
			message = "가격은 음수가 올 수 없습니다.";
		}
		else if(!pattern.matcher(min_price).matches() || (Integer.parseInt(max_price) != -1  && !pattern.matcher(max_price).matches())) {
			bool = "true";
			message = "금액의 단위는 1만 ~ 9999만까지 가능합니다.";
		}
		else if(Integer.parseInt(max_price) != -1  && (Integer.parseInt(min_price) - Integer.parseInt(max_price) > 0)) {
			bool = "true";
			message = "최소금액이 최대금액보다 클 수 없습니다.";
		}
		
		
		///////////////////////////////////////////////////////////////////////////////////
		
		// arr_fac_no
		if(filter_condition_Map.get("arr_fac_no") != null) {
			
			String[] arr_fac_no = (String[])filter_condition_Map.get("arr_fac_no");
		 
			boolean isAvailableFacNoBool = false; // 유효한 시설번호인지 판별하는 boolean			
			for(String fac_no : arr_fac_no) {
				
				paraMap.put("fac_no", fac_no);
					
				if(!Myutil.isNumericalStr(fac_no)) {
					//System.out.println("1");
					isAvailableFacNoBool = true;
					break;
				}
				
				String isExistFacNo = service.isExistFacNo(paraMap); // category_id 별 존재하는  fac_no 인지 확인하는 메소드
				
				if(Integer.parseInt(fac_no) < 0) {
					//System.out.println("2");
					isAvailableFacNoBool = true;
					break;
				}
				else if("0".equals(isExistFacNo)) {
					//System.out.println("3");
					isAvailableFacNoBool = true;
					break;
				}	
				
			}// end of for(String fac_no : arr_fac_no){}--------------------------------
			
			
			if(isAvailableFacNoBool) {
				bool = "true";
				message = "존재하지 않는 시설입니다.";
			}
			
			
		}// end of if(filter_condition_Map.get("arr_fac_no") != null) ---------------------
		
		///////////////////////////////////////////////////////////////////////////////////
		
		// sort
		String sort = (String)filter_condition_Map.get("sort");
		if( !( sort.equals("DISTANCE") || sort.equals("ROWPRICE") || sort.equals("HIGHPRICE") )) { // 오직 "DISTANCE", "ROWPRICE", "HIGHPRICE" 만 올 수 있음
			bool = "true";
			message = "유효하지 않은 정렬 방식입니다.";
		}

		
		///////////////////////////////////////////////////////////////////////////////////
		
		
		if(Boolean.parseBoolean(bool)) {
			loc = "javascript:history.back()";
		}
		
		parametersValidityMap.put("bool", bool); // 초기치 false
		parametersValidityMap.put("message", message);
		parametersValidityMap.put("loc", loc);
		
		return parametersValidityMap;
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
