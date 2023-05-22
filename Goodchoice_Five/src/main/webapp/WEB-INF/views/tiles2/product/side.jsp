<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">

  $(document).ready(function(){
	
	  <%-- slider 구현부 시작--%>
	  
	  let minPrice = 0;
	  let maxPrice = 0;
	  
	  $(function() { 
		    $( "#slider-range" ).slider({
		      range: true,
		      min: 1,
		      max: 30,
		      values: [ 1, 30 ],
		      slide: function( event, ui ) {
		        $( "#amount" ).val(  ui.values[ 0 ] + "만원 ~ " + ui.values[ 1 ] +"만원");
		        
		        minPrice = ui.values[ 0 ];
		        $("#min_price").val( Number(minPrice) * 10000 );
		        //console.log("minPrice : " + $("#min_price").val()); 
		        
		        maxPrice = ui.values[ 1 ];
		        $("#max_price").val( Number(maxPrice) * 10000 );
		        //console.log("maxPrice : " + $("#max_price").val());
		        
		      }
		    });
		    $( "#amount" ).val( $( "#slider-range" ).slider( "values", 0 ) + "만원" +
		      " ~ " + $( "#slider-range" ).slider( "values", 1 ) + "만원" );
		    
		     minPrice = $( "#slider-range" ).slider( "values", 0 );
		     $("#min_price").val( Number(minPrice) * 10000 );
		     //console.log("minPrice : " + $("#min_price").val()); 
		     
		    
		     maxPrice = $( "#slider-range" ).slider( "values", 1 );
		     $("#max_price").val( Number(maxPrice) * 10000 );
		     //console.log("maxPrice : " + $("#max_price").val());
		     
   
		  });
	  
	  <%-- slider 구현부 끝--%>	  	
	  

	  <%-- daterangepicker 구현부 시작--%>
   
	  $("#daterange").daterangepicker({
		   locale: {
			    "applyLabel": "확인",
		        "cancelLabel": "취소",
			    "daysOfWeek": ["일", "월", "화", "수", "목", "금", "토"],
			    "monthNames": ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"]
			    },
		   startDate: '05/20/2023',
		   endDate: '05/21/2023'
	     
	  });
	  
	  
	  let startDate = "";
	  let endDate = "";
	  
	  
	  let date = $("#daterange").val();
	  //console.log("datePickerDate : " + date);
	  date_set(date);
	  
	  
	  $("#daterange").change(function(){
		  
		  date = $("#daterange").val();
		  date_set(date);
		  
	  });
	
	  <%-- daterangepicker 구현부 끝--%>
	  
	  
	  
  });
  
  
  
  <%-- input#daterange 에 날짜 삽입 --%>
  function date_set(date){
	  
	  let offset = "";// 시간 계산을 위한 변수
	  
	  startDate = date.substr(0,5);
	  endDate = date.substr(13,5);
	  
	  startDate = startDate.substr(0,2) + "." + startDate.substr(3,2);
	  endDate = endDate.substr(0,2) + "." + endDate.substr(3,2);
	  
	  $("#daterange").val("   " + startDate + " - " + endDate);
	  
	  startDate = date.substr(0,10);
	  startDate = new Date(startDate);
	  offset = startDate.getTimezoneOffset() * 60000; // 우리나라 표준시를 계산해야 한다. ms단위라 60000 곱한다.
	  startDate = new Date(startDate - offset).toISOString();
	  startDate = startDate.substr(0,10);
	  
	  //console.log("startDate : " + startDate);
	  $("#sel_date").val(startDate);
	  
	  
	  endDate = date.substr(13,10);
	  endDate = new Date(endDate);
	  offset = endDate.getTimezoneOffset() * 60000; // 우리나라 표준시를 계산해야 한다. ms단위라 60000 곱한다.
	  endDate = new Date(endDate - offset).toISOString();
	  endDate = endDate.substr(0,10);
	  
	  //console.log("endDate : " + endDate);
	  $("#sel_date2").val(endDate);
	  
  }

  </script>
</head>
<body>

		<section id="filter" class="mx-4">
			<form name="product_filter_form">
				<section class="date-wrap">
					<h3 class="py-3 pl-2 filter_text">날짜</h3>						
					<input type="text" id="daterange" class="p-3 mr-4" style="background-image: url(<%=request.getContextPath()%>/resources/images/cal_icon.png);" readonly/>
					<input type="hidden" id="sel_date" name="sel_date" value=""/>
					<input type="hidden" id="sel_date2" name="sel_date2" value=""/>
				</section>
				
				<hr class="mt-4 mb-0">
				
				<section class="btn-wrap">
					<h3 class="py-3 pl-2 filter_text">상세조건</h3>
					<button type="button" class="mx-1 py-1 rounded">초기화</button>			
					<button type="button" class="mx-1 py-1 rounded">적용</button>
					<div style="clear:both;"></div>
				</section>
				
				<section style="margin-bottom:100px;">
					<h3 class="pt-4 pl-1 filter_text2">공용시설</h3>
					<ul class="facility">
						<li>
							<input type="checkbox" id="facno_0" name="fac_cnk" value="">
							<label for="facno_0" class="label_chk">수영장</label> 
						</li>
						<li>
							<input type="checkbox" id="facno_1" name="fac_cnk" value="">
							<label for="facno_1" class="label_chk">노래방</label> 
						</li>
						<li>
							<input type="checkbox" id="facno_2" name="fac_cnk" value="">
							<label for="facno_2" class="label_chk">당구장</label> 
						</li>
						<li>
							<input type="checkbox" id="facno_3" name="fac_cnk" value="">
							<label for="facno_3" class="label_chk">라운지</label> 
						</li>
					</ul>
					
				</section>
				
				<section style="margin-bottom:100px;">
					<h3 class="pt-4 pl-1 filter_text2">객실내시설</h3>
					<ul class="facility">
						<li>
							<input type="checkbox" id="itemno_0" name="item_cnk" value="">
							<label for="itemno_0" class="label_chk">게임기</label> 
						</li>
						<li>
							<input type="checkbox" id="itemno_1" name="item_cnk" value="">
							<label for="itemno_1" class="label_chk">빔프로젝터</label> 
						</li>
						<li>
							<input type="checkbox" id="itemno_2" name="item_cnk" value="">
							<label for="itemno_2" class="label_chk">세탁기</label> 
						</li>
						<li>
							<input type="checkbox" id="itemno_3" name="item_cnk" value="">
							<label for="itemno_3" class="label_chk">안마의자</label> 
						</li>
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