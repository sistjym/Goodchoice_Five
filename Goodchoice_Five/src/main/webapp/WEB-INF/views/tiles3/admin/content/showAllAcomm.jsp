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
	      
		       const arrCategoryName = new Array();
		       
		       $("input:checkbox[name='category_name']").each(function(index, item){
		         const bool = $(item).prop("checked"); // 체크박스의 체크유무 검사 
		         
		         if(bool == true) {
		            // 체크박스에 체크가 되었으면
		            arrCategoryName.push($(item).val());
		         }
		         
		         const arrdistrictName = new Array();
			       
			       $("input:checkbox[name='district_name']").each(function(index, item){
			         const bool = $(item).prop("checked"); // 체크박스의 체크유무 검사 
			         
			         if(bool == true) {
			            // 체크박스에 체크가 되었으면
			            arrdistrictName.push($(item).val());
			         }
		       });
		       
		       const str_categoryName = arrCategoryName.join();
		       const str_districtName = arrdistrictName.join();
		       
		       console.log("~~~ 확인용 str_categoryName => " + str_categoryName.value);
		       
		       const frm = document.searchFrm;
		       
		       frm.str_categoryName.value = str_categoryName;
		       frm.str_districtName.value = str_districtName;
		       frm.method = "get";
		       frm.action = "showAllAcomm.gc";
		       frm.submit();
	       
	       });
	    });
      
      
      // ======== 체크박스 유지시키기 시작 ======== //
      const str_categoryName = "${requestScope.str_categoryName}";
      const str_districtName = "${requestScope.str_districtName}";
   
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
      
      if(str_districtName != "") {
    	  const arr_districtName = str_districtName.split(",");
    	 
    	  $("input:checkbox[name='district_name']").each(function(index, item) {
			for(let i=0; i<arr_districtName.length; i++) {
				if($(item).val() == arr_districtName[i]) {
					$(item).prop("checked", true);
					break;
				}	
			}
		  }); 
      }
      // ======== 체크박스 유지시키기 끝 ======== //
      
     // ====== Excel 파일로 다운받기 시작 ====== //
      $("button#btnExcel").click(function() {
		
   	       const arr_categoryName = new Array();
   	       const arr_districtName = new Array();
   	       
   	       $("input:checkbox[name='category_name']").each(function(index, item){
   	         const bool = $(item).prop("checked"); // 체크박스의 체크유무 검사 
   	         
   	         if(bool == true) {
   	            // 체크박스에 체크가 되었으면
   	            arr_categoryName.push($(item).val());
   	         }
   	       });
   	       
   	    $("input:checkbox[name='district_name']").each(function(index, item){
  	         const bool = $(item).prop("checked"); // 체크박스의 체크유무 검사 
  	         
  	         if(bool == true) {
  	            // 체크박스에 체크가 되었으면
  	            arr_districtName.push($(item).val());
  	         }
  	       });
   	       
   	       const str_categoryName = arr_categoryName.join();
   	       const str_districtName = arr_districtName.join();
   	       
   	       
   	       const frm = document.searchFrm;
   	       frm.str_categoryName.value = str_categoryName;
   	       frm.str_districtName.value = str_districtName;
   	       
   	       frm.method = "post";
   	       frm.action = "<%= request.getContextPath()%>/excel/downloadExcelFile_acomm.gc";
   	       frm.submit();
    	  
	  });
      // ====== Excel 파일로 다운받기 끝 ====== //
      
      
  
   });// end of $(document).ready(function(){})-----------------------

</script>   

<div>
<div>
<h2 class="board_subject"> 등록된 모든 숙소(관리자 전용) </h2>
<div class="sorting_wrapper">
	<form name="searchFrm">
	  <fieldset>
        <legend> 분류 </legend>
			<span class="sorting">카테고리별 :</span>
	       	<c:forEach var="category_name" items="${requestScope.categoryList}" varStatus="status">	
	       		<input class="category" type="checkbox" name="category_name" id="${status.index}" value="${category_name}"/>
	       		<label for="${status.index}">		   
		  			${category_name}
		       	</label>
	       	</c:forEach>
	       	
	       	<input type="hidden" name="str_categoryName" />
		    <span class="sorting">지역 별 :</span>
	       	<c:forEach var="district_name" items="${requestScope.districtList}" varStatus="status">
	       			
	       		<input class="category" type="checkbox" name="district_name" id="${status.index}" value="${district_name}"/>
	       		<label for="${status.index}">		   
		  			${district_name}
		       	</label>
	       	</c:forEach>
	       	 <input type="hidden" name="str_districtName" />
        </fieldset>
	       	
       <div class="acom_btn_box">
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
      <th scope="col">지역</th>
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
				 <td>${map.district_name}</td>		 	  	
		 	  </tr>
	 	  </c:forEach>
	</c:if>      
  </tbody>
</table>
   
   </div>
</div>
</body>
</html>