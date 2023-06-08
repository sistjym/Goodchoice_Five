<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/product_subtop.css" />

<script type="text/javascript">
	$(document).ready(function(){
		
		let prov_no = '${requestScope.filter_condition_Map.prov_no}';
	
		<%-- 모든 지역구번호와 지역구 이름의 리스트를 가져온다. --%>
		$.ajax({
			url:"<%= request.getContextPath()%>/getCityListBy.gc",
			type:"get",
			dataType:"json",
			//async:false, 
			success:function(jsonArr){
				
			//	console.log(JSON.stringify(json));
			// [{"prov_no":"1","prov_name":"서울"},{"prov_no":"2","prov_name":"경기"},{"prov_no":"4","prov_name":"제주"},{"prov_no":"5","prov_name":"부산"}]	
				
				if(jsonArr.length > 0){
					
					$.each(jsonArr, function(i, elmt){
						// elmt -> json
						$(".city").append("<li id='city_"+elmt.prov_no+"' class='city-a'>"+elmt.prov_name+"</li>");						
					});
					
				}
				
			},
			error: function(request, status, error){
	            alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
	        }
			
		});
		
		*/
		let is_mouseover_area_pop = false; <%-- 지역 pop 내부에 mouseover 여부 --%>
		$(".area_pop").css("display","none"); <%-- 초기에는 지역 pop 보이지 않음 --%>
		
		
		$(".btn-area").mouseover( <%-- 서울 > 강남/역삼  에 mouseover --%>
		function(){
			$(".area_pop").css("display",""); <%-- 지역 pop 보임 --%>
			
		});
		
		$(".btn-area").mouseenter( <%-- 서울 > 강남/역삼  에 mouseenter --%>
		function(event){
			//showCityListByProvNo(prov_no);
		});
		
		
		
		$(".area_pop").hover(
		function(){
			is_mouseover_area_pop = true; <%-- 지역 pop 내부에 mouseover 해야 mouseout 을 할 때 pop 을 hide 가능 --%>
		},
		function(){
			if(is_mouseover_area_pop){ <%-- 지역 pop 내부에 mouseover 했다면 --%>
				$(".area_pop").css("display","none"); <%-- pop hide --%>
				is_mouseover_area_pop = false; <%-- 원상복귀 --%>
			}	
		});
		
		
		<%-- 서울, 경기, 부산, 제주  에 mouseover --%>
		
		$(document).on("mouseover", ".city-a", function(event){

			$(".city-a").removeClass("on");
			$(event.target).addClass("on");
			$(event.target).css("cursor","pointer");
			<%-- 기존에 있던 모든 <a> 를 removeClass 하고 이벤트가 발생한 <a>에 addClass --%>		
			
			//console.log($(event.target).attr("id").slice(-1));
			// 1 2 4 5
			prov_no = $(event.target).attr("id").slice(-1);
			//showCityListByProvNo(prov_no);
			
		});
		
		$(document).on("mouseover", "div.iscroll_02 li > a", function(event){
			
			$("div.iscroll_02 li > a").removeClass("on");
			$(event.target).addClass("on");
			$(event.target).css("cursor","pointer");
			
		})
		
		
		
	});
	
	<%-- prov_no 를 입력받아서 지역별 어느 지역구가 있는지 구해야함 --%>
	function showCityListByProvNo(prov_no){
	
		$.ajax({
			url:"<%= request.getContextPath()%>/showCityListByProvNo.gc",
			data:{'prov_no': prov_no},
			type:"get",
			dataType:"json",
			async:false, 
			success:function(jsonArr){
				
				console.log(JSON.stringify(jsonArr));
				
				
				if(jsonArr.length > 0){
					
					$(".city_child").empty(); // 이전의 것을 지운다.
					$(".city_child").append("<li><a href=''>"+$("#city_" + prov_no).text() +" 인기숙소</a></li>");
					
					$.each(jsonArr, function(i, elmt){
						// elmt -> json
						$(".city_child").append("<li><a href='<%=request.getContextPath()%>/acomodation/search/2/"+elmt.district_no+"'>"+elmt.sub_city_name+"</a></li>");						
					});

					
				}
					
				/*
					
 					<li><a href="#">강남/역삼/삼성/논현</a></li>
 					<li><a href="#">서초/신사/방배</a></li>
 					<li><a href="#">잠실/방이</a></li>
				*/
			
			},
			error: function(request, status, error){
	            alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
	        }
			
		});
		
		
	}
	
</script>

<style type="text/css">
	.area_pop .city .on {
	    color: rgb(230,28,81); <%-- 분홍색 --%>
	    background: url(//image.goodchoice.kr/images/web_v3/ico_arr_gt_2.png) right 10px bottom 50% no-repeat !important;
	    background-size: 10px auto !important;
	}
	
	div.iscroll_02 li > a.on {
		color: rgb(230,28,81);
	}
</style>

</head>
<body>
	<section class="subtop_wrap">	
		<section class="subtop">
		 	<h2>
		 	<c:choose>
					<c:when test="${prov_no eq 1}">
						서울
					</c:when>
					<c:when test="${prov_no eq 2}">
						경기
					</c:when>
					<c:when test="${prov_no eq 3}">
						강원
					</c:when>
					<c:when test="${prov_no eq 4}">
						제주
					</c:when>
					<c:when test="${prov_no eq 5}">
						부산
					</c:when>
			</c:choose>
				지역편
		 	</h2>
		 	<div class="area">
		 		<div class="btn-area">
		 			<span></span>
		 			<strong class="sub_city"></strong>
		 		</div>
		 		<div class="area_pop">
		 			<div class="iscroll_01">
		 				<ul class="city">
		 				
		 				</ul>
		 			</div>
		 			<div class="iscroll_02">
		 				<ul class="city_child">
		 				
		 				</ul>
		 			</div>		
		 		</div>
		 	</div>
		</section>
	</section>

</body>
</html>