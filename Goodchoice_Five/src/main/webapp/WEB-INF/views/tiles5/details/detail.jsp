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

  <!-- slick-slider -->
  <link rel="stylesheet" type="text/css" href="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
  <link rel="stylesheet" href="http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
  <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
  <script type="text/javascript" src="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>


<!-- RangeDatePicker JS -->
  <script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
  <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
  <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
  
  
 <!-- 카카오 맵 src --> 
 <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5615f8a58c5a93ad0db89da8700e5dfa"></script> 




<style type="text/css">

div#container{

	border:solid 1px ;
	
	padding-bottom: 180px;
}

div#top{

 	border:solid 10px white; 
	margin: 0 auto;
}


  div#top_left{ 
	
 	border:solid 5px white; 
 } 


div#top_right{

 	border:solid 5px white; 
	
}


div#top_right{

 	border:solid 5px white; 
	
}




div#top_left > div#top_left_upper > img{
	
  	 	border:solid 5px white;
	
	 	
	
/* 		max-width: 500px; */
    	height: 380px;
}

div#top_left > div#top_left_lower{
	
 	 
 	
 	margin-top: 20px;
 	
 	
	margin-bottom: 20px;
}


div#top_left_lower div.carousel-inner .carousel-item.active,
       div#top_left_lower div.carousel-inner .carousel-item-next, 
       div#top_left_lower div.carousel-inner .carousel-item-prev { 
         display: flex; 
           transition: transform 0.1s ease; 
         
       } 
      
       div#top_left_lower div.carousel-inner .carousel-item-right.active, 
       div#top_left_lower div.carousel-inner .carousel-item-next { 
         transform: translateX(25%); 
       } 
      
       div#top_left_lower div.carousel-inner .carousel-item-left.active,  
       div#top_left_lower div.carousel-inner .carousel-item-prev { 
         transform: translateX(-25%); 
       } 
        
       div#top_left_lower div.carousel-inner .carousel-item-right, 
       div#top_left_lower div.carousel-inner .carousel-item-left{  
         transform: translateX(0); 
       } 
       
    	
       
       
   
   div#top_left_lower .carousel-control-prev-icon,
	div#top_left_lower .carousel-control-next-icon {
  filter: invert(100%);
}





img.ci{

	height: 80px;
	
	
}





div#top_right > div#top_right_upper{

 		border:solid 10px white; 
	

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



div#top_right_upper h2#top_title{

	font-weight: bold;

}

div#top_right_upper p#top_address{

	color:   #a6a6a6;
	
	font-weight: 500;

}


div#top_right > div#top_right_lower{

   		border:solid 5px white;   

		margin-top: 40px;
}

div#top_right > div#top_right_lower  div.more_fold_btn {


	margin-left: auto;


}



div#top_right > div#top_right_lower  p.more_fold_content{
		
		margin-top: 30px;
		margin-left: -14px;
		color: #8c8c8c;

}


 div#top_right > div#top_right_lower p.more_fold_content {
        
        white-space: normal;
            overflow: visible;
            text-overflow: unset;
    }

 div#top_right > div#top_right_lower div.more_fold_btn {
        cursor: pointer;
        color: #00855d;
        
    }
    
 div#top_right > div#top_right_lower div.more_fold_btn:hover {
    
    	color: #00855d;
    }



div#top_right > div#top_right_lower  p#sajang{

	font-weight: bold;

}


div#tab{
	
	
	

	margin: 25px auto 0px auto;
	
	 
	
}

div#tab a{
	
/* 	border: solid 1px red; */
	
	

	cursor: pointer;

}


div#tab .tab_1,
div#tab .tab_2,
div#tab .tab_3 {

	color: #b3b3b3;
	font-weight: 300;
	
} 


div#tab .current {

	color: red;
    font-weight: bold;
	border-bottom: solid 1px red;
}



.navbar-nav {
    display: flex;
    margin-left: -49px;
     border-bottom: 1px solid rgba(128, 128, 128, 0.2);
  }
  
   



div#night{

/*  	border: solid 1px brown;  */
	
	height: 80px;
	margin: 60px auto 0px auto;
}


div#night > input#daterange {

	border: solid 1px rgba(128, 128, 128, 0.2);
	border-radius: 5px;
	
	 cursor: pointer;
	 
	 width: 235px;  
	 margin-left: -15px; 

}

div#night > i {

	position: absolute;
  left: 215px;
  top: 14px;
  transform: translateY(-50%);
  pointer-events: none;


}


/* div#item 룸넘버 101 시작 */


div#item{
		
		padding-top: 30px;
	
		margin: 20px auto 0px auto;
	
		
		
		border: solid 1px #e0ebeb;
		

}






div#item > div#carousel_underItem_wrap {


/* 	border: solid 3px blue; */
	
	margin-top:  33px;
	margin-bottom:  33px;

	padding-top: 7px;
	padding-bottom: 25px;

	  background-color: rgb(247, 247, 247);
	
	margin: 0 auto; /* 가운데 정렬을 위해 필요 */

}




 div#item > div#carousel_underItem_wrap >  div#carousel_underItem {
  
/*       border: solid 3px magenta; */
  	   max-width: 600px; /* 원하는 너비로 조절 */
   
    margin: 0 auto; /* 가운데 정렬을 위해 필요 */
  
  
  }
  
  



div#item img.item_image {

	

	height: 337px;


}


div#item span.special_price   {

	margin-left: auto; 
	font-weight: 700; 
	border-radius: 2px; 
	height:20px; 
	margin-top: 27px;


}

div#item h5.item_special_price {

	margin-top: 24px;

}





div#item p.in_roomtime,
div#item p.out_roomtime {

	margin-left: auto;
	font-weight: bold;

}



div#item a.btn_resv{

	color:white;

}



.annae_btn:focus {
    outline: none !important;
    box-shadow: none !important;
}		


div#item ul.disc-list li::before {
  content: "•";
  margin-right: 5px;
}



/* div#item 룸넘버 101 끝 */


/* div#item 룸넘버 102 시작 */


div#item_2{
		
		padding-top: 30px;
	
		margin: 20px auto 0px auto;
	
		
		
		border: solid 1px #e0ebeb;
		

}


  
 div#item_2 > div#carousel_underItem_wrap_2 {


/* 	border: solid 3px blue; */
	
	margin-top:  33px;
	margin-bottom:  33px;

	padding-top: 7px;
	padding-bottom: 25px;

	  background-color: rgb(247, 247, 247);
	
	margin: 0 auto; /* 가운데 정렬을 위해 필요 */

}




 div#item_2 > div#carousel_underItem_wrap_2 >  div#carousel_underItem_2 {
  
/*       border: solid 3px magenta; */
  	   max-width: 600px; /* 원하는 너비로 조절 */
   
    margin: 0 auto; /* 가운데 정렬을 위해 필요 */
  
  
  } 
  


div#item_2 img.item_image_2 {

	

	height: 337px;


}


div#item_2 span.special_price_2   {

	margin-left: auto; 
	font-weight: 700; 
	border-radius: 2px; 
	height:20px; 
	margin-top: 27px;


}

div#item_2 h5.item_special_price_2 {

	margin-top: 24px;

}





div#item_2 p.in_roomtime_2,
div#item_2 p.out_roomtime_2 {

	margin-left: auto;
	font-weight: bold;

}



div#item_2 a.btn_resv_2 {

	color:white;

}



div#item_2 ul.disc-list li::before {
  content: "•";
  margin-right: 5px;
}


/* div#item 룸넘버 102 끝 */




