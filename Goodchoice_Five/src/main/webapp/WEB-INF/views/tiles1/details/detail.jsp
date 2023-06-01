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


<!-- RangeDatePicker JS -->
  <script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
  <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
  <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />


<style type="text/css">

div#container{

	border:solid 1px red;
	
	height: 7000px;
}

div#top{

/* 	border:solid 10px purple; */
	margin: 0 auto;
}


  div#top_left{ 
	
/*  	border:solid 5px gray;  */
 } 


div#top_right{

/* 	border:solid 5px magenta; */
	
}


div#top_right{

/* 	border:solid 5px magenta; */
	
}




div#top_left > div#top_left_upper > img{
	
 	 	border:solid 5px white;  
	
	 	
	
		max-width: 100%;
    	height: 380px;
}

div#top_left > div#top_left_lower{
	
 	 
 	
 	margin-top: 20px;
 	
 	
	margin-bottom: 20px;
}







div#top_right > div#top_right_upper{

/* 		border:solid 10px red; */
	

}



div#top_right_upper h2#top_title{

	font-weight: bold;

}

div#top_right_upper p#top_address{

	color:   #a6a6a6;
	
	font-weight: 500;

}


div#top_right > div#top_right_lower{

/* 		border:solid 5px skyblue; */

		margin-top: 10px;
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
		border: solid 1px #e0ebeb;

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

  div#image-container {

/*   border: solid 1px red; */
  padding: 0;
  margin: 0;
}



.content {
        
        white-space: normal;
            overflow: visible;
            text-overflow: unset;
    }

    .btn {
        cursor: pointer;
        color: #00855d;
    }
    
    .btn:hover {
    
    	color: #00855d;
    }
  





</style>


<title>안녕하세요</title>


