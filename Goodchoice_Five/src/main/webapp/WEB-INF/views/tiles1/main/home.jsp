<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지입니다</title>
</head>
<body>
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
                                        <input class=" count iconBox_child" type=" number" name="qty" value="0"
                                            size=3 />
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

                    <div>
                        <img class="banner"
                            src="https://image.goodchoice.kr/images/cms/home_img/b5afd7ef8280a4e7c1acc9a818c341d7.jpg" />
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
                                <h4 class="card-title" name="acomm_name" value="">숙소이름</h4>
                                <p class="card-text" name="province" value="">지역</p>
                                <p class="card-text" name="contents" value="">리뷰내용</p>
                                <p class="card-text" name="uderid" value="">회원아이디</p>

                            </div>
                        </div>
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title" name="acomm_name" value="">숙소이름</h4>
                                <p class="card-text" name="province" value="">지역</p>
                                <p class="card-text" name="contents" value="">리뷰내용</p>
                                <p class="card-text" name="uderid" value="">회원아이디</p>

                            </div>
                        </div>
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title" name="acomm_name" value="">숙소이름</h4>
                                <p class="card-text" name="province" value="">지역</p>
                                <p class="card-text" name="contents" value="">리뷰내용</p>
                                <p class="card-text" name="uderid" value="">회원아이디</p>

                            </div>
                        </div>
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title" name="acomm_name" value="">숙소이름</h4>
                                <p class="card-text" name="province" value="">지역</p>
                                <p class="card-text" name="contents" value="">리뷰내용</p>
                                <p class="card-text" name="uderid" value="">회원아이디</p>

                            </div>
                        </div>
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title" name="acomm_name" value="">숙소이름</h4>
                                <p class="card-text" name="province" value="">지역</p>
                                <p class="card-text" name="contents" value="">리뷰내용</p>
                                <p class="card-text" name="uderid" value="">회원아이디</p>

                            </div>
                        </div>
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title" name="acomm_name" value="">숙소이름</h4>
                                <p class="card-text" name="province" value="">지역</p>
                                <p class="card-text" name="contents" value="">리뷰내용</p>
                                <p class="card-text" name="uderid" value="">회원아이디</p>

                            </div>
                        </div>

                    </section>
                    
                    <script>

                    </script>

                </div><!-- end of main contant-->
</body>
</html>