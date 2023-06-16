<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String ctxPath = request.getContextPath();
%>      
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 이메일 인증</title>

<style type="text/css">

	div#container {
		width: 60%;
		margin: 0 auto;
	}
	*{
	font-family: 'Pretendard', 'Apple SD Gothic Neo', '맑은 고딕', '맑은고딕', 'Malgun Gothic', sans-serif;
	}
	#container > div > form > button {
		 border: none;
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
		Buttonabled();
		$("div.loader").hide(); // CSS 로딩화면 감추기
	});
	
	function EmailCheck(Email) {
		  const regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		  const bool = regExp.test(Email);

		  if (!bool) {
		    $('span#error_email').text("이메일이 적합한 형식이 아닙니다.");
		    return false;
		  } else {
		    $('span#error_email').text("");
		    return true;
		  }
		}

		function Buttonabled() {
		  $("#findmail").prop("disabled", true).css("background-color", "#FAFAFA");

		  $("input#Email").on("input", function() {
		    const Email = $(this).val().trim();
		    if (EmailCheck(Email)) {
		    	$("#findmail").prop("disabled", false).css({"background-color": "#f2114c", "color": "#fff"});
		    } else {
		      $("#findmail").prop("disabled", true).css("background-color", "#FAFAFA");
		    }
		  });
		}
	
	function goMail() {
		
		
		
		const Email = $("input#Email").val();
		
		const frm = document.myfrm;
		frm.action ="<%= ctxPath%>/mailSend.gc";
		frm.method ="post";
		frm.submit();
	}

</script>

</head>
<body>

<div id="container">
	<div style="margin: 0 auto; width:40%;">
	
		
		<h3 style="margin-top: 120px; font-weight: bold; text-align: center;">비밀번호 재설정</h3>
		<h6 style="margin-top: 30px; text-align: center;color:#0000008F" >회원가입 시 등록한 이메일 주소를 입력해 주세요.</h6>
		<form name="myfrm" style="margin-top: 30px;">
			  <div style="border: solid 1px #ebebe0;margin-bottom:10px;">
				 <i class="fa-solid fa-envelope col-sm-2" style="font-size:16pt; color:#00000061;"></i><input type="text" style="height: 50px; font-size:16pt; border:none;" class="col-sm-10" id="Email"name="Email"  placeholder="이메일 주소" >
			  </div>
			  <div><span id="error_email" style="color:red;"></span></div>
			  <button type="button" id="findmail"style="height: 56px;  width:100%; font-size:16px;" class="text-center" onclick="goMail()">확인</button>
		</form>  
	</div>
</div>

</body>
</html>