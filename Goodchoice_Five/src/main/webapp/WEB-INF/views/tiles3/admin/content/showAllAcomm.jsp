<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
   String ctxPath = request.getContextPath();
%>
  
<script type="text/javascript">

	
	$(document).ready(function(){
	    
	    // 검색하기 버튼 클릭시
	    $("button#btnSearch").click(function(){
	      
	       const arr_categoryName = new Array();
	       
	       $("input:checkbox[name='category_name']").each(function(index, item){
	         const bool = $(item).prop("checked"); // 체크박스의 체크유무 검사 
	         
	         if(bool == true) {
	            // 체크박스에 체크가 되었으면
	            arr_categoryName.push($(item).val());
	         }
	       });
	       
	       const str_categoryName = arr_categoryName.join();
	       
	       console.log("~~~ 확인용 str_categoryName => " + str_categoryName);
	       
	       const frm = document.searchFrm;
	       frm.category_name.value = str_categoryName;
	       
	       frm.method = "get";
	       frm.action = "showAllAcomm.gc";
	       frm.submit();
	       
	    });
      
      
      // ======== 체크박스 유지시키기 시작 ======== //
      const str_categoryName = "${requestScope.str_categoryName}";
     // console.log(str_DeptId);
      
      if(str_categoryName != "") {
    	  const arr_categoryName = str_categoryName.split(",");
    	 
    	  
    	  $("input:checkbox[name='category_name']").each(function(index, item) {
			for(let i=0; i<arr_categoryName.length; i++) {
				if($(item).val() == arr_categoryName[i]) {
					$(item).prop("checked", true);
					break;
				}	
			}
		  }); 
      }
      // ======== 체크박스 유지시키기 끝 ======== //
      
      
      // ======== 성별 유지시키기 시작 ======== //
      const permission = "${requestScope.permission}";
      if(permission != "") {
    	  $("select#permission").val(permission);
      }
      // ======== 성별 유지시키기 끝 ======== //
      
         // ====== Excel 파일로 다운받기 시작 ====== //
      $("button#btnExcel").click(function() {
		
   	       const arr_categoryName = new Array();
   	       
   	       $("input:checkbox[name='category_name']").each(function(index, item){
   	         const bool = $(item).prop("checked"); // 체크박스의 체크유무 검사 
   	         
   	         if(bool == true) {
   	            // 체크박스에 체크가 되었으면
   	            arr_categoryName.push($(item).val());
   	         }
   	       });
   	       
   	       const str_categoryName = arr_categoryName.join();
   	       
   	      // console.log("~~~ 확인용 str_DeptId => " + str_DeptId);
   	       
   	       const frm = document.searchFrm;
   	       frm.str_categoryName.value = str_categoryName;
   	       
   	       frm.method = "post";
   	       frm.action = "<%= request.getContextPath()%>/excel/downloadExcelFile.gc";
   	       frm.submit();
    	  
	  });
      // ====== Excel 파일로 다운받기 끝 ====== //
      
      
  
   });// end of $(document).ready(function(){})-----------------------

</script>   

<div>
<div>
<h2 class="board_subject"> 모든 숙소(관리자 전용) </h2>
<div class="sorting_wrapper">
	<form name="searchFrm">
       	<span style="display: inline-block; font-weight: bold;">분류: &nbsp;</span> 
       	<c:forEach var="category_name" items="${requestScope.categoryList}" varStatus="status">
       		<label for="${status.index}">		   
	  			${category_name}
	       	</label>	
       		<input type="checkbox" name="category_name" id="${status.index}" value="${category_name}"/>&nbsp;&nbsp;
       	</c:forEach>
<%--        	
       	<c:forEach var="spec_name" items="${requestScope.specList}" varStatus="status">
       		<label for="${status.index}">		   
	  			${spec_name}
	       	</label>	
       		<input type="checkbox" name="spec_name" id="${status.index}" value="${spec_name}"/>&nbsp;&nbsp;
       	</c:forEach> --%>
	       	

       <input type="hidden" name="categoryName" />
       
       <select name="permission" id="permission" style="height: 30px; width: 120px; margin: 10px 30px 0 0;">
          <option value="">모두보기</option>
          <option value="1">승인 완료</option>
          <option value="0">승인 대기 </option>
       </select>
       <div class="btn_box">
	       <button type="button" class="btn btn-secondary btn-sm" id="btnSearch">검색하기</button>
	       &nbsp;&nbsp;
	       <button type="button" class="btn btn-success btn-sm" id="btnExcel">Excel파일로저장</button>
       </div>
   </form>
</div>
  
   
   <br/>



<table class="table table-hover">
  <thead>
    <tr>
      <th scope="col">카테고리</th>
      <th scope="col">분류</th>
      <th scope="col">숙소이름</th>
      <th scope="col">호스트이름</th>
      <th scope="col">승인 여부</th>
    </tr>
  </thead>
  <tbody>
     <c:if test="${not empty requestScope.acommList}">
	 	  <c:forEach var="map" items="${requestScope.acommList}">
		 	  <tr>	
		 	     <td>${map.CATEGORY_NAME}</td> 	  	
				 <td>${map.SPEC_NAME}</td>		 	  	
				 <td>${map.ACOM_NAME}</td>		 	  	
				 <td>${map.HOST_NAME}</td>		 	  	
				 <td>${map.IS_ACOM_PERMISSION}</td>		 	  	
		 	  </tr>
	 	  </c:forEach>
	</c:if>      
  </tbody>
</table>
   
   </div>
</div>
</body>
</html>