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
<title>업주 승인</title>
</head>
<body>
<div>
<div>
<table class="table table-hover">
  <thead>
    <tr>
      <th scope="col">번호</th>
      <th scope="col">숙소 이름 </th>
      <th scope="col">호스트</th>
      <th scope="col">승인 여부</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">1</th>
      <td>호텔</td>
      <td>김차차</td>
      <td>보류</td>
    </tr>
    <tr>
      <th scope="row">2</th>
      <td>A모텔</td>
      <td>이차차</td>
      <td>승인</td>
    </tr>
    <tr>
      <th scope="row">3</th>
      <td colspan="2">Larry the Bird</td>
      <td>@twitter</td>
    </tr>
  </tbody>
</table>
   
   </div>
</div>
</body>
</html>