/* 

아코디언


*/



 .accordion_wrap {
	
	
	width: 80%;
	margin: 40px auto 0px auto;
	
	
	}
	
	
	div.accordion_wrap > div.accordion1 > section {
	
	border-bottom: 1px solid rgba(128, 128, 128, 0.2);	
	
	
	}
	

	
	
	

	.accordion1 section > p > a {
		padding:15px 30px 10px 20px;  
		line-height:26px; 
		color:black;
		font-weight: bold;
		font-size: 12pt;
		display:block;
		position:relative;
		outline:0;
		text-decoration:none;
		background-position:30px center;
		box-sizing:border-box;
		}
		
	
	.accordion1 section > div {
		width:50%;
		padding:5px 20px 25px 20px; 
		line-height:20px; 
		position:relative;
		height:auto;
		display:none;
		line-height:20px;
		
		}
		
		
	
		.accordion1 section > p > a:after {
		  font-family: "Font Awesome 5 Free"; /* Font Awesome의 폰트 패밀리 */
 		  content: "\f078"; /* 원하는 아이콘의 유니코드 값 */ 
		  font-size: 18px;
		  color: #777;
		  float: right;
		  margin-left: 5px;
		}

		.accordion1 section > p.active1 a:after {
 		  font-family: "Font Awesome 5 Free"; /* Font Awesome의 폰트 패밀리 */
 		  content: "\f077"; /* 원하는 아이콘의 유니코드 값 */ 		 
 		  font-size: 18px;
		  color: #777;		 
		  float: right;
		  margin-left: 5px;
		}
		
		
		
		
		div.accordion_wrap ul.accordion_disc li::before {
		  content: "•";
		  margin-right: 5px;
		}

/*
	아코디언 끝


*/





/*

	아코디언 안의 숙소 지도 시작 



*/


  div#title {
      font-size: 20pt;
    /* border: solid 1px red; */
      padding: 12px 0;
   }
   
   div.mycontent {
        width: 300px;
        padding: 5px 3px;
     }
     
     div.mycontent>.title {
        font-size: 12pt;
        font-weight: bold;
        background-color: #d95050;
        color: #fff;
     }
     
     div.mycontent>.title>a {
        text-decoration: none;
        color: #fff;
     }
     
     
     div.mycontent>.desc {
      /* border: solid 1px red; */
        padding: 10px 0 0 0;
        color: #000;
        font-weight: normal;
        font-size: 9pt;
     }
     
     div.mycontent>.desc>img {
        width: 50px;
        height: 50px;
     }






/*

	아코디언 안의 숙소 지도 끝

*/



/*

	리뷰 창 시작

*/

div.review_top {

	margin-top: 40px;
	
	margin-left: 238px;
	

}


div.review_content {

	margin-top: 75px;
	
	margin-left: 238px;


}



/*

	리뷰 쓰는 인풋태그 css 시작

*/


#myform fieldset{
    display: inline-block;
    direction: rtl;
    border:0;
}
#myform fieldset legend{
    text-align: right;
}
#myform input[type=radio]{
    display: none;
}
#myform label{
    font-size: 3em;
    color: transparent;
    text-shadow: 0 0 0 #f0f0f0;
}
#myform label:hover{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#myform label:hover ~ label{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#myform input[type=radio]:checked ~ label{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#reviewContents {
    width: 100%;
    height: 150px;
    padding: 10px;
    box-sizing: border-box;
    border: solid 1.5px #D3D3D3;
    border-radius: 5px;
    font-size: 16px;
    resize: none;
}


  
</style>


<title>안녕하세요</title>


<script>



