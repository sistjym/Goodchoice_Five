<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String ctxPath = request.getContextPath(); %>
<h3 style="font-weight:bold; font-size:12pt;">이용후기</h3>

<div class="reviewBox" style="margin:auto;">
	<c:if test="" var="rdto" items="${requestScope.reviewlist}">
	         <div style="float:left" class="reviewContent">
	            <c:if test="${rdto.pimage != 'noimage.png'  and not empty  rdto.pimage}">
	            	<img clase="image" src="<%=ctxPath%>/images/${rdto.pimage}" style="width:150px; height: 148px;"/>
	            </c:if>
	            <c:if test="${rdto.pimage1 != 'noimage.png' and not empty rdto.pimage1}">
	            	<img src="<%=ctxPath%>/images/${rdto.pimage1}" style="width:150px; height: 148px;"/>
	            </c:if>
	         </div>
	         <ul class="list-group" style="font-weight: bold; margin:auto;">
				  <li style="width:40%;" class="list-group-item">평점 : ${rdto.review_score}</li>
				  <li style="width:40%;" class="list-group-item">닉네임 : ${rdto.review_member_id }  | 날짜 :${rdto.review_date}  </li>
				  <li style="width:40%;" class="list-group-item">${rdto.review_content}</li>
			</ul>
	</c:if>
</div>

<!-- <nav class="my-5">
	<div style='display:flex; width:80%; position:relative; left :175px;'>
	    
	</div>
</nav> -->




