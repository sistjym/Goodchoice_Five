<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/product_subtop.css" />

<script type="text/javascript">
	$(document).ready(function(){
		
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
		
		$(".city > li").mouseover(function(event){
			console.log($(event.target));
			$(event.target).find("a").addClass("on");
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
		 	<h2>모텔</h2>
		 	<div class="area">
		 		<div class="btn-area">
		 			<span>서울</span>
		 			강남/역삼/삼성/논현
		 		</div>
		 		<div class="area_pop">
		 			<div class="iscroll_01">
		 				<ul class="city">
		 					<li><a href="#" class="on">서울</a></li>
		 					<li><a href="#">경기</a></li>
		 					<li><a href="#">부산</a></li>
		 					<li><a href="#">제주</a></li>
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