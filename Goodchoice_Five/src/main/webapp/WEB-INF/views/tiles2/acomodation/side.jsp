<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">

  $(document).ready(function(){
		  
	  <%-- daterangepicker 구현부 시작--%>
	  <%-- 체크인, 체크아웃 날짜 기본 세팅 --%>  
	  let check_in_date =  '${requestScope.filter_condition_Map.check_in_date}'; <%-- yyyy-MM-dd 가 넘어올 예정 --%>
	  check_in_date = formatUsdate(check_in_date); // 날짜 포맷
	  let before_check_in_date = check_in_date; // 초기치는 오늘 날짜 이다.

	  let check_out_date =  '${requestScope.filter_condition_Map.check_out_date}'; <%-- yyyy-MM-dd 가 넘어올 예정 --%>
	  check_out_date = formatUsdate(check_out_date);
	  let before_check_out_date = check_out_date; // 초기치는 내일 날짜 이다.

	  
	  viewDateRangePicker(check_in_date, check_out_date);
	  
	  console.log($("#daterange").val());
	  let date = $("#daterange").val(); // default date 오늘날짜 - 내일날짜
	  
	  let dateObj = {
			  			"date": date,
			  			"before_check_in_date" : before_check_in_date,
			  			"before_check_out_date" : before_check_out_date
	 			 }
	  
	  date_set(dateObj); // input 태그 내용 변경 메소드
	  
	  
	  $("#daterange").change(function(){ <%-- datePicker 변경 시 event --%>
		  
		  date = $("#daterange").val();
		  // console.log(date); // 06/09/2023 - 06/13/2023
		  dateObj["date"] = date;
		  
		  date_set(dateObj);
	  
	  });
	
	  <%-- daterangepicker 구현부 끝--%>
	
	  <%-- 최소금액 최대금액  세팅 --%>
	  
	  const min_price = Number(${requestScope.filter_condition_Map.min_price})/10000; // price의 단위는 10000
	  let max_price = ${requestScope.filter_condition_Map.max_price}; 
	  max_price = max_price == '-1' ? 30 : Number(max_price)/10000; // -1 이면 30 이 default

	  
	  
	  // arr_fac_no 이 null 이 아닐 경우 체크박스를 체크해야한다.
	  
	  if('${requestScope.filter_condition_Map.str_fac_no}' != ''){
		  
	      const str_fac_no = '${requestScope.filter_condition_Map.str_fac_no}'; // arr_fac_no 를 ,로 결합시킨 String 
	      const arr_fac_no = str_fac_no.split(',');

	      $("input[name='fac_no']").each(function(i, elmt) {
	    	  let inputFacNo = elmt.value;
	    	  
	    	  $.each(arr_fac_no, function(idx, arrFacNo) {
	    		  
	    	    if (inputFacNo === arrFacNo) {
	    	      $(elmt).prop("checked", true);
	    	      return false;
	    	    }
	    	    
	    	  });
	    	  
	      });
	    
	  }
	  
	  	  
	  <%-- slider 구현부--%>
	  view_slider(min_price, max_price);
	  
	  $("input[name='sort']").val('${requestScope.filter_condition_Map.sort}');

	  
	  <%-- 거리순, 가격 낮은 순, 가격 높은순 눌렀을때 on 이라는 class가 추가되어야 한다. --%>
	  const sort = '${requestScope.filter_condition_Map.sort}';
	  $("button#"+sort).find("span").addClass("on");
		  
	   
	  
	 
	  
  });

  
  function dateRangePickerDefaultSet(){
	  
	  <%-- 체크인, 체크아웃 날짜 기본 세팅 --%>  
	  let check_in_date =  '${requestScope.filter_condition_Map.check_in_date}'; <%-- yyyy-MM-dd 가 넘어올 예정 --%>
	  check_in_date = formatUsdate(check_in_date); // 날짜 포맷
	  let before_check_in_date = check_in_date; // 초기치는 오늘 날짜 이다.

	  let check_out_date =  '${requestScope.filter_condition_Map.check_out_date}'; <%-- yyyy-MM-dd 가 넘어올 예정 --%>
	  check_out_date = formatUsdate(check_out_date);
	  let before_check_out_date = check_out_date; // 초기치는 내일 날짜 이다.

	  <%-- daterangepicker 구현부 시작--%>
   
	  viewDateRangePicker(check_in_date, check_out_date);
	  
  }
  
  function viewDateRangePicker(check_in_date, check_out_date){
	  
	  $("#daterange").daterangepicker({
		   locale: {
			    "applyLabel": "확인",
		        "cancelLabel": "취소",
			    "daysOfWeek": ["일", "월", "화", "수", "목", "금", "토"],
			    "monthNames": ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"]
			    },
		   startDate: check_in_date, 
		   endDate: check_out_date
		   
	     
	  });
	  
  }
  
  <%-- Us 의 LocaleDate Type('MM/dd/yyyy') 으로 Formatting 해주는 함수 --%>
  function formatUsdate(date){
	 	 
	  let format_date = new Date(date);	  
	  format_date = format_date.toLocaleDateString('en-US'); // US 의 LocaleString 로 해주어야 한다.
	
	  return format_date;
  }
  
  function check_date_diff(dateObj){ <%-- 입력받은 date의 날짜의 차이가 7 이상인지 확인하는 함수 --%>
	
  	let bool = false;
  
    let firstDate  = new Date(dateObj.date.substr(0, 10));
    let secondDate  = new Date(dateObj.date.substr(13, 10));
    
    let timeDiff = secondDate.getTime() - firstDate.getTime(); <%-- 두 날짜의 밀리초 단위 시간을 가져온다 --%>
    let dayDiff = Math.floor(timeDiff / (1000 * 3600 * 24));

    if(dayDiff >= 7){
    	
    	<%-- 만약 날짜 차이가 7 이상이면 datePicker 를 변경해주어야 한다. --%>
    	alert('최대 선택 가능한 일수는 7일입니다.');
    	viewDateRangePicker(dateObj.before_check_in_date, dateObj.before_check_out_date);
    	return true;
    }
  	
  	
   
  }
  
  <%-- input#daterange 에 날짜 삽입 --%>
  function date_set(dateObj){
	   
	  date = dateObj.date;
	  
	  if(check_date_diff(dateObj)){ <%-- 입력받은 date의 날짜의 차이가 7 이상인지 확인해서 true면 지금 함수 종료 --%>
		  return;
	  }
	  
	  dateObj["before_check_in_date"] = date.substr(0, 10); // 날짜 차이가 7이상이 아닐 때만 값이 변경됨
	  dateObj["before_check_out_date"] = date.substr(13, 10);
	  	  
	  //console.log("dateObj.before_check_in_date : " + dateObj.before_check_in_date);
	  //console.log("dateObj.before_check_out_date : " + dateObj.before_check_out_date);

	  
	  let offset = "";// 시간 계산을 위한 변수
	  
	  let startDate = date.substr(0,5);
	  let endDate = date.substr(13,5);
	  
	  startDate = startDate.substr(0,2) + "." + startDate.substr(3,2);
	  endDate = endDate.substr(0,2) + "." + endDate.substr(3,2);
	  
	  $("#daterange").val("   " + startDate + " - " + endDate);
	  
	  startDate = date.substr(0,10);
	  startDate = new Date(startDate);
	  offset = startDate.getTimezoneOffset() * 60000; // 우리나라 표준시를 계산해야 한다. ms단위라 60000 곱한다.
	  startDate = new Date(startDate - offset).toISOString(); // yyyy-mm-dd
	  startDate = startDate.substr(0,10);
	  
	  
	  $("#check_in_date").val(startDate);
	  //console.log($("#check_in_date").val());
	  
	  
	  endDate = date.substr(13,10);
	  endDate = new Date(endDate);
	  offset = endDate.getTimezoneOffset() * 60000; // 우리나라 표준시를 계산해야 한다. ms단위라 60000 곱한다.
	  endDate = new Date(endDate - offset).toISOString();
	  endDate = endDate.substr(0,10);
	  
	  $("#check_out_date").val(endDate);
	  //console.log($("#check_out_date").val());
	  
  }
  
  function view_slider(minVal, maxVal){
	  
	  if(minVal == 1 && maxVal == 30){
		  $( "#amount" ).val(minVal + "만원 이상");  
	  }
	  else{
		  $( "#amount" ).val(  minVal + "만원 ~ " + maxVal +"만원");
	  }
	  
	  $("#min_price").val( Number(minVal) * 10000 );
	  $("#max_price").val( Number(maxVal) * 10000 );
	   
	  $( "#slider-range" ).slider({
	      range: true,
	      min: 1,
	      max: 30,
	      values: [ minVal, maxVal ],
	      slide: function( event, ui ) {
	    	
	    	if(ui.values[ 0 ] == 1 && ui.values[ 1 ] == 30)
	    		$( "#amount" ).val(ui.values[ 0 ] + "만원 이상");
	    	
	    	else
	    		$( "#amount" ).val(  ui.values[ 0 ] + "만원 ~ " + ui.values[ 1 ] +"만원");	
	    	
	          
	        minPrice = ui.values[ 0 ];
	        $("#min_price").val( Number(minPrice) * 10000 );
	        //console.log("minPrice : " + $("#min_price").val()); 
	        
	        maxPrice = ui.values[ 1 ];
	        $("#max_price").val( Number(maxPrice) * 10000 );
	        //console.log("maxPrice : " + $("#max_price").val());
	        	        
	      }
	  
	    });
	  
	  
  }

  function goSearch(sort){ <%-- 검색하러가는 역할 --%>
	  
  	$("input[name='sort']").val(sort); // sort 방식을 바꿔주어야 한다.
  	
  	
  	const searchFrm = document.product_filter_form;
  	searchFrm.method = "get";
  	searchFrm.action = "<%=request.getContextPath()%>/acomodation/search/" + "${requestScope.filter_condition_Map.category_no}/" + "${requestScope.filter_condition_Map.district_no}";
  	
  	// input text에 값을 직접입력하는 것이 아니기 때문에 이곳에서는 따로 유효성 검사할 필요는 없어 보인다.

  	searchFrm.submit();
  
  }
  
    
  function formReset(){
	  
	  <%-- slider 초기화 --%>
	  view_slider(1, 30);
 	   	  
	  <%-- datePicker 초기화 --%>
	  dateRangePickerDefaultSet();
	  
	  $("input[name='fac_no']").prop("checked", false);
	   

  }

  </script>
