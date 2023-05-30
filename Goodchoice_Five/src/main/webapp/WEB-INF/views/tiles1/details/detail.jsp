v<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>

<%-- === #24. tiles 를 사용하는 레이아웃1 페이지 만들기 === --%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
    
<%
    String ctxPath = request.getContextPath();
    //    /Goodchoice_Five
%>    
    
<html>
<head>

<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/resources/bootstrap-4.6.0-dist/css/bootstrap.min.css" > 

<!-- Font Awesome 6 Icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">

<!-- 직접 만든 CSS -->


<!-- Optional JavaScript -->
<script type="text/javascript" src="<%= ctxPath%>/resources/js/jquery-3.6.4.min.js" type="text/javascript"></script>
<script type="text/javascript" src="<%= ctxPath%>/resources/bootstrap-4.6.0-dist/js/bootstrap.bundle.min.js" ></script> 

<!-- jQueryUI css 및 JS -->
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/resources/jquery-ui-1.13.1.custom/jquery-ui.min.css" />
<script type="text/javascript" src="<%= ctxPath%>/resources/jquery-ui-1.13.1.custom/jquery-ui.min.js"></script>


<style type="text/css">

div#container{

	border:solid 1px red;
	
	height: 7000px;
}

div#top{

	border:solid 10px purple;
	margin: 0 auto;
}


  div#top_left{ 
	
 	border:solid 5px gray; 
 } 


div#top_right{

	border:solid 5px magenta;
	
}





div#top_left > div#top_left_upper > img{
	
	 	border:solid 5px blue; 
	
	 	
	
		max-width: 100%;
    	height: 380px;
}

div#top_left > div#top_left_lower{
	
 	border:solid 3px skyblue; 
 	
 	margin-top: 10px;

}


div.carousel-inner {
	

	
	border: solid 3px black;
}

div.carousel-inner > div.carousel-item > img {

	
	height: 95px;

}



div#top_right > div#top_right_upper{

		border:solid 10px red;
	

}



div#top_right_upper h2#top_title{

	font-weight: bold;

}

div#top_right_upper p#top_address{

	color:   #a6a6a6;
	
	font-weight: 500;

}


div#top_right > div#top_right_lower{

		border:solid 5px skyblue;

		margin-top: 70px;
}




div#top_right_lower p#sajang, 
div#top_right_lower p#sajang_annae {

 margin-left: 26px; 
 margin-top: 13px;

} 

div#top_right_lower p#sajang_annae {


	color:   #a6a6a6;

		font-weight: 500;
	
}

	





div#tab{

	border:solid 3px orange;

	margin: 60px auto 0px auto;

}

div#night{

	border: solid 1px brown;
	
	height: 80px;
	margin: 60px auto 0px auto;
}

div#item{
		
		padding-top: 30px;
	
		margin: 60px auto 0px auto;
	
		margin-top:20px; 
		border:1px solid  #e0ebeb;

}


div#item img.item_image {

	

	height: 337px;


}



div#item p.in_roomtime,
div#item p.out_roomtime {

	margin-left: auto;
	font-weight: bold;

}



div#item a.btn_resv{

	color:white;

}



       .carousel-inner .carousel-item.active,
       .carousel-inner .carousel-item-next, 
       .carousel-inner .carousel-item-prev { 
         display: flex; 
           transition: transform 0.1s ease; 
         
       } 
      
       .carousel-inner .carousel-item-right.active, 
       .carousel-inner .carousel-item-next { 
         transform: translateX(25%); 
       } 
      
       .carousel-inner .carousel-item-left.active,  
       .carousel-inner .carousel-item-prev { 
         transform: translateX(-25%); 
       } 
        
       .carousel-inner .carousel-item-right, 
       .carousel-inner .carousel-item-left{  
         transform: translateX(0); 
       } 
       
    	
       
       
   
   .carousel-control-prev-icon,
	.carousel-control-next-icon {
  filter: invert(100%);
}

a.prev-left{

	margin-left: -23px;

}

a.prev-right{

	margin-right: -23px;

}



img.ci{

	height: 80px;
	
}



ul#badge span.badge{

	
	color: white;
	font-weight: 500;

}

ul#badge p.rec {
	
	margin-right: 440px;
	
	margin-top: 15px;

	color:   #cca300;
}


div.resv_cancel_top > p{

	
   background-color: #e0e0eb;
   color: #9494b8;
   width:125px;
}


/* 

아코디언


*/



