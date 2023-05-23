<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.net.InetAddress"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	String ctxPath = request.getContextPath();
%>
    <header>
        <section>
            <h1>
                <a class href="#">여기어때</a>
            </h1>
            <ul class="gnb_pc">
                <li>
                    <a href="#">내주변</a>
                </li>
                <li>
                    <a href="#">예약내역</a>
                </li>

                <!-- <li class="dropdown">
                    <button class="dropbtn">더보기</button>
                    <ul class="dropdown-content">
                        <a href="#">공지사항</a>
                        <a href="#">이벤트</a>
                        <a href="#">자주 묻는 질문</a>
                        <a href="#">1:1 문의</a>
                        <a href="#">약관</a>
                    </ul>
                </li> -->
	
				<c:if test="${sessionScope.loginuser == null}">
					<li>
			           <a href="#"><span>로그인</span></a>
			        </li>
				</c:if>
               
                <c:if test="${sessionScope.loginuser != null}">
	                <li>
	                    <a href="#"><span>로그아웃</span></a>
	                </li>
	            </c:if>
            </ul>
        </section>
    </header>
