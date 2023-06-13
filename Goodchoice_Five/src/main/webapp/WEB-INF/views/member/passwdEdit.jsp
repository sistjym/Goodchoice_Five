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
		
		Buttonabled();
		
		$("input#email").val('${requestScope.email}') ;
		
		// PWD 유효성 검사 및 비밀번호 일치 검사
		$('input#passwd').on('input',pwdCheck);
		$('input#passwd_check').on('input',pwdSame);
		
	});
	
	function pwdCheck(e){
  		const regExp= /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[!@#$%^&*])[a-zA-Z\d!@#$%^&*]{6,16}$/;
  		// console.log($('input#inputPwd1').val().length);
  		// console.log($(e.target).val().length);
  		const target_val = $(e.target).val();
  		const bool = regExp.test(target_val);
  		
  		if ( target_val.length < 6 || target_val.length > 16  ){
  			// $(e.target).parent().find("span#error_pwd").text("6 ~ 16자 영문,숫자,특수문자 1개 이상씩 혼용 필수");
  			$('span#error_pwd').text("6 ~ 16자 사이이어야 합니다.");
  		}
  		else if ( !bool ){ // 정규표현식 조건에 맞지 않는 경우
  			$('span#error_pwd').text("6 ~ 16자 영문,숫자,특수문자 1개 이상씩 혼용 필수");
  		}
  		else{
  			$('span#error_pwd').text("");
  		}
  	
  	} // END OF FUNCTION PWDCHECK()
  	function pwdSame(e){
  		const pwd1 = $('input#passwd').val(); // 비밀번호
  		const pwd2 = $(this).val(); // 비밀번호 확인 
  		
  		if ( pwd1 == pwd2 ){
  			$('span#error_pwd_check').text("");
  		}
  		else{
  			$('span#error_pwd_check').text("비밀번호가 일치하지 않습니다.");
  		}
  		
  		
  	}// END OF FUNCTION PWDSAME()
  	
  	
  	function Buttonabled() {
		  $("#pwUpdate").prop("disabled", true).css("background-color", "#FAFAFA");

		  $("input#passwd_check").on("input", function() {
			const passwd = $('input#passwd').val().trim(); // 비밀번호 
		    const passwd_check = $(this).val().trim();
		    if (passwd == passwd_check) {
		    	$("#pwUpdate").prop("disabled", false).css({"background-color": "#f2114c", "color": "#fff"});
		    } else {
		      $("#pwUpdate").prop("disabled", true).css("background-color", "#FAFAFA");
		    }
		  });
		}
  	
	
	function gopwUpdate() {
		
		// 비밀번호 
		if( $('input#passwd').val() == "" || $('input#passwd_check').val() == ""){
			alert('비밀번호와 비밀번호 확인은 필수 입력사항입니다.');
			$('input#passwd').focus();
			return ;
		}
		
		if ( $('span#error_pwd').text() != "" || $('span#error_pwd_check').text() != ""  ){
			alert('비밀번호와 비밀번호확인은 조건에 따라 입력하셔야 합니다.');
			return ;
		}
  			
  		
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
			<input  type="hidden" name="email" id="email" />
			  <div><span id="error_pwd" style="color:red;"></span></div>
		    <br>
		    <div style="border: solid 1px #ebebe0;margin-bottom:20px;">
			<i class="fa-solid fa-lock col-sm-2" style="font-size:16pt; color:#00000061;"></i><input type="password" style="height:50px; font-size:16pt; border:none;"class="col-sm-10" id="passwd_check" name="passwd_check" placeholder="새 비밀번호 확인">
			</div>
			  <div><span id="error_pwd_check" style="color:red;"></span></div>
			  <button type="button" id="pwUpdate"style="height: 56px;  width:100%; font-size:16px;border: none; color:#1010104D;" class="text-center" onclick="gopwUpdate()">비밀번호 변경</button>
  		</form>
  </div>

</body>
</html>