</head>
<body>

		<section id="filter" class="mx-4">
			<form name="product_filter_form">
				<input type="hidden" id="sort" name="sort" value=""/>
				<section class="date-wrap">
					<h3 class="py-3 pl-2 filter_text">날짜</h3>						
					<input type="text" id="daterange" class="p-3 mr-4" style="background-image: url(<%=request.getContextPath()%>/resources/images/cal_icon.png);" readonly/>
					<input type="hidden" id="check_in_date" name="check_in_date" value=""/>
					<input type="hidden" id="check_out_date" name="check_out_date" value=""/>
				</section>
			
				<hr class="mt-4 mb-0">
				
				<section class="btn-wrap">
					<h3 class="py-3 pl-2 filter_text">상세조건</h3>
					<button type="button" class="ml-2 py-1 rounded" onclick="formReset()">초기화</button>			
					<button type="button" class="mr-2 py-1 rounded" onclick='javascript:goSearch(document.getElementById("sort").value)'>적용</button>
					<div style="clear:both;"></div>
				</section>
			

				
				<section style="margin-bottom:100px;">
					<h3 class="pt-4 pl-1 filter_text2">공용시설</h3>
					<ul class="facility">
						
						<c:forEach var="facility" items="${requestScope.facilityListByAcomCategory}" varStatus="status">
							
							<c:if test="${facility.fac_type eq 0}">
								<li class="fac_chk_box_li">
									<input type="checkbox" id="facno_${status.index}" name="fac_no" value="${facility.category_fac_no}">
									<label for="facno_${status.index}" class="label_chk">${facility.category_fac_name}</label> 
								</li>																	
							</c:if>							
														
						</c:forEach>
						
					</ul>
					
				</section>
				
				<section style="margin-bottom:100px;">
					<h3 class="pt-4 pl-1 filter_text2">객실내시설</h3>
					<ul class="facility">
					
						<c:forEach var="facility" items="${requestScope.facilityListByAcomCategory}" varStatus="status">
							
							<c:if test="${facility.fac_type eq 1}">
								<li class="fac_chk_box_li">
									<input type="checkbox" id="itemno_${status.index}" name="fac_no" value="${facility.category_fac_no}">
									<label for="itemno_${status.index}" class="label_chk">${facility.category_fac_name}</label> 
								</li>																	
							</c:if>							
														
						</c:forEach>
						
					</ul>
					
				</section>		
						
				<div style="claer:both;"></div>						
				
				<section class="slider-wrap" style="margin-bottom:80px;">
					  <span class="pt-4 pl-1 filter_text">가격</span>
					  <input type="text" id="amount" readonly>
					  <input type="hidden" id="min_price" name="min_price" value=""/>		 
					  <input type="hidden" id="max_price" name="max_price" value=""/>
					  <div id="slider-range" class="mt-4"></div>
				</section>
				
				
			</form>
		</section>

</body>
</html>