.accordion_wrap {
	
	
	width: 80%;
	margin: 0 auto;
	
	}
	
	
	

	.accordion1 p a {
		padding:15px 30px 10px 20px;  
		line-height:26px; 
		color:black;
		font-weight: bold;
		font-size: 15pt;
		display:block;
		position:relative;
		outline:0;
		text-decoration:none;
		background-position:30px center;
		box-sizing:border-box;}
	
	.accordion1 div {
		width:50%;
		padding:5px 20px 25px 20px; 
		line-height:20px; 
		position:relative;
		height:auto;display:none;
		line-height:20px;
		color:black;}
		
	
		.accordion1 p a:after {
		  font-family: "Font Awesome 5 Free"; /* Font Awesome의 폰트 패밀리 */
 		  content: "\f0d7"; /* 원하는 아이콘의 유니코드 값 */ 
		  font-size: 25px;
		  color: #777;
		  float: right;
		  margin-left: 5px;
		}

		.accordion1 p.active1 a:after {
 		  font-family: "Font Awesome 5 Free"; /* Font Awesome의 폰트 패밀리 */
 		  content: "\f0d8"; /* 원하는 아이콘의 유니코드 값 */ 		 
 		  font-size: 25px;
		  color: #777;		 
		  float: right;
		  margin-left: 5px;
		}

     


</style>


<title>안녕하세요</title>


<script>
$(document).ready(function() {
		
	
	$('.subChange:first-child').trigger('click');
	
	<%-- 캐러셀 --%>

  $('.carousel .carousel-item').each(function(){
	  
	 	
	  
      var next = $(this).next();
      if (!next.length) {
          next = $(this).siblings(':first');
      }
      next.children(':first-child').clone().appendTo($(this));
      
      for (var i=0;i<2;i++) {
          next=next.next();
          if (!next.length) {
             next = $(this).siblings(':first');
           }
          
          next.children(':first-child').clone().appendTo($(this));
        }
      
      
    
  });
  
 
  

  
  <%-- 캐러셀 끝 --%>
  


  
  <%-- 아코디언 --%>
  
	
  var accordion_tab = $('.accordion1 p'), accordion_content = $('.accordion1 div');
	//accordion p tag click
	accordion_tab.on('click', function(e){
		//tab link 비활성화
		e.preventDefault();
		//활성화 된 class 제거
		accordion_tab.removeClass('active1');
		//accordion div 내용 숨기기
		accordion_content.slideUp('normal');
		//tab이 숨겨져 있으면 활성화 시키고 div 내용 펼치기
		if($(this).next().is(':hidden') == true) {
			$(this).addClass('active1');
			$(this).next().slideDown('normal');
		 } 			  
});
  
	 
	  <%-- 아코디언 끝 --%>

  
	  
	
	  
	  
  
  
  
});






/*
function func_show_hide{
	
	$('.tab_1').click(function() {
		
		  var clickedId = $(this).attr('class');
	  
		  $('.box_text p.'+ clickedId ).css('display','block');
		  
		  
		  
		  $('.box_text p').not('.' + clickedId).each(function() {
			  
			 var nonclickedId = $(this).attr('class');
			 $('.box_text p.'+nonclickedId).css('display','none');

		  });

		});

}

*/





</script>



