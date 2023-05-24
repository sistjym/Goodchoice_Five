<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<%
   String ctxPath = request.getContextPath();
%>   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모든 회원보기 </title>
</head>
<body>
<div>
<div>
<table class="table table-hover">
  <thead>
    <tr>
      <th scope="col">번호</th>
      <th scope="col">회원 이름 </th>
      <th scope="col">회원아이디</th>
      <th scope="col">포인트</th>
      <th scope="col">탈퇴여부</th>
      <th scope="col">휴먼여부</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">1</th>
      <td>1</td>
      <td>김차차</td>
      <td>chacha</td>
      <td></td>
      <td></td>
      <td></td>
    </tr>
    
  </tbody>
</table>
   
   </div>
</div>
</body>
</html>