$(document).ready(function() {
		
		
	  <%-- div#top_right 캐러셀 및 캐러셀 위 배경부분  시작--%>
	  	
	  myFunction_TriggerImage();
	 // 초기 로드 시 첫 번째 이미지 설정
	  $('div#top_left_lower div.active img.ci:first-child').trigger('click');
	 
	  
	  myFunction_Trigger_tab();
	  $('div#tab a.tab_1').trigger('click');
	

	 
	  
	$('div#top_left_lower div.carousel div.carousel-item').each(function(){
		
		
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
		
		  var previousStartDate = null;  // 이전에 선택한 값을 저장할 변수
	       var previousEndDate = null;
	
    $("#daterange").daterangepicker({
        locale: {
        	"format": 'MM월 DD일',
            "applyLabel": "확인",
             "cancelLabel": "취소",
            "daysOfWeek": ["일", "월", "화", "수", "목", "금", "토"],
            "monthNames": ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"]
            },
        startDate: '05/20/2023',
        endDate: '05/21/2023',
        linkedCalendars: false, // 시작일과 종료일을 개별적으로 선택하도록 설정합니다.
        autoUpdateInput: false // 입력란 값을 자동으로 업데이트하지 않도록 설정합니다.
    });
    
    
    <%-- 캘린더 끝 --%>
    

    <%-- 캘린더에서 선택한 날짜들을 모달창에 뿌려주기 --%>
    
       // 기본 날짜 설정
        var defaultStartDate = $("#daterange").data('daterangepicker').startDate.format('MM월 DD일');
		var defaultEndDate = $("#daterange").data('daterangepicker').endDate.format('MM월 DD일');
		
		var startDateParts = defaultStartDate.split(' ');
		var endDateParts = defaultEndDate.split(' ');
		
		var startDate = new Date();
		startDate.setMonth(parseInt(startDateParts[0]) - 1); // 월은 0부터 시작하므로 1을 빼줍니다.
		startDate.setDate(parseInt(startDateParts[1]));
		
		var endDate = new Date();
		endDate.setMonth(parseInt(endDateParts[0]) - 1); // 월은 0부터 시작하므로 1을 빼줍니다.
		endDate.setDate(parseInt(endDateParts[1]));
		
		var timeDiff = Math.abs(endDate.getTime() - startDate.getTime());
		var dateDiff = Math.ceil(timeDiff / (1000 * 60 * 60 * 24));
		
		var formattedValue = defaultStartDate + ' ~ ' + defaultEndDate + '  ' + dateDiff + '박';
		
		$("#daterange").val(formattedValue);
		$("ul.disc-list > li.modal_date").text(defaultStartDate + '~' + defaultEndDate);
       
       // 날짜 선택 시 이벤트 처리
       $("#daterange").on('apply.daterangepicker', function(ev, picker) {
         var startDate = picker.startDate;
         var endDate = picker.endDate;
         var diffInDays = endDate.diff(startDate, 'days');

         if (diffInDays > 7) {
           alert("최대 7박만 가능합니다");
           if (previousStartDate && previousEndDate) {
             $(this).data('daterangepicker').setStartDate(previousStartDate);
             $(this).data('daterangepicker').setEndDate(previousEndDate);
             $(this).val(previousStartDate.format('MM월 DD일') + ' ~ ' + previousEndDate.format('MM월 DD일') + '  ' + previousEndDate.diff(previousStartDate, 'days')  + '박');
             $("ul.disc-list > li.modal_date").text(previousStartDate.format('MM월 DD일') + ' ~ ' + previousEndDate.format('MM월 DD일'));
           } else {
        	   console.log("히히히 엘스다");
             $(this).data('daterangepicker').setStartDate(defaultStartDate);
             $(this).data('daterangepicker').setEndDate(defaultEndDate);
             $(this).val(defaultStartDate + ' ~ ' + defaultEndDate + '  ' + dateDiff + '박');
             $("ul.disc-list > li.modal_date").text(defaultStartDate + '~' + defaultEndDate);
           }
         } else {
           $(this).val(startDate.format('MM월 DD일') + ' ~ ' + endDate.format('MM월 DD일') + '  ' + diffInDays + '박');
           $("ul.disc-list > li.modal_date").text(startDate.format('MM월 DD일') + '~' + endDate.format('MM월 DD일'));
           // 선택한 값이 유지되도록 이전에 선택한 값을 업데이트
           previousStartDate = startDate.clone();
           previousEndDate = endDate.clone();
         }
       });
       
  
    
    <%-- 캘린더에서 선택한 날짜들을 모달창에 뿌려주기 끝 --%>

	
    <%-- 숙소의 객실 추가이미지 보여주기 닫기 시작 --%>
	
	myFunction_Show_accomo();

	  myFunction_Hide_accomo();
	
	
	<%-- 숙소의 객실 추가이미지 보여주기 닫기 끝 시작 --%>
  
	  



  
  <%-- 아코디언 --%>
  		
  	
  var accordion_tab = $('div.accordion1 section > p'), accordion_content = $('.accordion1 div.first_section');
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
	  
	  
	  
	  <%-- 아코디언안의 카카오맵 보여주기 시작 --%>
	  
	  
	  
	  
	  
	  
	// 지도를 담을 영역의 DOM 레퍼런스
	     var mapContainer = document.getElementById('map');
	     
	     // 지도를 생성할때 필요한 기본 옵션
	     var options = {
	           center: new kakao.maps.LatLng(37.4864948886064, 127.013616931019), // 지도의 중심좌표. 반드시 존재해야함.
	           <%--
	               center 에 할당할 값은 kakao.maps.LatLng 클래스를 사용하여 생성한다.
	               kakao.maps.LatLng 클래스의 2개 인자값은 첫번째 파라미터는 위도(latitude)이고, 두번째 파라미터는 경도(longitude)이다.
	           --%>
	           level: 3  // 지도의 레벨(확대, 축소 정도). 숫자가 클수록 축소된다. 4가 적당함.
	     };
	     
	    
	   // 지도 생성 및 생성된 지도객체 리턴
	   var mapobj = new kakao.maps.Map(mapContainer, options);


	   if (navigator.geolocation) {
	      // HTML5의 geolocation으로 사용할 수 있는지 확인한다 
	         
	      // GeoLocation을 이용해서 웹페이지에 접속한 사용자의 현재 위치를 확인하여 그 위치(위도,경도)를 지도의 중앙에 오도록 한다. 
	      navigator.geolocation.getCurrentPosition(function(position) {
	         var latitude = '37.4864948886064';   // 현위치의 위도
	         var longitude = '127.013616931019'; // 현위치의 경도
	         //  console.log("현위치의 위도: "+latitude+", 현위치의 경도: "+longitude);
	         
	         // 마커가 표시될 위치를 geolocation으로 얻어온 현위치의 위.경도 좌표로 한다   
	         var locPosition = new kakao.maps.LatLng(latitude, longitude);

	         // 마커이미지를 기본이미지를 사용하지 않고 다른 이미지로 사용할 경우의 이미지 주소 
	           var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png';

	           // 마커이미지의 크기 
	          var imageSize = new kakao.maps.Size(34, 39);
	           
	          // 마커이미지의 옵션. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정한다. 
	          var imageOption = {offset: new kakao.maps.Point(15, 39)};

	          // 마커의 이미지정보를 가지고 있는 마커이미지를 생성한다. 
	          var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);

	          // == 마커 생성하기 == //
	         var marker = new kakao.maps.Marker({ 
	            map: mapobj, 
	              position: locPosition, // locPosition 좌표에 마커를 생성 
	              image: markerImage     // 마커이미지 설정
	         }); 
	          
	         marker.setMap(mapobj); // 지도에 마커를 표시한다
	         
	         
	         // === 인포윈도우(텍스트를 올릴 수 있는 말풍선 모양의 이미지) 생성하기 === //
	         
	         // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능함.
	         var iwContent = "<div style='padding:5px; font-size:10pt; height:20px;'>숙소위치 입니다.</div>";

	         // 인포윈도우 표시 위치
	          var iwPosition = locPosition;
	         
	          // removeable 속성을 true 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됨
	          var iwRemoveable = true; 

	          // == 인포윈도우를 생성하기 == 
	         var infowindow = new kakao.maps.InfoWindow({
	             position : iwPosition, 
	             content : iwContent,
	             removable : iwRemoveable
	         });

	         // == 마커 위에 인포윈도우를 표시하기 == //
	         infowindow.open(mapobj, marker);

	         // == 지도의 센터위치를 locPosition로 변경한다.(사이트에 접속한 클라이언트 컴퓨터의 현재의 위.경도로 변경한다.)
	         mapobj.setCenter(locPosition);
	      });
	   }   
	   else {
	      // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정한다.
	      var locPosition = new kakao.maps.LatLng(37.4864948886064, 127.013616931019);     
	        
	      // 위의 
	      // 마커이미지를 기본이미지를 사용하지 않고 다른 이미지로 사용할 경우의 이미지 주소 
	      // 부터
	      // 마커 위에 인포윈도우를 표시하기 
	      // 까지 동일함.
	      
	     // 지도의 센터위치를 위에서 정적으로 입력한 위.경도로 변경한다.
	       mapobj.setCenter(locPosition);
	      
	   }// end of if~else------------------------------------------
	   
	   
	   // ================== 지도에 클릭 이벤트를 등록하기 시작======================= //
	   // 지도를 클릭하면 클릭한 위치에 마커를 표시하면서 위,경도를 보여주도록 한다.
	   
	   // == 마커 생성하기 == //
	   // 1. 마커이미지 변경
	   var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png';       
	           
	   // 2. 마커이미지의 크기 
	    var imageSize = new kakao.maps.Size(34, 39);   
	            
	    // 3. 마커이미지의 옵션. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정한다. 
	    var imageOption = {offset: new kakao.maps.Point(15, 39)};   
	      
	    // 4. 이미지정보를 가지고 있는 마커이미지를 생성한다. 
	    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);
	          
	    var movingMarker = new kakao.maps.Marker({ 
	      map: mapobj, 
	        image: markerImage  // 마커이미지 설정
	   });
	    
	    // === 인포윈도우(텍스트를 올릴 수 있는 말풍선 모양의 이미지) 생성하기 === //
	   var movingInfowindow = new kakao.maps.InfoWindow({
	       removable : false
	     //removable : true   // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됨
	   });
	   
	    
	   kakao.maps.event.addListener(mapobj, 'click', function(mouseEvent) {         
	          
	       // 클릭한 위도, 경도 정보를 가져옵니다 
	       var latlng = mouseEvent.latLng;
	       
	       // 마커 위치를 클릭한 위치로 옮긴다.
	       movingMarker.setPosition(latlng);
	       
	       // 인포윈도우의 내용물 변경하기 
	       movingInfowindow.setContent("<div style='padding:5px; font-size:9pt;'>여기가 어디에요?<br/><a href='https://map.kakao.com/link/map/여기,"+latlng.getLat()+","+latlng.getLng()+"' style='color:blue;' target='_blank'>큰지도</a> <a href='https://map.kakao.com/link/to/여기,"+latlng.getLat()+","+latlng.getLng()+"' style='color:blue' target='_blank'>길찾기</a></div>");  
	       
	       // == 마커 위에 인포윈도우를 표시하기 == //
	       movingInfowindow.open(mapobj, movingMarker);
	       
	       
	   });
	   // ================== 지도에 클릭 이벤트를 등록하기 끝======================= //
	   
	   
	  
	   
	   
	   
	  
	   
	   
	   
	  
	  <%-- 아코디언 안의 카카오맵 보여주기 끝. --%>
	  
	  
	  
	
	  
	<%-- tab키 눌렀을 경우의 함수 --%>  
	
	
    // Click event for item및 예약
	$('a.tab_1').click(function() {
	      $('.nav-link').removeClass('current'); 
	      $(this).addClass('current'); 

	      $('.accordion_wrap, .review_top, .review_content').hide(); 
	      $('#item, #item_2, .calendar').show(); 
	    });

    // Click event for 숙소정보
    $('a.tab_2').click(function() {
      $('.nav-link').removeClass('current');
      $(this).addClass('current');

      $('#item, #item_2, .calendar, .review_top, .review_content').hide();
      $('.accordion_wrap').show();
      $('.accordion1 section#normal_info > p').trigger('click');
    });

    // Click event for 리뷰
    $('a.tab_3').click(function() {
      $('.nav-link').removeClass('current');
      $(this).addClass('current');

      $('#item, #item_2, .calendar, .accordion_wrap').hide();
      $('.review_top, .review_content').show();
    });

	  
		<%-- tab키 눌렀을 경우의 함수 끝 --%>  
  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
  
});  // end of $(document).ready(function(){})-------------------------------------------------------
























