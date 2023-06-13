<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
   String ctxPath = request.getContextPath();
%>
  
<script type="text/javascript">

	
	$(document).ready(function(){
		// ======== 권한  유지시키기 시작 ======== //
	      const permission = "${requestScope.permission}";
	      if(permission != "") {
	    	  $("select#permission").val(permission);
	      }
	   // ======== 권한 유지시키기 끝 ======== //
	      
	   // ======== 권한 업데이트 시작 ========//
	      $("button.btn_permission").click(function(){
	    	  let permission = $(this).val();
	    	  let currentRow = $(this).closest('tr');
	    	  let acom_no = currentRow.find('td:eq(6) input').val();

	    	  console.log(acom_no);
	    	   $.ajax({
				  url:"<%= ctxPath%>/updatePermissionAcomm.gc",
				  data:{"permission" : permission,
					    "acom_no" : acom_no},
				  dataType:"json",
				  success:function(json){
					
					  if(json == 1) {
	                         alert("숙소 등록/해제에 성공했습니다!");
	                         document.location.reload();
	                         
	                   }
	                      else {
	                         alert("숙소 등록에  실패했습니다.ㅜㅜ");
	                      }
					
				  },
				  error: function(request, status, error){
	                  alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
	              } 
				  
			   }); 

	      });// end of allow permission
	      // 승인 여부에 따른 sorting 
   	     $("button#btnSearch").click(function(){
	    	  const frm = document.searchFrm;
		       frm.method = "get";
		       frm.action = "acomm_approve.gc";
		       frm.submit();
	    	  
	    	  
	      }); // end of $("button#btnSearch").click(function()

	  });
    
</script>   

<div>
<div>
<h2 class="board_subject"> 모든 숙소(관리자 전용) </h2>
<div class="sorting_wrapper">
	<form name="searchFrm">
       	<span style="display: inline-block; font-weight: bold;">분류: &nbsp;</span> 
       <input type="hidden" name="str_categoryName" />
       
       <select name="permission" id="permission" style="height: 30px; width: 120px; margin: 10px 30px 0 0;">
          <option value="">모두보기</option>
          <option value="1">승인 완료</option>
          <option value="0">승인 대기 </option>
       </select>
     
       <div class="btn_box">
	       <button type="button" class="btn btn-secondary btn-sm" id="btnSearch">검색하기</button>
       </div>
   </form>
</div>
  <br>
<table class="table table-hover">
  <thead>
    <tr>
      <th scope="col">카테고리</th>
      <th scope="col">분류</th>
      <th scope="col">숙소이름</th>
      <th scope="col">호스트이름</th>
      <th scope="col">승인 여부</th>
      <th scope="col"></th>
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
				 <c:if test="${map.IS_ACOM_PERMISSION eq '승인 대기'}">
				 	<td><button type="button" class="btn btn-outline-primary btn-sm btn_permission" value="0">승인</button></td>		 
				 </c:if>
				 <c:if test="${map.IS_ACOM_PERMISSION eq '승인 완료'}">
				 	<td><button type="button" class="btn btn-outline-danger btn-sm btn_permission" value="1">해제</button></td>		 
				 </c:if>
				 <td><input type="hidden" name="host_no" value="${map.ACOM_NO}"/></td>		 	  	
		 	  </tr>
	 	  </c:forEach>
	</c:if>      
  </tbody>
</table>
  
   </div>
</div>
</body>
</html>