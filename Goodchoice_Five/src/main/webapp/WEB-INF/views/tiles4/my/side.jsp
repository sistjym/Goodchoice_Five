<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String ctxPath = request.getContextPath();
%>

	<p class="sub_title">내 정보 관리</p>

	<!-- Nav -->
	<nav class="myside">
		<ul class="myside-ul">
			<li class="myside-li"><a class="mya" href="<%= ctxPath%>/mypoint.gc">포인트</a></li>
			<li class="myside-li"><a class="mya" href="<%= ctxPath%>/myreservation.gc">예약 내역</a></li>
			<li class="myside-li"><a class="mya" href="<%= ctxPath%>/mypage.gc">내 정보 관리</a></li>
		</ul>
	</nav>
	