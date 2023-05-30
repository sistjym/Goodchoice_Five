<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
    String ctxPath = request.getContextPath();

%>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>

<style type="text/css">

	div#container {
		width: 60%;
		margin: 0 auto;
	}
	
	button.btn_kakao {
		margin-bottom: 10px; border-radius: 4px; border: none; width: 100%; height: 65px; 
	}
	* {
		font-family: 'Pretendard', 'Apple SD Gothic Neo', '맑은 고딕', '맑은고딕', 'Malgun Gothic', sans-serif;
	}
	
	a.btn_nologin {
		 height: 56px; color:#000000DE;
	}
	
	a.btn_nologin:hover {
		 text-decoration: none; color:#000000DE;
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

	
	
</script>

</head>
<body>
<div id="container">
	<div class="text-center" style="margin: 0 auto; width:40%;">
		<div class="text-center">
			<a href="<%= ctxPath%>/main/home.gc" ><img src="<%= ctxPath%>/resources/images/여기어때로고.png" style="height: 35px; width:112px; margin:80px 0 50px 0;"/></a>
		</div>
		<div style="line-height: 56px; ">
			<button class="col-md-12 btn_kakao" style="background-color: #FCE51E; font-size:16px;" ><span style="color:#3B1D14;"><i class="fa-solid fa-comment-dots"></i>&nbsp;카카오톡으로 로그인</span></button>
		</div>
		<p><span style= "height:56px; width:60px; font-size:16pt; line-height:56px; color:#00000061">또는</span></p>
		<hr style="margin-bottom:20px">
		
		<div style="margin-bottom:20px">
			<input type="radio" value="" style="margin-right: 5px;"/><span style="margin-right: 25px;">회원 로그인</span>
			<input type="radio" value="" style="margin-right: 5px;"/><span>업주 로그인</span>
		</div>
		
		<div style="border: solid 1px #ebebe0;margin-bottom:10px;">
			<i class="fa-solid fa-envelope col-sm-2" style="font-size:16pt; color:#00000061;"></i><input type="text" style="height: 50px; font-size:16pt; border:none;" class="col-sm-10" id="Email"  placeholder="이메일 주소" >
		</div>
		<div><span id="error_email" style="color:red;"></span></div>
		<div style="border: solid 1px #ebebe0;margin-bottom:20px;">
			<i class="fa-solid fa-lock col-sm-2" style="font-size:16pt; color:#00000061;"></i><input type="password" style="height:50px; font-size:16pt; border:none;"class="col-sm-10" id="passwd" placeholder="비밀번호">
		</div>
		<div><span id="error_password" style="color:red;"></span></div>
		<button style="border-radius: 6px; width:100%;text-align: center; border: none; color:#fff; background-color:#c80449;height:56px;margin-bottom:30px;">로그인</button>
		<div style="display: inline-block;float: left;width: 50%;"><a href="<%= ctxPath%>/memberEditEmailcheck.gc" class="btn_nologin"><span style="font-size:16px">비밀번호 재설정</span></a></div>
		<div style="display: inline-block;float: left;width: 50%;"><a href="<%= ctxPath%>/memberRegister.gc" class="btn_nologin"><span style="font-size:16px">회원가입</span></a></div>
	</div>memberEditEmailcheck.gc
</div>	
</body>
</html>