<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
   String ctxPath = request.getContextPath();
%>
  
<script type="text/javascript">

	
	$(document).ready(function(){

	      // ======== 권한 유지시키기 시작 ======== //
	      const permission = "${requestScope.permission}";
	      if(permission != "") {
	    	  $("select#permission").val(permission);
	      }
	      // ======== 권한 유지시키기 끝 ======== //
	      
	      // ======== 권한 업데이트 시작 ========//
	      $("button.btn_permission").click(function(){
	    	  let permission = $(this).val();
	    	  let currentRow = $(this).closest('tr');
	    	  let host_no = currentRow.find('td:eq(5) input').val();

	    	  //console.log(typeof(host_no));
	    	   $.ajax({
				  url:"<%= ctxPath%>/updatePermission.gc",
				  data:{"permission" : permission,
					    "host_no" : host_no},
				  dataType:"json",
				  success:function(json){
					
					  if(json == 1) {
	                         alert("호스트의 권한 변경에 성공했습니다!");
	                         document.location.reload();
	                         
	                   }
	                      else {
	                         alert("호스트의 권한 변경에  실패했습니다.ㅜㅜ");
	                      }
					
				  },
				  error: function(request, status, error){
	                  alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
	              } 
				  
			   }); 
	    	
	    
	      });// end of allow permission
	      
	      // ======== 권한 업데이트   끝========//
	      $("button#btnSearch").click(function(){
	    	  const frm = document.searchFrm;
	    	  
		       frm.method = "get";
		       frm.action = "showAllHost.gc";
		       frm.submit();
	    	  
	    	  
	      }); // end of $("button#btnSearch").click(function()
	      
	      
	      // ====== Excel 파일로 다운받기 시작 ====== //
	      $("button#btnExcel").click(function() {
		
	   	       const frm = document.searchFrm;
	   	       
	   	       frm.method = "post";
	   	       frm.action = "<%= request.getContextPath()%>/excel/downloadExcelFile.gc";
	   	       frm.submit();
	    	  
		  });
	      // ====== Excel 파일로 다운받기 끝 ====== //
	    

   });// end of $(document).ready(function(){})-----------------------
   
   // function declaration
   
   

</script>   

<div>
<div>
<h2 class="board_subject"> 모든 호스트 보기 & 권한 승인 </h2>
<div class="sorting_wrapper">
	<form name="searchFrm"> 
	<span>승인 여부 :</span>
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
      <th scope="col" style="text-align:center;">호스트 이름</th>
      <th scope="col" style="text-align:center;">가입일자</th>
      <th scope="col" style="text-align:center;">사업자 등록 번호</th>
      <th scope="col" style="text-align:center;">권한</th>
      <th scope="col"></th>
       <th scope="col"></th>
    </tr>
  </thead>
  <tbody>
     <c:if test="${not empty requestScope.hostList}">
	 	  <c:forEach var="map" items="${requestScope.hostList}">
		 	  <tr id="test" style="text-align:center;">	
		 	     <td>${map.host_name}</td> 	  	
				 <td>${map.HOST_REG_DATE}</td>
				 <td>${map.cp_reg_no}</td>				 	  		 	  	
				 <td>${map.IS_HOST_PERMISSION}</td>	
				 <c:if test="${map.IS_HOST_PERMISSION eq '승인 대기'}">
				 	<td><button type="button" class="btn btn-outline-primary btn-sm btn_permission" value="0">승인</button></td>		 
				 </c:if>
				 <c:if test="${map.IS_HOST_PERMISSION eq '승인 완료'}">
				 	<td><button type="button" class="btn btn-outline-danger btn-sm btn_permission" value="1">해제</button></td>		 
				 </c:if>
				  <td><input type="hidden" name="host_no" value="${map.host_no}"/></td>		 	  	
		 	  </tr>
	 	  </c:forEach>
	</c:if>      
  </tbody>
</table>
   
   </div>
</div>
</body>
</html>