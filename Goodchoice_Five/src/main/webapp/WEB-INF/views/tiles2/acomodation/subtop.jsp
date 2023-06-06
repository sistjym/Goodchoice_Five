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
		
		<%-- Ajax 로 district_no 입력해서 prov_name 과 sub_city_name 을 알아오자 --%>
		$.ajax({
			url:"<%= request.getContextPath()%>/getSubtopBtnData.gc",
			data:{'district_no':'${requestScope.filter_condition_Map.district_no}'},
			type:"get",
			dataType:"json",
			//async:true, 비동기식
			success:function(json){
				
				// console.log(JSON.stringify(json));
				// {"prov_name":"서울","sub_city_name":"삼성/압구정/청담/논현"}
				$(".btn-area > span").text(json.prov_name);
				$(".sub_city").text(json.sub_city_name);
				
				
			},
			error: function(request, status, error){
	            alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
	        }
			
		});
		
		
		let is_mouseover_area_pop = false; <%-- 지역 pop 내부에 mouseover 여부 --%>
		
		$(".area_pop").css("display","none"); <%-- 초기에는 지역 pop 보이지 않음 --%>
		
		$(".btn-area").mouseover( <%-- 서울 > 강남/역삼  에 mouseover --%>
		function(){
			$(".area_pop").css("display",""); <%-- 지역 pop 보임 --%>
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
		
		
		<%-- 서울 > 강남/역삼  에 mouseover --%>		
		$(".city-a").mouseover( 

		function(event){
		
			$(".city-a").removeClass("on");
			$(event.target).addClass("on");
			<%-- 기존에 있던 모든 <a> 를 removeClass 하고 이벤트가 발생한 <a>에 addClass --%>	
			
			<%-- ajax로 기존에 있던 city_child change --%> 
			
		});
		
		
		
	});
	

</script>

<style type="text/css">
	.area_pop .city a.on {
	    color: rgb(230,28,81); <%-- 분홍색 --%>
	    background: url(//image.goodchoice.kr/images/web_v3/ico_arr_gt_2.png) right 10px bottom 50% no-repeat !important;
	    background-size: 10px auto !important;
	}
</style>

</head>
<body>
	<section class="subtop_wrap">	
		<section class="subtop">
		 	<h2>
		 	<c:choose>
					<c:when test="${requestScope.filter_condition_Map.category_no eq 1}">
						호텔
					</c:when>
					<c:when test="${requestScope.filter_condition_Map.category_no eq 2}">
						모텔
					</c:when>
					<c:when test="${requestScope.filter_condition_Map.category_no eq 3}">
						펜션
					</c:when>
			</c:choose>
		 	</h2>
		 	<div class="area">
		 		<div class="btn-area">
		 			<span></span>
		 			<strong class="sub_city">강남/역삼/삼성/논현</strong>
		 		</div>
		 		<div class="area_pop">
		 			<div class="iscroll_01">
		 				<ul class="city">
		 					<li><a href="#" class="city-a on">서울</a></li>
		 					<li><a href="#" class="city-a">경기</a></li>
		 					<li><a href="#" class="city-a">부산</a></li>
		 					<li><a href="#" class="city-a">제주</a></li>
		 				</ul>
		 			</div>
		 			<div class="iscroll_02">
		 				<ul class="city_child">
		 					<li><a href="#">서울 인기숙소</a></li>
		 					<li><a href="#">강남/역삼/삼성/논현</a></li>
		 					<li><a href="#">서초/신사/방배</a></li>
		 					<li><a href="#">잠실/방이</a></li>
		 				</ul>
		 			</div>		
		 		</div>
		 	</div>
		</section>
	</section>

</body>
</html>