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
                <a class href="<%= ctxPath%>/main/hosthome.gc">여기어때</a>
            </h1>
            <ul class="gnb_pc">
                <li>
                    <a href="#">내주변</a>
                </li>
					
					
                 <li class="dropdown">
                    <button class="dropbtn">호스트 전용</button>
                     <ul class="dropdown-content">
                        <a href="<%= ctxPath%>/hostRegister.gc">숙소 등록하기</a>
                        <a href="<%= ctxPath%>/hostEdit.gc">숙소 수정하기</a>
                    </ul>
                </li> 
	
				<c:if test="${sessionScope.loginuser == null}">
					<li>
			           <a href="<%= ctxPath%>/memberLogin.gc"><span>로그인</span></a>
			        </li>
				</c:if>
               
                <c:if test="${sessionScope.loginuser != null}">
	                <li>
	                    <a href="<%= ctxPath%>/memberLogout.gc"><span>로그아웃</span></a>
	                </li>
	            </c:if>
	            
	          
            </ul>
        </section>
    </header>