</head>
<body>




	<div  id="container">
	
		
		<div class="row custom-topcontents col-md-8" id="top">
		
			<div class="col-md-7" id="top_left">
			
					<div id="top_left_upper">
					
						  <img src="<%= ctxPath%>/resources/images/강남캠퍼스.jpg" alt="이미지">
					
					</div>
				
					<div id="top_left_lower">
				
						   <%-- ////////////////////////// 추가이미지 캐러셀로 보여주기 시작 //////////////////////////// --%>
						           <div id="recipeCarousel" class="carousel slide w-100" data-ride="carousel" data-interval="false">
						               <div class="carousel-inner w-100 col-12" role="listbox">
						                         <div class="carousel-item active">
						                             <img class="d-block col-lg-3 col-md-4 col-sm-6 img-fluid ci" src="<%= ctxPath%>/resources/images/강남캠퍼스.jpg">
						                         </div>
						                         <div class="carousel-item">
						                             <img class="d-block col-lg-3 col-md-4 col-sm-6 img-fluid ci" src="<%= ctxPath%>/resources/images/동원.png">
						                         </div>
						                           <div class="carousel-item">
						                             <img  class="d-block col-lg-3 col-md-4 col-sm-6 img-fluid ci" src="<%= ctxPath%>/resources/images/레노보.png">
						                         </div>
						                           <div class="carousel-item">
						                             <img  class="d-block col-lg-3 col-md-4 col-sm-6 img-fluid ci" src="<%= ctxPath%>/resources/images/미샤.png">
						                         </div>
						                           <div class="carousel-item">
						                             <img  class="d-block col-lg-3 col-md-4 col-sm-6 img-fluid ci" src="<%= ctxPath%>/resources/images/원더플레이스.png">
						                         </div>
						                           <div class="carousel-item">
						                             <img  class="d-block col-lg-3 col-md-4 col-sm-6 img-fluid ci" src="<%= ctxPath%>/resources/images/sist_logo.png">
						                         </div>
						               </div>
			            			  <a class="carousel-control-prev prev-left" href="#recipeCarousel" role="button" data-slide="prev">
						                   <span class="carousel-control-prev-icon" aria-hidden="true"></span>
						                   <span class="sr-only">Previous</span>
									  </a>
						             	
						                <a class="carousel-control-next prev-right" href="#recipeCarousel" role="button" data-slide="next">
						                   <span class="carousel-control-next-icon" aria-hidden="true"></span>
						                   <span class="sr-only">Next</span>
						               </a>	
						           </div>
      					 <%-- ////////////////////////// 추가이미지 캐러셀로 보여주기 끝 //////////////////////////// --%>
									
				</div>
			
			</div>

			<div class="col-md-5" id="top_right">
				
					<div id="top_right_upper">	
						<div class="row" id="top_title">					
							<p style="font-size: 24px; color: white; font-weight: 500; background-color:  #7171da;">4성급</p>	
						    <h2 id="top_title">구운동 파티즈 - 구 메이트</h2>	
						</div>		
			            
						<ul class="list-group"  id="badge">	
							<li class="d-flex justify-content-between align-items-center">
							    <span class="badge badge-warning badge-pill">9.4</span>
							    	<p class="col-md-6 col-sm-12 rec">추천해요</p>
							    	
							</li>
						</ul>
						<div>
							<p id="top_address">경기 수원시 권선구 구운동 924-7</p>
						
						</div>
						<div class="resv_cancel_top">
							<p class="text-center">예약취소가능</p>
						</div>			
					</div>
							
					<div id="top_right_lower">
						<div>
							<p id="sajang">사장님 한마디</p>
							<p id="sajang_annae">★안내사항</p>
						</div>
					</div>
							
			</div>
		   
		   
		</div>
		
		<div class="col-lg-8 col-md-6 col-sm-8" id="tab">
		
				<nav class="navbar navbar-expand-sm bg-white navbar-white sticky-top mx-3">
				  <a style="font-size: 12pt;" class="navbar-brand tab_1 " onclick="function_show_hide">객실안내/예약</a>
				  <ul class="navbar-nav">
				    <li class="nav-item">
				      <a style="font-size: 12pt;" class="nav-link tab_2" onclick="function_show_hide">숙소정보</a>
				    </li>
				    <li class="nav-item">
				      <a style="font-size: 12pt;" class="nav-link tab_3" onclick="function_show_hide">리뷰</a>
				    </li>
				  </ul>
				</nav>
		
		</div>
		
		  <div class="col-lg-8 calendar" id="night">
		  
		  </div>

		
	      <div id="item" class="row col-lg-8">
				<div class="col-lg-6 col-md-10 col-sm-10">
						<img src="<%= ctxPath%>/resources/images/강남캠퍼스.jpg" alt="thumbnail" class="img-thumbnail item_image">
				</div>
				<div class="col-lg-6">
					          <h5 class="col-sm-6 col-lg-12 mb-3 card-title" style="font-weight:600; ">슈페리어더블(오션뷰)</h5>
							 
							  <div class="col-sm-6 col-lg-12 mb-3 card-body">
							  
							  	<div  style="border: solid 1px yellow; height:80px;" >
							  	
								    <div style="display: flex;">
									    <p style="margin-left: auto; font-weight: 700;" class="origin_price">가격</p>
									    <p style="text-decoration: line-through;" class="item_origin_price">129,900</p>
								    </div>
								    
								    <div style="display: flex; border-bottom: 1px solid rgba(128, 128, 128, 0.2); ">
								      <span style="margin-left: auto; font-weight: 700; border-radius: 2px; height:20px;" class="badge badge-danger badge-pill special_price">예약특가</span>					    
								      <h5 class="card-title item_special_price">109,900원</h5>
								    </div>
								    
							    </div>
							    <div style="display: flex;">
							     	<p>입실시간</p>
							     	<p class="in_roomtime">15시 부터 </p>
							    </div> 	
							    
							    <div  style="display: flex; border-bottom: 1px solid rgba(128, 128, 128, 0.2); ">
							     	<p>퇴실시간</p>
							     	<p class="out_roomtime">익일 11시 </p>
							    </div> 
							   <div style="text-align:center; ">
								  <button class="col-12" style="background-color: transparent; border: none; margin: 18px 0;">
								    <p style="color:#ff3300; font-weight: 600;">객실 이용 안내</p>
								  </button>
								</div>                             
							    <a href="#" class="btn btn-danger col-lg-12 btn_resv">숙박 예약</a>
							  </div>
				</div>
	        </div>
	        
	        
	      	<div class="accordion_wrap col-lg-8" >
				<div class="accordion1">                        	
					<section id="nutrients">
						<p id="nutrients"><a href="#nutrients">영양정보</a></p>
						<div>
							<P>sadfasdfd</P>
						</div>
					</section>			
					<section id="allergy">
						<p id="allergy"><a href="#allergy">알레르기 정보</a></p>
						<div>
							<p>알레르기 유발 가능 식재료</p> 
						</div>
					</section>
			
					<section id="origin">
						<p id="origin"><a href="#origin">원산지 정보</a></p>
						<div>
							<p>sdfdsfsdf</p>
						</div>
					</section>                          
				</div>
			</div>
	        
	
	      
	
	
	</div>	
	


</body>
</html>
