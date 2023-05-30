<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
   String ctxPath = request.getContextPath();
%>   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>업주 승인</title>
</head>
<body>
<div>
<div>
<h3 class="admin_subject">업주 승인(관리자 전용)</h3>
<table class="table table-hover aprovTable">
  <thead>
    <tr>
      <th scope="col">번호</th>
      <th scope="col">사압자 등록번호</th>
      <th scope="col">대표자명 </th>
      <th scope="col">이메일 </th>
      <th scope="col">승인 여부</th>
    </tr>
  </thead>
  <tbody>
  
  </tbody>
</table>
   
   </div>
</div>
</body>
</html>