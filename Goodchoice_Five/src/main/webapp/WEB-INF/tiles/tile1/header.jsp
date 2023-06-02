<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.net.InetAddress"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	String ctxPath = request.getContextPath();
%>
    <header>
        <section class="header_category">
            <h1>
                <a class href="<%= ctxPath%>/main/home.gc">여기어때</a>
            </h1>
            <ul class="gnb_pc">
                <li>
                    <a href="#">내주변</a>
                </li>
                <li>
                    <a href="#">예약내역</a>
                </li>

                 <li class="dropdown">
                    <button class="dropbtn"> 관리자 전용</button>
                     <ul class="dropdown-content">
                        <a href="<%= ctxPath%>/showAllAcomm.gc">모든 숙소 보기</a>
                        <a href="<%= ctxPath%>/showAllHost.gc">호스트 관리</a>
                        <a href="<%= ctxPath%>/acomm_approve.gc">숙소 등록 승인 하기</a>
                        <a href="<%= ctxPath%>/main/home.gc">숙소 데이터 차트</a>
                        <a href="<%= ctxPath%>/main/home.gc">모든 회원보기</a>
                    </ul>
                </li> 
	
				<c:if test="${sessionScope.loginuser == null}">
					<li>
			           <a href="<%= ctxPath%>/memberLogin.gc"><span>로그인</span></a>
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
