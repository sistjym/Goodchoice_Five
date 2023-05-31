<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
   String ctxPath = request.getContextPath();
%>
<script src="<%= ctxPath%>/resources/Highcharts-11.0.1/code/highcharts.js"></script>
<script src="<%= ctxPath%>/resources/Highcharts-11.0.1/code/modules/wordcloud.js"></script>
<script src="<%= ctxPath%>/resources/Highcharts-11.0.1/code/modules/exporting.js"></script>
<script src="<%= ctxPath%>/resources/Highcharts-11.0.1/code/modules/export-data.js"></script>
<script src="<%= ctxPath%>/resources/Highcharts-11.0.1/code/modules/accessibility.js"></script> 

<script type="text/javascript">

	
	$(document).ready(function(){
		const text =
	        'Chapter 1. Down the Rabbit-Hole ' +
	        'Alice was beginning to get very tired of sitting by her sister on the bank, and of having nothing to do: ' +
	        'once or twice she had peeped into the book her sister was reading, but it had no pictures or conversations ' +
	        'in it, \'and what is the use of a book,\' thought Alice \'without pictures or conversation?\'' +
	        'So she was considering in her own mind (as well as she could, for the hot day made her feel very sleepy ' +
	        'and stupid), whether the pleasure of making a daisy-chain would be worth the trouble of getting up and picking ' +
	        'the daisies, when suddenly a White Rabbit with pink eyes ran close by her 랄라.',

	    lines = text.replace(/[():'?0-9]+/g, '').split(/[,\. ]+/g),
	    data = lines.reduce((arr, word) => {
	        let obj = Highcharts.find(arr, obj => obj.name === word);
	        if (obj) {
	            obj.weight += 1;
	        } else {
	            obj = {
	                name: word,
	                weight: 1
	            };
	            arr.push(obj);
	        }
	        return arr;
	    }, []);

	    Highcharts.chart('container', {
		    accessibility: {
		        screenReaderSection: {
		            beforeChartFormat: '<h2 style="font-weight:bold; font-size:30pt;">{chartTitle}</h2>' +
		                '<div>{chartSubtitle}</div>' +
		                '<div>{chartLongdesc}</div>' +
		                '<div>{viewTableButton}</div>'
		        }
		    },
		    series: [{
		        type: 'wordcloud',
		        data,
		        name: 'Occurrences'
		    }],
		    title: {
		        text: '',
		        align: 'center'
		    },
		    subtitle: {
		        text: '',
		        align: 'left'
		    },
		    tooltip: {
		        headerFormat: '<span style="font-size: 16px"><b>{point.key}</b></span><br>'
		    }
	 });
	    
	  /////////////////////////////////////////////////////////////////
	  
	   $("button#searchBtn").click(function(){
		   
		  alert("검색"); 
	   });
	    
	    
	
	   
   });// end of $(document).ready(function(){})-----------------------
   
   // Function declaration
   


</script>   

  <div id="contents">
                <div class="main_link">
                    <ul>
                        <li><a href="#" manu-link=1><span class="ico_01">&nbsp;</span>
                                <p>모텔</p>
                            </a></li>
                        <li><a href="#" manu-link=1><span class="ico_02">&nbsp;</span>
                                <p>호텔 리조트</p>
                            </a></li>
                        <li><a href="#" manu-link=1><span class="ico_03">&nbsp;</span>
                                <p>펜션</p>
                            </a></li>
                        <li><a href="#" manu-link=1><span class="ico_04">&nbsp;</span>
                                <p>게스트하우스</p>
                            </a></li>
                        <li><a href="#" manu-link=1><span class="ico_05">&nbsp;</span>
                                <p>캠핑 글램핑</p>
                            </a></li>
                        <li><a href="#" manu-link=1><span class="ico_09">&nbsp;</span>
                                <p>해외여행</p>
                            </a></li>
                    </ul>
                </div>
                <div class="search_boxContainter squareSt tabContent">
                    <div class="inner_searchBox">
                        <div class="searchTheme searchBar">
                            <div class="bar">
                                <span class="icon_wrapper">
                                    <i class="fa-solid fa-magnifying-glass fa-xl icon"></i>
                                </span>
                                <div class="input_info">
                                   
                                    <input class="iconBox_child" size=80
                                        maxlength=30 placeholder="어디로 떠나시나요?" />
                                </div>
                            </div>

                        </div>
                        <div class="searchDate searchBar">
                            <div class="bar">
                                <span class="icon_wrapper">
                                    <i class="fa-regular fa-calendar fa-xl icon"></i>
                                </span>
                                <div class="input_info">
                                    <input type="text" name="daterange" class="iconBox_child" placeholder="일정을 선택하세요"
                                        value="" />

                                </div>
                            </div>

                        </div>
                        <div class="searchPeople searchBar">
                            <div class="bar">
                                <span class="icon_wrapper">
                                    <i class="fa-solid fa-person fa-xl icon"></i>
                                </span>
                                <div class="person-spinner">
                                    <div>
                                        <span class="minus"><i class="fa-solid fa-circle-minus fa-xl"
                                                style="color: #f7323f;"></i></span>
                                        <input class="count iconBox_child" type="number" name="qty" value="0"
                                             />
                                        <span class="plus"><i class="fa-solid fa-circle-plus fa-xl "
                                                style="color: #f7323f;"></i></span>
                                    </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- 검색하기 버튼 -->
                    <div class="searchBtnBox">
                        <button id="searchBtn">
                            <div>
                                <span class="searcText">
                                   	 검색하기
                                </span>
                            </div>
                        </button>
                    </div>
                    
					<!-- 검색어 기반 워드 클라우드  -->
                    <div class="wordCloud_wrapper">
                    <h2 class="word_cloud_title">지금 핫한 키워드</h2>
                       <figure class="highcharts-figure">
						    <div id="container"></div>
						    <p class="highcharts-description">
						       
						    </p>
					   </figure>
                    </div>

                    <!-- 이벤트 -->
                    <section class="review_part">
                        <h2 class="display_top_destination"> 대한민국 내 인기 여행지 </h2>
                        <div class="top_wrapper slide-track">
                            <li class="destination_1">
                                <a class="province">
                                    <img class="destnationImg"
                                        src="https://pix6.agoda.net/geo/city/16901/1_16901_02.jpg?ca=6&ce=1&s=345x345&ar=1x1">
                                    <span class="destination_name">제주도</span>

                                </a>
                            </li>
                            <li class="destination_1">
                                <a class="province">
                                    <img class="destnationImg"
                                        src="https://pix6.agoda.net/geo/city/14690/1_14690_02.jpg?ca=6&ce=1&s=345x345&ar=1x1">
                                    <span class="destination_name">서울</span>

                                </a>
                            </li>
                            <li class="destination_1">
                                <a class="province">
                                    <img class="destnationImg"
                                        src="https://pix6.agoda.net/geo/city/17234/1_17234_02.jpg?ca=6&ce=1&s=345x345&ar=1x1">
                                    <span class="destination_name">경기도</span>

                                </a>
                            </li>

                            <li class="destination_1">
                                <a class="province">
                                    <img class="destnationImg"
                                        src="https://pix6.agoda.net/geo/city/17172/1_17172_02.jpg?ca=6&ce=1&s=345x345&ar=1x1">
                                    <span class="destination_name">부산</span>
                                </a>
                            </li>
                        </div>


                    </section>
                    <!-- 추후에 for문으로 데이터 뿌릴것 -->
                    <h2 class="sort_category"> 여행객의 생생 이용후기 </h2>
                    <section class="center slider">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">숙소이름</h4>
                                <p class="card-text">지역</p>
                                <p class="card-text">리뷰내용</p>
                                <p class="card-text">회원아이디</p>

                            </div>
                        </div>
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">숙소이름</h4>
                                <p class="card-text">지역</p>
                                <p class="card-text">리뷰내용</p>
                                <p class="card-text">회원아이디</p>

                            </div>
                        </div>
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">숙소이름</h4>
                                <p class="card-text">지역</p>
                                <p class="card-text">리뷰내용</p>
                                <p class="card-text">회원아이디</p>

                            </div>
                        </div>
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">숙소이름</h4>
                                <p class="card-text">지역</p>
                                <p class="card-text">리뷰내용</p>
                                <p class="card-text">회원아이디</p>

                            </div>
                        </div>
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">숙소이름</h4>
                                <p class="card-text">지역</p>
                                <p class="card-text">리뷰내용</p>
                                <p class="card-text">회원아이디</p>

                            </div>
                        </div>
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">숙소이름</h4>
                                <p class="card-text">지역</p>
                                <p class="card-text">리뷰내용</p>
                                <p class="card-text">회원아이디</p>

                            </div>
                        </div>
                    </section>
                    
                    <script>

                    </script>

                </div><!-- end of main contant-->
</body>
</html>