<script>
$(document).ready(function() {
		
		
	  <%-- div#top_right 캐러셀 및 캐러셀 위 배경부분  시작--%>
	  	
	 
	 // 초기 로드 시 첫 번째 이미지 설정
	  var firstImage = $('div.active > img.ci').attr('src');
	  $('div#top_left_upper > img').attr('src', firstImage);
	


	$('.carousel .carousel-item').each(function(){
		
  
		
	      var next = $(this).next();
	      if (!next.length) {
	          next = $(this).siblings(':first');
	      }
			
	      var nextImg = next.children(':first-child').clone();
	      
			
	      nextImg.appendTo($(this));	      
	      
	      
	      for (var i=0;i<3;i++) {
	          next=next.next();
	          if (!next.length) {
	             next = $(this).siblings(':first');
	           }
	          nextImg = next.children(':first-child').clone();
	          nextImg.appendTo($(this));
	          
	        }
	     
		  
	      
	      myFunction_ChangeImage() // 어떤 이미지를 클릭해도 그냥 제일 처음 active 클래스를 가졌던 div 태그의 자식 img 태그가 앞으로 와버린다.
	      
	      
	      
	      

		  myFunction_ClickImage();
	      
	      
	    
	  });
	  
	myFunction_PrevLeftSpan();  
	
	myFunction_PrevRightSpan(); 
	
	  <%-- div#top_right 캐러셀 및 캐러셀 위 배경부분 끝--%>

	  <%-- 더보기 접기 토글 시작 --%>
	  
	  myFunction_FoldMore();
	
	  <%-- 더보기 접기 토글 끝 --%>

	
	
  
		<%-- 캘린더 시작 --%>
	
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
	
	<%-- 캘린더 끝 --%>

 


  
  
  

  
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

<%-- 캐러셀 사진 클릭하면 바뀌기 시작 --%>

function myFunction_ClickImage() {
	  var currentImageSrc = ''; // 현재 이미지의 src를 저장할 변수

	  $('img.ci').click(function() {
	    var clickImage = $(this).attr('src');
	    
	    if (currentImageSrc !== clickImage) { // 클릭한 이미지가 현재 이미지와 다를 경우에만 처리
	      $('div#top_left_upper > img').fadeOut(200, function() {
	        $(this).attr('src', clickImage).fadeIn(200);
	      });
	      
	      currentImageSrc = clickImage; // 현재 이미지의 src 업데이트
	    }
	  });
	}


<%-- 캐러셀 사진 클릭하면 바뀌기 끝 --%>






<%-- 클릭한 이미지를 캐러셀 가장 앞으로 이동 시작 --%>
<%-- active 클래스를 추가해주면 그 추가가 된 img태그부터 시작이 된다.--%>

function myFunction_ChangeImage() {
	  $('img.ci').click(function() {
	    var clickedImage = $(this).attr('src');  <%-- 이거 넣고 다시해보기. addclass removeclass 다시하기 --%>
	    
	    
	    

		$('div.carousel-item').each(function() {
	    	
	    	$(this).removeClass('active'); // 모든 carousel-item에서 active 클래스 제거

	    	

	       //  console.log("active 는 " + "삭제됨" + $(".active").attr("id")); // 삭제돼서 undefined 뜸

		 });

	    
	    
	    
	    
	    $('div.carousel-item').each(function() {  // 이렇게 하면 된다.! div태그를 반복문을 돌려야 했다.
	    	
	    	
	    	
	      if ($(this).children().attr('src') === clickedImage) {
	        $(this).addClass('active'); // 클릭한 이미지의 부모 carousel-item에 active 클래스 추가
	        
	      	
            
           
            
	        
	      //  console.log("active 는 " + $(".active").attr("id"))
	        return false; // 반복문 종료
	      }
	    
	      
	      
	      
	    });
	    
	  });
	  
	  
	  
	}


<%-- 클릭한 이미지를 캐러셀 가장 앞으로 이동 끝 --%>




<%-- 화살표버튼눌러서 이미지 슬라이드 할떄 이미지 바뀌게 하기 시작 --%>

function myFunction_PrevLeftSpan(){ 
	


	  
	$('span.prev-left').click(function() {
			  var activeIndex = $('div.carousel-item.active').index();
			  var totalItems = $('div.carousel-item').length;
			  var prevIndex = activeIndex - 1;
	
			  if (prevIndex < 0) {
			    prevIndex = totalItems - 1;
			  }
	
			  var prevImg = $('div.carousel-item').eq(prevIndex).find('img.ci');
			  var src_csImage = prevImg.attr('src');
	
			  
			  $('div#top_left_upper > img').fadeOut(200, function() {
			      // 이미지가 사라진 후, 새로운 이미지로 src 변경
			      $(this).attr('src', src_csImage).fadeIn(200);
			    });
			  
			  
		  
		});
	} 
	
	
	function myFunction_PrevRightSpan(){
		


	
	$('span.prev-right').click(function() {
		  var activeDiv = $('.carousel-item.active');
		  var secondImg = activeDiv.find('img.ci:nth-child(2)');
		  var src_csImage = secondImg.attr('src');
		  
		  $('div#top_left_upper > img').fadeOut(200, function() {
		      // 이미지가 사라진 후, 새로운 이미지로 src 변경
		      $(this).attr('src', src_csImage).fadeIn(200);
		    });
		  
		  
		});
	}


	<%-- 화살표버튼눌러서 이미지 슬라이드 할떄 이미지 바뀌게 하기 끝 --%>

	
	<%-- 더보기 접기 토글버튼 시작 --%>
	
	function myFunction_FoldMore(){
		
		
		var content = $("p#myContent");
        var toggleBtn = $("#toggleBtn");

        var contentText = content.text();
        var truncatedText = contentText.substring(0, 15);
        var remainingText = contentText.substring(15);
        
        console.log('truncatedText' + truncatedText);
        console.log('remainingText' + remainingText);


        if (remainingText.length > 0) {
        	content.html(truncatedText + '<span class="dots">...</span>');
            toggleBtn.text("더보기");
        } else {
            content.text(contentText);
            toggleBtn.hide();
        }

        toggleBtn.click(function() {
            content.toggleClass("expanded");
            toggleBtn.toggleClass("expanded");

            if (toggleBtn.text() === "더보기") {
                content.text(contentText);
                toggleBtn.text("접기");
            } else {
            	content.html(truncatedText + '<span class="dots">...</span>');
                toggleBtn.text("더보기");
            }
        });
        
        
		
	}

	<%-- 더보기 접기 토글버튼 끝 --%>

	

</script>



</head>
<body>




	<div  id="container">
	
		
		<div class="row custom-topcontents col-md-9" id="top">
		
			<div class="col-md-7" id="top_left">
			
					<div id="top_left_upper">
					
						  <img src="">
					
					</div>
				
					<div id="top_left_lower">
				
						   <%-- ////////////////////////// 추가이미지 캐러셀로 보여주기 시작 //////////////////////////// --%>
						           <div id="recipeCarousel" class="carousel slide w-100" data-ride="carousel" data-interval="false">
						           <!--  -->
						               <div class="carousel-inner w-100 col-12" role="listbox">
						                         <div class="carousel-item active" id="img_init">
						                             <img class="col-lg-3 col-md-4 col-sm-6 ci" style="cursor:pointer; " src="<%= ctxPath%>/resources/images/강남캠퍼스.jpg">
						                         </div>
						                         <div class="carousel-item" id="1">
						                             <img class="col-lg-3 col-md-4 col-sm-6 ci" style="cursor:pointer;" src="<%= ctxPath%>/resources/images/강남클릭_일반실_추가1.jpg">
						                         </div>
						                           <div class="carousel-item" id="2">
						                             <img  class="col-lg-3 col-md-4 col-sm-6 ci" style="cursor:pointer;" src="<%= ctxPath%>/resources/images/강남클릭_일반실_추가2.jpg">
						                         </div>
						                           <div class="carousel-item" id="3">
						                             <img  class="col-lg-3 col-md-4 col-sm-6 ci" style="cursor:pointer;" src="<%= ctxPath%>/resources/images/강남클릭_일반실_추가3.jpg">
						                         </div>
						                           <div class="carousel-item" id="4">
						                             <img  class="col-lg-3 col-md-4 col-sm-6 ci" style="cursor:pointer;" src="<%= ctxPath%>/resources/images/강남클릭_일반실_추가4.jpg">
						                         </div>
						                           <div class="carousel-item" id="5">
						                             <img  class="col-lg-3 col-md-4 col-sm-6 ci" style="cursor:pointer;" src="<%= ctxPath%>/resources/images/강남클릭_일반실.jpg">
						                         </div>
						                         
						               </div>
						               <!--  -->
						               
						               
			            			
									    <span class="carousel-control-prev prev-left" style="border: none; background: none; width:15px;">
										   <a href="#recipeCarousel" class="prev_anchor" role="button" data-slide="prev">
										      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
										      <span class="sr-only">Previous</span>
										   </a>
										</span>
									  
						             	
						                <span class="carousel-control-next prev-right" style="border: none; background: none; width:15px;">
										   <a href="#recipeCarousel" class="next_anchor" role="button" data-slide="next">
										      <span class="carousel-control-next-icon" aria-hidden="true"></span>
										      <span class="sr-only">Next</span>
										   </a>
										</span>
						           </div>
      					 <%-- ////////////////////////// 추가이미지 캐러셀로 보여주기 끝 //////////////////////////// --%>
									
				</div>
			
			</div>

			<div class="col-lg-5 col-md-5" id="top_right">
				
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
							<div class="row">
								<p id="sajang">사장님 한마디</p>
								<div id="toggleBtn" class="btn">더보기</div>
							</div>
							<p id="sajang_annae">★안내사항</p>							
							<p id="myContent" class="col-lg-12 content">COEX 전시장, 도심공항터미널, 종합무역센터, 올림픽 메인스타디움에 인접해 있어 비즈니스,관광 등 다양한 목적의 여행객들에게 이상적입니다 </p>
				    
							
						</div>
					</div>
							
			</div>
		   
		   
		</div>
		
		<div class="col-lg-9 col-md-6 col-sm-8" id="tab">
		
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
		
		  <div class="col-lg-9 calendar" id="night">
		  
		  		<input type="text" id="daterange" readonly/>
		  
		  </div>

		
	      <div id="item" class="row col-lg-9">
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
	        
	        
	      	<div class="accordion_wrap col-lg-9" >
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
