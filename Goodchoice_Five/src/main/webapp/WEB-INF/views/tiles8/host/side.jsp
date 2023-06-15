<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String ctxPath = request.getContextPath();
%>
	<p class="sub_title">내 정보 관리</p>

	<!-- Nav -->
	<nav class="myside">
		<ul class="myside-ul">
			<li class="myside-li"><a class="mya" href="<%= ctxPath%>/hostRegister.gc">숙소등록</a></li>
			<li class="myside-li"><a class="mya" href="<%= ctxPath%>/hostEdit.gc">숙소 정보수정</a></li>
		</ul>
	</nav>
	