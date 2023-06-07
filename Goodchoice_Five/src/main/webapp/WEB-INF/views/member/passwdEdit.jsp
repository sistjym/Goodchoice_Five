<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String ctxPath = request.getContextPath();
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<title>비밀번호 재설정</title>

<style type="text/css">

	*{
	font-family: 'Pretendard', 'Apple SD Gothic Neo', '맑은 고딕', '맑은고딕', 'Malgun Gothic', sans-serif;
	}

</style>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
  <link rel="stylesheet" type="text/css" href="<%= ctxPath%>/resources/bootstrap-4.6.0-dist/css/bootstrap.min.css" > 

  <!-- Font Awesome 5 Icons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
  <script src="https://kit.fontawesome.com/b7b1b05ad5.js" crossorigin="anonymous"></script>
    
<!-- Optional JavaScript -->
  <script type="text/javascript" src="<%= ctxPath%>/resources/js/jquery-3.6.4.min.js"></script>
  <script type="text/javascript" src="<%= ctxPath%>/resources/bootstrap-4.6.0-dist/js/bootstrap.bundle.min.js" ></script> 
  <script type="text/javascript" src="<%= ctxPath%>/resources/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script> 

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script type="text/javascript">

	$(document).ready(function(){
		
	});

	function gopwUpdate() {
		const email = $("input#email").val();
		console.log("email : " +email);
		
		const frm = document.myfrm;
		frm.action ="<%= ctxPath%>/pwUpdate.gc";
		frm.method ="post";
		frm.submit();
	}
	
</script>
</head>
<body>



 <div class="form-group text-center" style="width: 60%; margin: 0 auto;">
 		<form name="myfrm" style="width:40%;margin: 0 auto;">
 		  <h3 style="margin-top : 150px; font-weight: bold;">새비밀번호 설정</h3>
 		  <p>인증이 완료되었습니다.</p>
 		  <p>새로운 비밀번호를 입력해주세요.</p>
		    <div style="border: solid 1px #ebebe0;margin-bottom:20px;">
			<i class="fa-solid fa-lock col-sm-2" style="font-size:16pt; color:#00000061;"></i><input type="password" style="height:50px; font-size:16pt; border:none;"class="col-sm-10" id="passwd" name="passwd" placeholder="새 비밀번호(최소 8자 이상)">
			</div>
			  <div><span id="error_pwd" style="color:red;"></span></div>
		    <br>
		    <input type="hidden" id="email" name="email" value="${requestScope.Email}" />
		    <div style="border: solid 1px #ebebe0;margin-bottom:20px;">
			<i class="fa-solid fa-lock col-sm-2" style="font-size:16pt; color:#00000061;"></i><input type="password" style="height:50px; font-size:16pt; border:none;"class="col-sm-10" id="passwd_check" name="passwd_check" placeholder="새 비밀번호 확인">
			</div>
			  <div><span id="error_pwd_check" style="color:red;"></span></div>
			  <button type="button" id="pwUpdate"style="height: 56px;  width:100%; font-size:16px;border: none; color:#1010104D;" class="text-center" onclick="gopwUpdate()">비밀번호 변경</button>
  		</form>
  </div>

</body>
</html>

