<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
%>

<%
   String ctxPath = request.getContextPath();
%>

	<p class="sub_title">내 정보 관리</p>

	<!-- Nav -->
	<nav class="myside">
		<ul class="myside-ul">
			<li class="myside-li"><a class="mya" href="<%=ctxPath%>/showAllHost.gc">호스트 관리</a></li>
			<li class="myside-li"><a class="mya" href="<%=ctxPath%>/acomm_approve.gc">숙소 승인 </a></li>
			<li class="myside-li"><a class="mya" href="<%=ctxPath%>/showAllAcomm.gc">모든 숙소 보기</a></li>
			<li class="myside-li"><a class="mya" href="#">모든 회원 보기</a></li>
			<li class="myside-li"><a class="mya" href="#">숙소 데이터 차트</a></li>
		</ul>
	</nav>
	