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

   <h2>글목록</h2>
   
   <table class="table table-bordered">
      <thead>
       <tr>
         <th style="width: 70px;  text-align: center;">글번호</th>
         <th style="width: 360px; text-align: center;">제목</th>
         <th style="width: 70px;  text-align: center;">성명</th>
         <th style="width: 150px; text-align: center;">날짜</th>
         <th style="width: 70px;  text-align: center;">조회수</th>
       </tr>
      </thead>
      
      <tbody>
      	  <%-- <c:if test="${empty requestScope.boardList}">
      	  	<td colspan="5">게시글 데이터가 없습니다</td>
      	  </c:if> --%>
	      <c:if test="${not empty requestScope.boardList}">
	      	 <c:forEach var="boardvo" items="${requestScope.boardList}">
	      	 	<tr>
		         	<td align="center">${boardvo.seq}</td>
		         	
		         	<%-- 댓글쓰기 및 답변형  게시판 시작 --%>
		         	<%-- <td>
		         	 -- 원글인 경우 시작 
		         	  <c:if test="${boardvo.depthno == 0}">
			         	<c:if test="${boardvo.commentCount > 0}">
			         		<span class="subject" onclick="goView('${boardvo.seq}')">${boardvo.subject}<span style="vertical-align:super;">[<span style="color:red; font-size: 9pt; font-weight:bold; font-style:italic; ">${boardvo.commentCount}</span>]</span></span>
			         	</c:if>
			         	<c:if test="${boardvo.commentCount == 0}">
			         		<span class="subject" onclick="goView('${boardvo.seq}')">${boardvo.subject}</span>
			         	</c:if>
				     </c:if>
			         -- 원글인 경우 끝 
			         
			         -- 답변글인 경우 시작 
		         	 <c:if test="${boardvo.depthno > 0}">
			         	<c:if test="${boardvo.commentCount > 0}">
			         		<span class="subject" onclick="goView('${boardvo.seq}')"><span style="color:red; font-style:italic; padding-left:${boardvo.depthno * 20}px;">└Re&nbsp;</span>${boardvo.subject}<span style="vertical-align:super;">[<span style="color:red; font-size: 9pt; font-weight:bold; font-style:italic; ">${boardvo.commentCount}</span>]</span></span>
			         	</c:if>
			         	<c:if test="${boardvo.commentCount == 0}">
			         	<span class="subject" onclick="goView('${boardvo.seq}')"><span style="color:red; font-style:italic; padding-left:${boardvo.depthno * 20}px;">└Re&nbsp;</span>${boardvo.subject}</span>
			         	</c:if>
			         </c:if>	
			        -- 답변글인 경우 끝
		         	</td>
		         	댓글쓰기 및 답변형  게시판 끝 --%>
		         	
		         	<%-- 댓글쓰기 및 답변형  게시판 시작 --%>
		         	<td>
		         	<%-- 첨부파일이 없는 경우 시작  --%>
		         	<c:if test="${not empty boardvo.fileName}">
			         	  <%-- 원글인 경우 시작  --%>
			         	  <c:if test="${boardvo.depthno == 0}">
				         	<c:if test="${boardvo.commentCount > 0}">
				         		<span class="subject" onclick="goView('${boardvo.seq}')">${boardvo.subject}<span style="vertical-align:super;">[<span style="color:red; font-size: 9pt; font-weight:bold; font-style:italic; ">${boardvo.commentCount}</span>]</span></span>&nbsp;<img src="<%= ctxPath%>/resources/images/disk.gif"/>
				         	</c:if>
				         	<c:if test="${boardvo.commentCount == 0}">
				         		<span class="subject" onclick="goView('${boardvo.seq}')">${boardvo.subject}</span>&nbsp;<img src="<%= ctxPath%>/resources/images/disk.gif"/>
				         	</c:if>
					     </c:if>
				         <%-- 원글인 경우 끝  --%>
				         
				         <%-- 답변글인 경우 시작  --%>
			         	 <c:if test="${boardvo.depthno > 0}">
				         	<c:if test="${boardvo.commentCount > 0}">
				         		<span class="subject" onclick="goView('${boardvo.seq}')"><span style="color:red; font-style:italic; padding-left:${boardvo.depthno * 20}px;">└Re&nbsp;</span>${boardvo.subject}<span style="vertical-align:super;">[<span style="color:red; font-size: 9pt; font-weight:bold; font-style:italic; ">${boardvo.commentCount}</span>]</span></span>&nbsp;<img src="<%= ctxPath%>/resources/images/disk.gif"/>
				         	</c:if>
				         	<c:if test="${boardvo.commentCount == 0}">
				         	<span class="subject" onclick="goView('${boardvo.seq}')"><span style="color:red; font-style:italic; padding-left:${boardvo.depthno * 20}px;">└Re&nbsp;</span>${boardvo.subject}</span>&nbdp;<img src="<%= ctxPath%>/resources/images/disk.gif"/>
				         	</c:if>
				         </c:if>	
				         <%-- 답변글인 경우 끝 --%>
				      </c:if>
			         <%-- 첨부파일이 없는 경우 끝  --%>
			         
			         
			         <%-- 첨부파일이 있는 경우 시작  --%>
			         <c:if test="${empty boardvo.fileName}">
				          <%-- 원글인 경우 시작  --%>
			         	  <c:if test="${boardvo.depthno == 0}">
				         	<c:if test="${boardvo.commentCount > 0}">
				         		<span class="subject" onclick="goView('${boardvo.seq}')">${boardvo.subject}<span style="vertical-align:super;">[<span style="color:red; font-size: 9pt; font-weight:bold; font-style:italic; ">${boardvo.commentCount}</span>]</span></span>
				         	</c:if>
				         	<c:if test="${boardvo.commentCount == 0}">
				         		<span class="subject" onclick="goView('${boardvo.seq}')">${boardvo.subject}</span>
				         	</c:if>
					     </c:if>
				         <%-- 원글인 경우 끝  --%>
				         
				         <%-- 답변글인 경우 시작  --%>
			         	 <c:if test="${boardvo.depthno > 0}">
				         	<c:if test="${boardvo.commentCount > 0}">
				         		<span class="subject" onclick="goView('${boardvo.seq}')"><span style="color:red; font-style:italic; padding-left:${boardvo.depthno * 20}px;">└Re&nbsp;</span>${boardvo.subject}<span style="vertical-align:super;">[<span style="color:red; font-size: 9pt; font-weight:bold; font-style:italic; ">${boardvo.commentCount}</span>]</span></span>
				         	</c:if>
				         	<c:if test="${boardvo.commentCount == 0}">
				         	<span class="subject" onclick="goView('${boardvo.seq}')"><span style="color:red; font-style:italic; padding-left:${boardvo.depthno * 20}px;">└Re&nbsp;</span>${boardvo.subject}</span>
				         	</c:if>
				         </c:if>	
				         <%-- 답변글인 경우 끝 --%>
			         <%-- 첨부파일이 있는 경우 끝  --%>
			         </c:if>
	
		         	</td>
		         	<%-- 댓글쓰기 및 답변형  파일첨부가 있는 게시판 끝 --%>
		         	
		
		         	<td align="center">${boardvo.name}</td>
		         	<td align="center">${boardvo.regDate}</td>
		         	<td align="center">${boardvo.readCount}</td>	 
	         	</tr>     
	         </c:forEach>
	      </c:if>
      </tbody>
   </table>

    <%-- === #122. 페이지바 보여주기 === --%>  
    <div align="center">
       ${requestScope.pageBar}
    </div>
 
 
    <%-- === #101. 글검색 폼 추가하기 : 글제목, 글쓴이로 검색을 하도록 한다. === --%>
    <%-- === #101. 글검색 폼 추가하기 : 글제목, 글쓴이로 검색을 하도록 한다. === --%>
    <form name="searchFrm" style="margin-top: 20px;">
      <select name="searchType" id="searchType" style="height: 26px;">
         <option value="subject">글제목</option>
         <option value="name">글쓴이</option>
      </select>
      <input type="text" name="searchWord" id="searchWord" size="40" autocomplete="off" /> 
      <input type="text" style="display: none;"/> <%-- form 태그내에 input 태그가 오로지 1개 뿐일경우에는 엔터를 했을 경우 검색이 되어지므로 이것을 방지하고자 만든것이다. --%> 
      <button type="button" class="btn btn-secondary btn-sm" onclick="goSearch()">검색</button>
   </form>
   
   <%-- === #106. 검색어 입력시 자동글 완성하기 1 === --%>
   <div id="displayList" style="border:solid 1px gray; border-top:0px; height:100px; margin-left:75px; margin-top:-1px; overflow:auto;">
   
   
   
   </div>
</div>
</div>
</body>
</html>