<%-- 캐러셀 사진 클릭하면 바뀌기 시작 --%>

function myFunction_ClickImage() {
	
	
	  
	
	  $('img.ci').click(function() {
	      
		  
			 

		  
		  var clickImage = $(this).attr('src');
	    	
	      
	  
	      $('div#top_left_upper > img').fadeOut(200, function() {
	        $(this).attr('src', clickImage).fadeIn(200);
	      });
	      
	    
	  });
	}


<%-- 캐러셀 사진 클릭하면 바뀌기 끝 --%>


<%-- 로딩화면 트리거를 위한 별도의 배경화면 바꾸는 함수 시작 --%>

function myFunction_TriggerImage() {
	
	
	 
	
	
	  $('img.ci').click(function() {
	      
		 
		  
		  var clickImage = $(this).attr('src');
	    	
	      
	  
	      $('div#top_left_upper > img').attr('src', clickImage);
	     
	      $('div#top_left_lower div.active img.ci:first-child').css({"border":"solid 0.5px #999999","border-radius": "5px","padding-left": "8px","padding-right": "8px","padding-top": "4px","padding-bottom": "4px"});
	      
	      
	    
	  });
	  
      

	  	  
	}

<%-- 로딩화면 트리거를 위한 별도의 배경화면 바꾸는 함수 시작 --%>



<%-- 클릭한 이미지를 캐러셀 가장 앞으로 이동 시작 --%>
<%-- active 클래스를 추가해주면 그 추가가 된 img태그부터 시작이 된다.--%>

function myFunction_ChangeImage() {
	
	 
	
	  $('img.ci').click(function() {
	    var clickedImage = $(this).attr('src');  
	    

	    

		$('div#top_left_lower div.carousel-item').each(function() {
	    	
	    	$(this).removeClass('active'); // 모든 carousel-item에서 active 클래스 제거

	    	

	       //  console.log("active 는 " + "삭제됨" + $(".active").attr("id")); // 삭제돼서 undefined 뜸

		 });

	    
		
	    
	    
	    $('div#top_left_lower div.carousel-item').each(function() {  // 이렇게 하면 된다.! div태그를 반복문을 돌려야 했다.
	    	
	    	
	    	
	      if ($(this).children().attr('src') === clickedImage) {
	        $(this).addClass('active'); // 클릭한 이미지의 부모 carousel-item에 active 클래스 추가
	        
	        $('img.ci').css('border','none'); 
	      	$('div#top_left_lower div.active').children('img.ci').first().css({"border":"solid 0.5px #999999","border-radius": "5px","padding-left": "8px","padding-right": "8px","padding-top": "4px","padding-bottom": "4px"});
            
           
            
	        
	      //  console.log("active 는 " + $(".active").attr("id"))
	        return false; // 반복문 종료
	      }
	    
	      
	      
	      
	    });
	    
	  });
	  
	  
	  
	}


<%-- 클릭한 이미지를 캐러셀 가장 앞으로 이동 끝 --%>




<%-- 화살표버튼눌러서 이미지 슬라이드 할떄 이미지 바뀌게 하기 시작 --%>

function myFunction_PrevLeftSpan(){ 
	


	  
	$('div#top_left_lower span.prev-left').click(function() {
		
		 $('img.ci').css('border','none');

		
			  var activeIndex = $('div#top_left_lower div.carousel-item.active').index();
			  var totalItems = $('div#top_left_lower div.carousel-item').length;
			  var prevIndex = activeIndex - 1;
	
			  if (prevIndex < 0) {
			    prevIndex = totalItems - 1;
			  }
	
			  var prevImg = $('div#top_left_lower div.carousel-item').eq(prevIndex).find('img.ci');
			  var src_csImage = prevImg.attr('src');
			  
			  
			  prevImg.first().css({"border":"solid 0.5px #999999","border-radius": "5px","padding-left": "8px","padding-right": "8px","padding-top": "4px","padding-bottom": "4px"});
			  
			  $('div#top_left_upper > img').fadeOut(200, function() {
			      // 이미지가 사라진 후, 새로운 이미지로 src 변경
			      $(this).attr('src', src_csImage).fadeIn(200);
			    });
			  
			  
		  
		});
	} 
	
	
function myFunction_PrevRightSpan() {
	  $('div#top_left_lower span.prev-right').click(function() {
		  
			 $('img.ci').css('border','none');
		  
		  
	    var activeDiv = $('div#top_left_lower div.carousel-item.active');
	    var activeIndex = activeDiv.index();
	    var totalItems = $('div#top_left_lower div.carousel-item').length;
	    var nextIndex = activeIndex + 1;

	    if (nextIndex >= totalItems) {
	      nextIndex = 0;
	    }

	    var nextImg = $('div#top_left_lower div.carousel-item').eq(nextIndex).find('img.ci');
	    var src_csImage = nextImg.attr('src');

	    nextImg.first().css({"border":"solid 0.5px #999999","border-radius": "5px","padding-left": "8px","padding-right": "8px","padding-top": "4px","padding-bottom": "4px"});

	    $('div#top_left_upper > img').fadeOut(200, function() {
	      $(this).attr('src', src_csImage).fadeIn(200);
	    });
	  });
	}


	<%-- 화살표버튼눌러서 이미지 슬라이드 할떄 이미지 바뀌게 하기 끝 --%>

	
	<%-- 더보기 접기 토글버튼 시작 --%>
	
	function myFunction_FoldMore(){
		
		
		var content = $("p#more_fold_myContent");
        var toggleBtn = $("#more_fold_toggleBtn");

        var contentText = content.text();
        var truncatedText = contentText.substring(0, 39);
        var remainingText = contentText.substring(39);
        
    //    console.log('truncatedText' + truncatedText);
    //    console.log('remainingText' + remainingText);


        if (remainingText.length > 0) {
        	content.html(truncatedText + '<span class="more_fold_dots">...</span>');
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
            	content.html(truncatedText + '<span class="more_fold_dots">...</span>');
                toggleBtn.text("더보기");
            }
        });
        
        
		
	}

	<%-- 더보기 접기 토글버튼 끝 --%>
	
	
	<%-- 객실 추가이미지 더보기 접기  (첫번째 객식 101)--%>
	
	function myFunction_Show_accomo(){
		
		$("div#item a#accomo_1_open").click(function(){
			
			$("div#carousel_underItem_wrap").show();
			
		});
		
		
		
	}
	
	
	function myFunction_Hide_accomo(){
		
		$("div#item a#accomo_1_hide").click(function(){
			
			$("div#carousel_underItem_wrap").hide();
			
		});
		
		
		
	}
	
	<%-- 객실 추가이미지 더보기 접기  (첫번째 객식 101)--%>
	
	
<%-- 객실 추가이미지 더보기 접기  (두번째 객식 102)--%>
	
	function myFunction_Show_accomo_2(){
		
		$("div#item_2 a#accomo_2_open").click(function(){
			
			$("div#carousel_underItem_wrap_2").show();
			
		});
		
		
		
	}
	
	
	function myFunction_Hide_accomo_2(){
		
		$("div#item_2 a#accomo_2_hide").click(function(){
			
			$("div#carousel_underItem_wrap_2").hide();
			
		});
		
		
		
	}
	
	<%-- 객실 추가이미지 더보기 접기  (두번째 객식 102)--%>
	
	
	<%-- 탭키를 트리거 클릭하기 위한 함수  --%>
	
	function myFunction_Trigger_tab(){
		
		$('a.tab_1').click(function() {
		      $('.nav-link').removeClass('current'); 
		      $(this).addClass('current'); 

		      $('div.accordion_wrap, .review_top, .review_content').hide(); 
		      $('#item, #item_2, .calendar').show(); 
		    });
		
		
	}
	
	<%-- 탭키를 트리거 클릭하기 위한 함수 끝  --%>
	
	
	
	

