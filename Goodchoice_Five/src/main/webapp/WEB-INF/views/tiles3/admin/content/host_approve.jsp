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
<span>권한 승인이 되기전 업주들을 권한을 업데이트 하기전에 보여주는 게시판 </span>
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
    <tr>
      <th scope="row">1</th>
      <th>209-392321-123123</th>
      <td>김차차</td>
      <td>qwer@naver.com</td>
      <td><button type="button" class="btn btn-primary btn-sm">승인하기</button></td>
    </tr>
   
  </tbody>
</table>
   
   </div>
</div>
</body>
</html>