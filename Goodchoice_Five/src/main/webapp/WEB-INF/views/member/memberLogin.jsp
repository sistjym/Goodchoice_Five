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
  
  <!-- kakao 로그인 -->
  <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script type="text/javascript">

window.Kakao.init("aa9e3a8df8aa72d93190dd5dc4ebafb1");

function gokakaoLogin() {
	window.Kakao.Auth.loginForm({
		scope:'profile_nickname, account_email',
		success: function(authObj) {
			console.log(authObj);
			window.Kakao.API.request({
				url:'/v2/user/me',
				success: res => {
					// console.log(res);
					const kakao_account = res.kakao_account;
					const id = res.id;	// 데이터베이스 primary key
					const name = res.properties.nickname;
					const email = kakao_account.email; // 카카오에서 얻은 이메일 정보
					
					// 폼생성
					const form = $('<form></form>').attr({
					    method: 'POST',
					    action: '<%= ctxPath%>/kakao/kakaocontroller.gc'
					});
					
					$('<input>').attr({
                        type: 'hidden',
                        name: 'id',
                        value: id
                    }).appendTo(form);

                    $('<input>').attr({
                        type: 'hidden',
                        name: 'name',
                        value: name
                    }).appendTo(form);

                    $('<input>').attr({
                        type: 'hidden',
                        name: 'email',
                        value: email
                    }).appendTo(form);

                    // 폼 제출
                    $('body').append(form);
                    form.submit();
                }
			});
		}
	});
}


	$(document).ready(function(){		
		
		$("button#btnLOGIN").click(function(){
			func_Login();
		});
		
		$("input#passwd").keydown(function(e){
			if(e.keyCode == 13) { // 엔터를 했을 경우
				func_Login();	
			}
		});
	    
	}); //end of $(document).ready(function(){ ---------------------------
	
	////////////////////////////////////////////////////////////////////////////////
	
 	function func_Login() {
 		
 			 const loginType = $('input[name="loginType"]:checked').val();
 			 
 			 
 			 if(loginType == 'owner') {
 				 
 				 const Email = $("input#Email").val();
 				 const passwd = $("input#passwd").val(); 
 				 
 				if(Email.trim()=="") {
 			        alert("이메일을 입력하세요!!");
 			       $("input#Email").val(""); 
 			       $("input#Email").focus();
 			       return; // 종료 
 			     }
 			   
 			     if(passwd.trim()=="") {
 			       alert("비밀번호를 입력하세요!!");
 			       $("input#passwd").val(""); 
 			       $("input#passwd").focus();
 			       return; // 종료 
 			     }
 			     
 			    const frm = document.loginFrm;
 				frm.action = "<%= ctxPath%>/loginHost.gc";
 				frm.method = "post";
 				frm.submit();
 			 }
 			 
 			 else {
 				 
 				 const Email = $("input#Email").val();
				 const passwd = $("input#passwd").val(); 
				 
				if(Email.trim()=="") {
			        alert("이메일을 입력하세요!!");
			       $("input#Email").val(""); 
			       $("input#Email").focus();
			       return; // 종료 
			     }
			   
			     if(passwd.trim()=="") {
			       alert("비밀번호를 입력하세요!!");
			       $("input#passwd").val(""); 
			       $("input#passwd").focus();
			       return; // 종료 
			     }
			     
			    const frm = document.loginFrm;
				frm.action = "<%= ctxPath%>/loginMember.gc";
				frm.method = "post";
				frm.submit();
 			 }
 			 
 			 
 	
 	}
	
	
	
	
</script>

</head>
<body>
<div id="container">
	<div class="text-center" style="margin: 0 auto; width:40%;">
		<div class="text-center">
			<a href="<%= ctxPath%>/main/home.gc" ><img src="<%= ctxPath%>/resources/images/여기어때로고.png" style="height: 35px; width:112px; margin:80px 0 50px 0;"/></a>
		</div>
		<div style="line-height: 56px; ">
			<button class="col-md-12 btn_kakao" style="background-color: #FCE51E; font-size:16px;" onclick="gokakaoLogin()"><span style="color:#3B1D14;"><i class="fa-solid fa-comment-dots"></i>&nbsp;카카오톡으로 로그인</span></button>
		</div>
		<p><span style= "height:56px; width:60px; font-size:16pt; line-height:56px; color:#00000061">또는</span></p>
		<hr style="margin-bottom:20px">
	  <form name="loginFrm">	
		<div style="margin-bottom:20px">
			<input type="radio" name="loginType" value="memebr" checked style="margin-right: 5px;"/><span style="margin-right: 25px;">회원 로그인</span>
			<input type="radio" name="loginType" value="owner" style="margin-right: 5px;"/><span>업주 로그인</span>
		</div>
		
		<div style="border: solid 1px #ebebe0;margin-bottom:10px;">
			<i class="fa-solid fa-envelope col-sm-2" style="font-size:16pt; color:#00000061;"></i><input type="text" style="height: 50px; font-size:16pt; border:none;" class="col-sm-10" id="Email" name="Email" placeholder="이메일 주소" >
		</div>
		<div><span id="error_email" style="color:red;"></span></div>
		<div style="border: solid 1px #ebebe0;margin-bottom:20px;">
			<i class="fa-solid fa-lock col-sm-2" style="font-size:16pt; color:#00000061;"></i><input type="password" style="height:50px; font-size:16pt; border:none;"class="col-sm-10" id="passwd" name="passwd" placeholder="비밀번호">
		</div>
		<div><span id="error_password" style="color:red;"></span></div>
		<button type="button" id="btnLOGIN" style="border-radius: 6px; width:100%;text-align: center; border: none; color:#fff; background-color:#c80449;height:56px;margin-bottom:30px;">로그인</button>
		<div style="display: inline-block;float: left;width: 50%;"><a href="<%= ctxPath%>/passwdEditforCheck.gc" class="btn_nologin"><span style="font-size:16px">비밀번호 재설정</span></a></div>
		<div style="display: inline-block;float: left;width: 50%;"><a href="<%= ctxPath%>/memberRegister.gc" class="btn_nologin"><span style="font-size:16px">회원가입</span></a></div>
	  </form>
	</div>
</div>	
</body>
</html>