</script>







</head>
<body>
	<div id="container">
	
		
		<div class="row custom-topcontents col-md-9" id="top">
		
			<div class="col-md-7" id="top_left">
			
					<div id="top_left_upper">
					
						  <img class="col-12" src="">
					
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
						                             <img  class="col-lg-3 col-md-4 col-sm-6 ci" style="cursor:pointer;" src="<%= ctxPath%>/resources/images/강남데미안_추가1.jpg">
						                         </div>
						                         <div class="carousel-item" id="5">
						                             <img  class="col-lg-3 col-md-4 col-sm-6 ci" style="cursor:pointer;" src="<%= ctxPath%>/resources/images/강남데미안_추가2.jpg">
						                         </div>
						                         <div class="carousel-item" id="5">
						                             <img  class="col-lg-3 col-md-4 col-sm-6 ci" style="cursor:pointer;" src="<%= ctxPath%>/resources/images/강남제리스플래닛_JerryRoom_추가1.jpg">
						                         </div>
						                         <div class="carousel-item" id="5">
						                             <img  class="col-lg-3 col-md-4 col-sm-6 ci" style="cursor:pointer;" src="<%= ctxPath%>/resources/images/강남제리스플래닛_JerryRoom_추가2.jpg">
						                         </div>
						                         <div class="carousel-item" id="5">
						                             <img  class="col-lg-3 col-md-4 col-sm-6 ci" style="cursor:pointer;" src="<%= ctxPath%>/resources/images/강남제리스플래닛_JerryRoom_추가3.jpg">
						                         </div>
						                         <div class="carousel-item" id="5">
						                             <img  class="col-lg-3 col-md-4 col-sm-6 ci" style="cursor:pointer;" src="<%= ctxPath%>/resources/images/강남제리스플래닛_JerryRoom_추가4.jpg">
						                         </div>
						                         <div class="carousel-item" id="5">
						                             <img  class="col-lg-3 col-md-4 col-sm-6 ci" style="cursor:pointer;" src="<%= ctxPath%>/resources/images/강남제리스플래닛_JerryRoom_추가5.jpg">
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
							    <span class="badge badge-warning badge-pill">10.0</span>
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
						<div class="col">
							<div class="row">

									<p id="sajang">사장님 한마디</p>
									<div id="more_fold_toggleBtn" class="more_fold_btn">더보기</div>
							</div>
						
							<div class="more_fold_inner">
							
								<p id="more_fold_myContent" class="more_fold_content">COEX 전시장, 도심공항터미널, 종합무역센터, 올림픽 메인스타디움에 인접해 있어 비즈니스,관광 등 다양한 목적의 여행객들에게 이상적입니다 COEX 전시장, 도심공항터미널, 종합무역센터, 올림픽 메인스타디움에 인접해 있어 비즈니스,관광 등 다양한 목적의 여행객들에게 이상적입니다 </p>
			    			
							</div>
							
						</div>
					</div>
							
			</div>
		   
		   
		</div>
		
		<div class="col-lg-8 col-md-6 col-sm-8" id="tab">
		
				<nav class="navbar navbar-expand-sm bg-white navbar-white sticky-top mx-3">
				  <ul class="navbar-nav col-lg-12">
				  	<li class="nav-item">
				      <a style="font-size: 12pt;" class="nav-link tab_1">객실안내/예약</a>
				    </li>
				    <li class="nav-item">
				      <a style="font-size: 12pt;" class="nav-link tab_2">숙소정보</a>
				    </li>
				    <li class="nav-item">
				      <a style="font-size: 12pt;" class="nav-link tab_3">리뷰</a>
				    </li>
				  </ul>
				</nav>
		
		</div>
		
		  <div class="col-lg-8 calendar" id="night">
		  	    <i class="fas fa-chevron-down"></i>
		  		<input  type="text" id="daterange" readonly/>
		  		
		  		<p></p>
		  
		  </div>


		
	      <div id="item" class="col-lg-8">
		      	 <div style="display:flex;">
						<div class="col-lg-6 col-md-6 col-sm-6" >
								<img src="<%= ctxPath%>/resources/images/강남캠퍼스.jpg" alt="thumbnail" class="img-thumbnail item_image">
								<a id="accomo_1_open" class="carousel-control-next"  role="button"  style="background-color: none; border: none;  height: 45px; margin-top: 280px; margin-right: 20px;" >
								    <i class="fa-solid fa-photo-film"  onclick="myFunction_Show_accomo()"></i>
								</a>
						</div>			
						<div class="col-lg-6 col-md-6 col-sm-6 ">
							          <h5 class="col-sm-6 col-lg-12 mb-3 card-title" style="font-weight:600; ">슈페리어더블(오션뷰)</h5>
									 
									  <div class="col-sm-6 col-lg-12 mb-3 card-body">
									  
									  	<div style="height:80px;" >
		
										    <div style="display: flex; border-bottom: 1px solid rgba(128, 128, 128, 0.2);">
										      <span class="badge badge-danger badge-pill special_price">예약특가</span>					    
										      <h5 class="card-title item_special_price">109,900원</h5>
										    </div>
										    
									    </div>
									    <div  class="row col-lg-12">
									     	<p>입실시간</p>
									     	<p class="in_roomtime">15시 부터 </p>
									    </div> 	
									    
									    <div class="row col-lg-12" style=" border-bottom: 1px solid rgba(128, 128, 128, 0.2); ">
									     	<p>퇴실시간</p>
									     	<p class="out_roomtime">익일 11시 </p>
									    </div> 
									    
									      
									    
									    
									   <div class="room_101_btnannae" style="text-align:center; ">
									   
										  <button type="button" class="annae_btn col-12" data-toggle="modal" data-target="#exampleModal_centered_1" style="background-color: transparent; border: none; margin: 18px 0;">
										    <p style="color:#ff3300; font-weight: 600;">객실 이용 안내</p>
										  </button>
										  
										  <!-- Modal -->
											<!-- Modal 구성 요소는 현재 페이지 상단에 표시되는 대화 상자/팝업 창입니다. -->
											<div class="modal fade" id="exampleModal_centered_1">
											  <div class="modal-dialog modal-dialog-centered ">  

											    <div class="modal-content">
											      
											      <!-- Modal header -->
											      <div class="modal-header">
											        <h5 class="modal-title" style="font-weight: bold;">객실 이용 안내</h5>
											        <button type="button" class="close" data-dismiss="modal">&times;</button>
											      </div>
											      
											      <!-- Modal body -->
											      <div class="modal-body">
											        <p style="font-size: 10pt; color: #4d4d00; text-align:left;">편의시설</p>
											        <ul class="disc-list" style="list-style-type: disc;">
											        	
											        	<li style="font-size: 10pt; color: #999999; text-align:left;">TV,냉장고,헤어드라이기</li>
											        	
											        </ul>
													<div class="row col-lg-12" style=" border-bottom: 1px solid rgba(128, 128, 128, 0.2); "></div>
													
													<p style="font-size: 10pt; color: #4d4d00; text-align:left; margin-top:20px;">주차정보</p>
											        <ul class="disc-list" style="list-style-type: disc;">
											        	
											        	<li style="font-size: 10pt; color:  #248f24; text-align:left;">건물내주차장이용</li>
											        	
											        </ul>
													<div class="row col-lg-12" style=" border-bottom: 1px solid rgba(128, 128, 128, 0.2); "></div>
													
													<p style="font-size: 10pt; color: #4d4d00; text-align:left; margin-top:20px;">선택날짜</p>
											        <ul class="disc-list" style="list-style-type: disc;">
											        	
											        	<li class="modal_date" style="font-size: 10pt; color: #006699; text-align:left;"></li>
											        	
											        </ul>
				        
													
											      </div>
											      
											     
											    </div>
											  </div>
										   </div>	

										</div>         
										                    
									    <a href="#" class="btn btn-danger col-lg-12 btn_resv">숙박 예약</a>
									  </div>	 
						</div>
				  </div>					
	    			
	    			
	    			  <div class="col-lg-10" id="carousel_underItem_wrap" style="display: none;">
	    			    	<div style="margin-bottom:5px; text-align: right;">
	    			    	  <a id="accomo_1_hide" role="button"  style="background-color: none; border: none; " >
	    			    		<span><i class="fa-solid fa-rectangle-xmark" onclick="myFunction_Hide_accomo()"></i></span>			    			  	  			
	    			  	  	  </a>	
			    			</div>
			    			<div id='carousel_underItem' >
		        				<div id="carouselExampleControls" class="carousel slide" data-ride="carousel" data-interval ="false">
		        					<ol class="carousel-indicators">
									    <li data-target="#carouselExampleControls" data-slide-to="0" class="active"></li>
									    <li data-target="#carouselExampleControls" data-slide-to="1"></li>
									    <li data-target="#carouselExampleControls" data-slide-to="2"></li>
									    <li data-target="#carouselExampleControls" data-slide-to="3"></li>
									    <li data-target="#carouselExampleControls" data-slide-to="4"></li>
									</ol>
								  <div class="carousel-inner">
								    <div class="carousel-item active">
								      <img class="d-block w-100" src="<%= ctxPath%>/resources/images/강남제리스플래닛_JerryRoom_추가2.jpg" alt="First slide">
								    </div>
								    <div class="carousel-item">
								      <img class="d-block w-100" src="<%= ctxPath%>/resources/images/강남제리스플래닛_JerryRoom_추가3.jpg" alt="Second slide">
								    </div>
								    <div class="carousel-item">
								      <img class="d-block w-100" src="<%= ctxPath%>/resources/images/강남제리스플래닛_JerryRoom_추가4.jpg" alt="Third slide">
								    </div>
								    <div class="carousel-item">
								      <img class="d-block w-100" src="<%= ctxPath%>/resources/images/강남제리스플래닛_JerryRoom_추가1.jpg" alt="Third slide">
								    </div>
								    <div class="carousel-item">
								      <img class="d-block w-100" src="<%= ctxPath%>/resources/images/강남제리스플래닛_JerryRoom_추가3.jpg" alt="Third slide">
								    </div>
								  </div>
								  
									  <a class="carousel-control-prev col-lg-1" href="#carouselExampleControls" role="button" data-slide="prev" style="background-color:#d9d9d9; border-top-right-radius:7pt; border-bottom-right-radius:7pt;  height: 55px; margin-top: 197px;">
									    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
									    <span class="sr-only">Previous</span>
									  </a>
								  
			
									  <a class="carousel-control-next col-lg-1" href="#carouselExampleControls" role="button" data-slide="next" style="background-color:#d9d9d9; border-top-left-radius:7pt; border-bottom-left-radius:7pt;   height: 55px; margin-top: 197px;">
									    <span class="carousel-control-next-icon" aria-hidden="true"></span>
									    <span class="sr-only">Next</span>
									  </a>
								</div>									
		       				</div>	
	       				
				 	 </div>
							
	        </div>
	        
	        
			        
			 
			 
			  <div id="item_2" class="col-lg-8">
		      	 <div style="display:flex;">
						<div class="col-lg-6 col-md-6 col-sm-6" >
								<img src="<%= ctxPath%>/resources/images/강남캠퍼스.jpg" alt="thumbnail" class="img-thumbnail item_image_2">
								<a id="accomo_2_open" class="carousel-control-next"  role="button"  style="background-color: none; border: none;  height: 45px; margin-top: 280px; margin-right: 20px;" >
								    <i class="fa-solid fa-photo-film"  onclick="myFunction_Show_accomo_2()"></i>
								</a>
						</div>			
						<div class="col-lg-6 col-md-6 col-sm-6 ">
							          <h5 class="col-sm-6 col-lg-12 mb-3 card-title" style="font-weight:600; ">슈페리어더블(오션뷰)</h5>
									 
									  <div class="col-sm-6 col-lg-12 mb-3 card-body">
									  
									  	<div style="height:80px;" >
		
										    <div style="display: flex; border-bottom: 1px solid rgba(128, 128, 128, 0.2);">
										      <span class="badge badge-danger badge-pill special_price_2">예약특가</span>					    
										      <h5 class="card-title item_special_price_2">109,900원</h5>
										    </div>
										    
									    </div>
									    <div  class="row col-lg-12">
									     	<p>입실시간</p>
									     	<p class="in_roomtime_2">15시 부터 </p>
									    </div> 	
									    
									    <div class="row col-lg-12" style=" border-bottom: 1px solid rgba(128, 128, 128, 0.2); ">
									     	<p>퇴실시간</p>
									     	<p class="out_roomtime_2">익일 11시 </p>
									    </div> 
									   <div class="room_102_btnannae" style="text-align:center; ">
										  <button type="button" class="annae_btn col-12" data-toggle="modal" data-target="#exampleModal_centered_2" style="background-color: transparent; border: none; margin: 18px 0;">
										    <p style="color:#ff3300; font-weight: 600;">객실 이용 안내</p>
										  </button>
										  
										  <!-- Modal -->
											<!-- Modal 구성 요소는 현재 페이지 상단에 표시되는 대화 상자/팝업 창입니다. -->
											<div class="modal fade" id="exampleModal_centered_2">
											  <div class="modal-dialog modal-dialog-centered ">  
											  
											    <div class="modal-content">
											      
											      <!-- Modal header -->
											      <div class="modal-header">
											        <h5 class="modal-title" style="font-weight: bold;">객실 이용 안내</h5>
											        <button type="button" class="close" data-dismiss="modal">&times;</button>
											      </div>
											      
											      <!-- Modal body -->
											      <div class="modal-body">
											        <p style="font-size: 10pt; color: #4d4d00; text-align:left;">편의시설</p>
											        <ul class="disc-list" style="list-style-type: disc;">
											        	
											        	<li style="font-size: 10pt; color: #999999; text-align:left;">TV,냉장고,헤어드라이기</li>
											        	
											        </ul>
													<div class="row col-lg-12" style=" border-bottom: 1px solid rgba(128, 128, 128, 0.2); "></div>
													
													<p style="font-size: 10pt; color: #4d4d00; text-align:left; margin-top:20px;">주차정보</p>
											        <ul class="disc-list" style="list-style-type: disc;">
											        	
											        	<li style="font-size: 10pt; color:  #248f24; text-align:left;">건물내주차장이용</li>
											        	
											        </ul>
													<div class="row col-lg-12" style=" border-bottom: 1px solid rgba(128, 128, 128, 0.2); "></div>
													
													<p style="font-size: 10pt; color: #4d4d00; text-align:left; margin-top:20px;">선택날짜</p>
											        <ul class="disc-list" style="list-style-type: disc;">
											        	
											        	<li class="modal_date" style="font-size: 10pt; color: #006699; text-align:left;"></li>
											        	
											        </ul>
											        
													
											      </div>
											      
											     
											    </div>
											  </div>
										   </div>	
										</div>                             
									    <a href="#" class="btn btn-danger col-lg-12 btn_resv_2">숙박 예약</a>
									  </div>	 
						</div>
				  </div>					
	    			
	    			
	    			  <div class="col-lg-10" id="carousel_underItem_wrap_2" style="display: none;">
	    			    	<div style="margin-bottom:5px; text-align: right;">
	    			    	  <a id="accomo_2_hide" role="button"  style="background-color: none; border: none; " >
	    			    		<span><i class="fa-solid fa-rectangle-xmark" onclick="myFunction_Hide_accomo_2()"></i></span>			    			  	  			
	    			  	  	  </a>	
			    			</div>
			    			<div id='carousel_underItem_2' >
		        				<div id="carouselExampleControls2" class="carousel slide" data-ride="carousel" data-interval ="false">
		        					<ol class="carousel-indicators">
									    <li data-target="#carouselExampleControls2" data-slide-to="0" class="active"></li>
									    <li data-target="#carouselExampleControls2" data-slide-to="1"></li>
									    <li data-target="#carouselExampleControls2" data-slide-to="2"></li>
									    <li data-target="#carouselExampleControls2" data-slide-to="3"></li>
									    <li data-target="#carouselExampleControls2" data-slide-to="4"></li>
									</ol>
								  <div class="carousel-inner">
								    <div class="carousel-item active">
								      <img class="d-block w-100" src="<%= ctxPath%>/resources/images/강남제리스플래닛_JerryRoom_추가1.jpg" alt="First slide">
								    </div>
								    <div class="carousel-item">
								      <img class="d-block w-100" src="<%= ctxPath%>/resources/images/강남제리스플래닛_JerryRoom_추가4.jpg" alt="Second slide">
								    </div>
								    <div class="carousel-item">
								      <img class="d-block w-100" src="<%= ctxPath%>/resources/images/강남제리스플래닛_JerryRoom_추가2.jpg" alt="Third slide">
								    </div>
								    <div class="carousel-item">
								      <img class="d-block w-100" src="<%= ctxPath%>/resources/images/강남제리스플래닛_JerryRoom_추가3.jpg" alt="Third slide">
								    </div>
								    <div class="carousel-item">
								      <img class="d-block w-100" src="<%= ctxPath%>/resources/images/강남제리스플래닛_JerryRoom_추가1.jpg" alt="Third slide">
								    </div>
								  </div>
								  
									  <a class="carousel-control-prev col-lg-1" href="#carouselExampleControls2" role="button" data-slide="prev" style="background-color:#d9d9d9; border-top-right-radius:7pt; border-bottom-right-radius:7pt;  height: 55px; margin-top: 197px;">
									    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
									    <span class="sr-only">Previous</span>
									  </a>
								  
			
									  <a class="carousel-control-next col-lg-1" href="#carouselExampleControls2" role="button" data-slide="next" style="background-color:#d9d9d9; border-top-left-radius:7pt; border-bottom-left-radius:7pt;   height: 55px; margin-top: 197px;">
									    <span class="carousel-control-next-icon" aria-hidden="true"></span>
									    <span class="sr-only">Next</span>
									  </a>
								</div>									
		       				</div>	
	       				
				 	 </div>
							
	        </div>       
			        
	     
	        
	        <%-- 아코디언 시작 =================================================================================================== --%>	
	    				
	        	<div class="accordion_wrap col-lg-8">
				<div class="accordion1">                        	
					<section id="normal_info">
						<p id="normal_info"><a href="#normal_info">기본 정보</a></p>
						<div class="first_section" style="margin-left: 32px; margin-top: 30px; margin-bottom: 30px;">
											 					        
							<p style="font-size: 12pt; color: #737373; text-align:left; font-weight:bold;">주변정보</p>
					        <ul class="accordion_disc" style="list-style-type: disc;">
					        	
					        	<li style="font-size: 12pt; font-weight:600; color: #8c8c8c; text-align:left; font-weight:300;">제주국제공항 차량 10분/제주 이호테우 해변 차량 15분/한라생태숲 차량 25분</li>
					        	
					        </ul>
					        <p style="font-size: 12pt; color: #737373; text-align:left; font-weight:bold;">주차정보</p>
					        <ul class="accordion_disc" style="list-style-type: disc;">
					        	
					        	<li style="font-size: 12pt; font-weight:600; color: #8c8c8c; text-align:left; font-weight:300;">* 1객실 1주차 가능 미리주차불가(전화문의사절)/1객실에 차량두대불가,퇴실후 주차불가/총 17대 주차시설 보유</li>
					        	
					        </ul>
					        <div style="border-bottom: solid 3px magenta; margin-top: 30px;"></div>
					        
					         <div id="title">매장지도</div>
							 <div id="map" style="width:850px; height:200px;"></div>
					        
					        
					        
						</div>
					</section>							
					<section id="cost_info">
						<p id="cost_info"><a href="#cost_info">요금정보</a></p>
						<div class="first_section" style="margin-left:200px; margin-top: 30px;">
								
								<div style=" margin-top: 30px; font-weight:bold; font-size: 18px; margin-left:50px;"><p>숙박요금 안내</p></div>
								
  								<table style="height: 300px; text-align:center; border-radius: 5px 5px 0 0; border:1px solid #bfbfbf; margin-bottom: 30px; margin-left:50px;" class="col-12 ">
  								  <tr style="height:45px;">
									<th style="border-bottom:1px solid #bfbfbf; background-color:#8c8c8c; color:white; font-weight:300; font-size:10pt; width:250px;">객실 등급</th>
									<th style="border-bottom:1px solid #bfbfbf; border-left:1px solid #bfbfbf; background-color:#8c8c8c; color:white; font-weight:300; font-size:10pt;">월,화,수,목,금,토,일</th>
								  </tr>	
									<tr><!-- 첫번째 줄 시작 -->
									    <td style="border-left:1px solid #bfbfbf; border-right:1px solid #bfbfbf; border-bottom:1px solid #bfbfbf; font-weight:400;">디럭스(주차불가)</td>
									    <td style="border-bottom:1px solid #bfbfbf; font-weight:400;">150000</td>
									</tr><!-- 첫번째 줄 끝 -->
									<tr><!-- 두번째 줄 시작 -->
									    <td style="border-bottom:1px solid #bfbfbf; border-right:1px solid #bfbfbf; font-weight:400;">스위트(넷플리스 시청가능)</td>
									    <td style="border-right:1px solid #bfbfbf; border-bottom:1px solid #bfbfbf; font-weight:400;">150000</td>
									</tr><!-- 두번째 줄 끝 -->
							    </table>
  				   </div>
					</section>    
					<section id="seller_info">
						<p id="seller_info"><a href="#seller_info">판매자 정보</a></p>
						<div class="first_section" style="margin-left: 32px; margin-top: 30px; margin-bottom: 30px;">
							<p style="font-size: 12pt; color: #737373; text-align:left; font-weight:bold;">상호</p>
					        <ul class="accordion_disc" style="list-style-type: disc;">
					        	
					        	<li style="font-size: 12pt; font-weight:600; color: #8c8c8c; text-align:left; font-weight:300;">포레스타</li>
					        	
					        </ul>
					        <p style="font-size: 12pt; color: #737373; text-align:left; font-weight:bold;">대표자명</p>
					        <ul class="accordion_disc" style="list-style-type: disc;">
					        	
					        	<li style="font-size: 12pt; font-weight:600; color: #8c8c8c; text-align:left; font-weight:300;">ㅇㅇㅇ</li>
					        	
					        </ul>
					        <p style="font-size: 12pt; color: #737373; text-align:left; font-weight:bold;">주소</p>
					        <ul class="accordion_disc" style="list-style-type: disc;">
					        	
					        	<li style="font-size: 12pt; font-weight:600; color: #8c8c8c; text-align:left; font-weight:300;">서울특별시 서대문구 연세로4길 16</li>
					        	
					        </ul>
					        <p style="font-size: 12pt; color: #737373; text-align:left; font-weight:bold;">전화번호</p>
					        <ul class="accordion_disc" style="list-style-type: disc;">
					        	
					        	<li style="font-size: 12pt; font-weight:600; color: #8c8c8c; text-align:left; font-weight:300;">11111111111</li>
					        	
					        </ul>
					        <p style="font-size: 12pt; color: #737373; text-align:left; font-weight:bold;">이메일</p>
					        <ul class="accordion_disc" style="list-style-type: disc;">
					        	
					        	<li style="font-size: 12pt; font-weight:600; color: #8c8c8c; text-align:left; font-weight:300;">SSangyoung@sist.com</li>
					        	
					        </ul>
					        <p style="font-size: 12pt; color: #737373; text-align:left; font-weight:bold;">사업자번호</p>
					        <ul class="accordion_disc" style="list-style-type: disc;">
					        	
					        	<li style="font-size: 12pt; font-weight:600; color: #8c8c8c; text-align:left; font-weight:300;">12341234</li>
					        	
					        </ul>
						</div>
					</section>
					<section id="convi_info">
						<p id="convi_info"><a href="#convi_info">편의시설 및 서비스</a></p>
						<div class="first_section" style="margin-left: 32px; margin-top: 30px; margin-bottom: 30px;">
											 					        
							<p style="font-size: 12pt; color: #737373; text-align:left; font-weight:bold;">편의시설 및 서비스</p>
					        <ul class="accordion_disc" style="list-style-type: disc;">
					        	
					        	<li style="font-size: 12pt; font-weight:600; color: #8c8c8c; text-align:left; font-weight:300;">TV,냉장고,헤어드라이기</li>
					        	
					        </ul>
					        
						</div>
					</section>	                      
				</div>
			</div>
		
			
		       <%-- 아코디언 끝 =================================================================================================== --%>	
			
			
			
			
			
	
	<%-- review 탭 시작 ===================================================================================================  --%>		
			
			<div class="review_top col-lg-8 col-md-6 col-sm-4">
				
				<p style="display: flex; justify-content: center; font-size:25px; font-weight:bold; margin-bottom: -15px;">추천해요</p>
				 <div style="display:flex;justify-content: center;">
				 <label class="result_starr" style="font-size: 3em; color: transparent; text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);">★★★★★</label><p style="font-weight: bold; font-size: 35px; margin-left: 18px; margin-top:17px;">10.0</p>
				 </div>
				 
				<div style="display: flex; justify-content: center;">
				
					<p style="font-size: 17px;">전체리뷰 :</p>
					<div style="display:flex;   gap: 55px;">
						<strong>1983</strong>
						<div>
							<button type="button" style="border:none; background-color:transparent;" data-toggle="modal" data-target="#exampleModal_scrolling_2">
								<p>운영정책 ></p>
							</button>
							<div class="modal fade" id="exampleModal_scrolling_2" style="max-height: 600px; width: 450px; margin-top: 70px; margin-left: 550px;">
							  <div class="modal-dialog modal-dialog-scrollable ">  <!-- modal-dialog-scrollable 이거 달게 되면 스크롤되게 된다. -->
							  <!-- .modal-dialog-scrollable을 .modal-dialog에 추가하여 페이지 자체가 아닌 모달 내부에서만 스크롤할 수 있습니다. -->
							    <div class="modal-content">
							      
							      <!-- Modal header -->
							      <div class="modal-header">
							        <h5 class="modal-title" style="font-weight: bold;">리뷰 운영정책</h5>
							        <button type="button" class="close" data-dismiss="modal">&times;</button>
							      </div>
							      
							      <!-- Modal body -->
							      <div class="modal-body">
							            <p style="font-weight:bold;">1. 리얼리뷰 란?</p>
										<p>여기어때는 고객님에게 신뢰성 높은 양질의 리뷰를 제공하기 위해 예약 결제를 통해 실제로 숙소를 이용한 회원만 리뷰를 남길 수 있으며, 작성된 리뷰에는 '리얼리뷰'인증 마크가 표기됩니다. </p>
										<p style="font-weight:bold;">2. 베스트리뷰 란?</p>
										<p>베스트 리뷰는 리뷰 내용, 글자 수, 등록된 사진, 작성일 등을 종합적으로 고려해 여기어때 또는 판매자가 추천한 리뷰입니다.</p>
										<p style="font-weight:bold;">3. 리얼리뷰 작성</p>
										<p>숙소에 체크인하면, 리뷰를 작성할 수 있습니다.</p>
										<ul>
											<li>모텔 : 체크인 시간~체크아웃 14일 이내</li>
											<li>모텔 외 : 체크인 시간~체크아웃 30일 이내</li>
										</ul>
										<p style="font-weight:bold;">4. 삭제 정책</p>
										<p>여기어때는 고객님이 작성하신 긍정/부정적인 모든 리뷰를 있는 그대로 게시하는 것을 기본 운영방침으로 삼고 있습니다.</p>
										<p>정보통신망 이용촉진 및 정보보호 등에 관한 법률 제44조 2항(정보 삭제 요청 등)에 의거하여 아래의 정책에 위배되는 게시물의 경우 삭제조치가 진행됩니다.</p>
										<ul>
											<li>1) 욕설 및 비속어, 음란성</li>
											<li>2) 스팸, 광고, 도배성</li>
											<li>3) 방문한 숙소와 전혀 관계없는 내용</li>
											<li>4) 리모델링, 사업주 변경의 경우</li>
											<li>5) 타업체를 거론한 게시물</li>
											<li>6) 예약을 취소한 게시물</li>
											<li>7) 권리침해신고</li>
										</ul>
										<p style="font-weight:bold;">5. 처리 절차 및 참고내용</p>
										<ul>
											<li>1) 삭제 처리는 1차 실무자를 거쳐 최종 책임자의 확인하에 처리되고 있습니다.</li>
											<li>2) 삭제된 리뷰는 평점에 포함되지 않으며 적립된 포인트가 차감됩니다.<br/>(리모델링, 사업주 변경의 경우는 포인트 미차감)</li>
										</ul>
							      </div>
							      
							    </div>
							  </div>
							</div>
						</div>	
					</div>
					
				
				</div>
				<div class="col-lg-12" style="border: solid 1px gray; margin-top: 40px;"></div>
			</div>
			
			<div class="review_content col-lg-8 col-md-6 col-sm-4">
				
				<p style="font-size:15px; font-weight: bold;">여기만한 곳은 어디에도 없을 거예요.</p>
					<div style="display:flex;">
						<label class="result_starr" style="color: transparent; text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);">★★★★★</label><p style="font-weight: 550; font-size: 19px; margin-left: 8px;">10</p>
					</div>			
				<p style="font-weight: lighter; color: #808080;">디럭스(주차불가) 객실 이용</p>
				<p >음식이 친절합니다. 다신 안갈거같아요.~~음식이 친절합니다. 다신 안갈거같아요.~~음식이 친절합니다. 다신 안갈거같아요.~~음식이 친절합니다. 다신 안갈거같아요.~~음식이 친절합니다. 다신 안갈거같아요.~~음식이 친절합니다. 다신 안갈거같아요.~~음식이 친절합니다. 다신 안갈거같아요.~~음식이 친절합니다. 다신 안갈거같아요.~~</p>
				<div class="col-lg-12" style="border: solid 1px gray; margin-top: 40px;"></div>
			</div>
			
			
			
			
			
			
		<%-- review 탭 끝 ===================================================================================================  --%>		
			
					
					<%-- 리뷰 쓰는 것 태그 --%>
					<form class="review_input" name="myform" id="myform" method="post">
						<fieldset>
							<span class="text-bold">별점을 선택해주세요</span>
							<input type="radio" name="reviewStar" value="5" id="rate1"><label
								for="rate1">★</label>
							<input type="radio" name="reviewStar" value="4" id="rate2"><label
								for="rate2">★</label>
							<input type="radio" name="reviewStar" value="3" id="rate3"><label
								for="rate3">★</label>
							<input type="radio" name="reviewStar" value="2" id="rate4"><label
								for="rate4">★</label>
							<input type="radio" name="reviewStar" value="1" id="rate5"><label
								for="rate5">★</label>
						</fieldset>
						<div>
							<textarea class="col-auto form-control" type="text" id="reviewContents"
									  placeholder="후기를 남겨주신 회원님께 BEST 후기를 선정하여 상품을 드리고 있습니다.!! 많은 참여부탁!!!"></textarea>
						</div>
				    </form>								
				    

			
		</div>	
			
			
			
		 
	
	      

	


</body>
</html>
