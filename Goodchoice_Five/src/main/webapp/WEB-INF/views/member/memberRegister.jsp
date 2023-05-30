<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
    String ctxPath = request.getContextPath();
    //    /MyMVC
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>


<style type="text/css">
	
	div#container {
		width: 60%;
		margin: 0 auto;
		
	}
	form[name='myfrm'] {
		width:40%;
		margin: 0 auto;
	}
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

	let email_flag = false ; // 중복확인을 통과하면 true
	let pwd_flag = false ;
	
	
	$(document).ready(function(){		
		
		$("div#host_register").hide();
		setEventHandling();
	      
	});
	
	function setEventHandling() {
		// 이메일 유효성 검사 및 중복 검사
		$('input#inputEmail1').on('input',EmailCheck);
		$('select.email_sel').on('change',EmailCheck);
		
		$('button.emailcheck').click(emailDuplicateCheck);
	}
	
	
	
	function EmailCheck(e){
		email_flag = false ;
		btnFlag(email_flag,'emailcheck');
	
		if(  $('select.email_sel').val() == 'other' ){
			const regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
			const bool = regExp.test( $('input#inputEmail1').val() );
			
			if( !bool ){ // 이메일이 정규표현식에 위배된 경우
				$('span#error_email').text("이메일이 적합한 형식이 아닙니다.");
			}
			else{ // 이메일이 정규표현식에 위배되지않은경우
				$('span#error_email').text("");		
			}
			
		}// end of if 
		else{
			const regExp = /^(?=.{4,16})(?!.*[^a-z0-9\-_])[a-z0-9\-_]*$/
			const bool = regExp.test( $('input#inputEmail1').val() );
			
			if ( !bool ){
				$('span#error_email').text("도메인을 제외한 이메일 아이디를 정확하게 입력해주세요.");
			}
			else{
				$('span#error_email').text("");
			}
			
		}// end of else 
	
	
	
	}// END OF FUNCTION EMAILCHECK
	
	function emailDuplicateCheck(){
		if ($('span#error_email').text() != "" || $("input#inputEmail1").val() == ""){
			alert('이메일을 정확하게 입력해주세요.');
			return ;
		}
		
		const inputEmail = $("input#inputEmail1").val();
		const emailSelected = $("select#emailSelector").val();
		let email = "";
		if(emailSelected == "other") {
			email = inputEmail;	
		} else {
			email = inputEmail + emailSelected;
		}
		
		
		$.ajax({
	      	url:"<%=ctxPath%>/register/checkDuplicateEmail.dak",
	      	data:{"email":email},
	      	type:"post", // 생략시 get
	      	dataType:"json",
	      	async:false,
	      	success:function(json) {
	      		
	      		if(json["isExists"]) {
	      			alert("이미 존재하는 이메일입니다.\n다른 이메일 주소를 입력해주세요.");
	      		} else {
	      			email_flag = true ;
	      			btnFlag(email_flag,'emailcheck');
	      			
	      		}
	      	},
	      	error: function(request, status, error){
	              alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
	            }
	      });
	}// END OF EMAILDUPLICATECHECK
	function goHostRegister() {
		$("button#Reghost").click(function(){
			$("div#host_register").toggle();
		});
	}
	
	
	
	function goRegister(){
		
		
		// 비밀번호 
		if( $('input#inputPwd1').val() == "" || $('input#inputPwd2').val() == ""){
			alert('비밀번호와 비밀번호 확인은 필수 입력사항입니다.');	
			return ;
		}
		
		if ( $('span#error_pwd').text() != "" || $('span#error_pwd_check').text() != ""  ){
			alert('비밀번호와 비밀번호확인은 조건에 따라 입력하셔야 합니다.');
			return ;
		}
		
		// 이메일 	
		if( $('input#inputEmail1').val() == "" ) {
			alert('이메일은 필수 입력사항입니다.');	
			return ;
		}
		
		if( !email_flag ){
			alert('이메일 중복확인을 클릭해주세요');
			return ;
		}
		//////////////////////////////////////
		const myfrm = document.myfrm;
		
		const inputEmail = $("input#inputEmail1").val();
		const emailSelected = $("select#emailSelector").val();
		if(emailSelected == "other") {
			myfrm.email.value = inputEmail;	
		} else {
			myfrm.email.value = inputEmail + emailSelected;
		}
		
		
		myfrm.action = "register.dak"
		myfrm.method = "post";
		myfrm.submit();
		
	}// END OF FUNCTIO GOREGISTER
	
</script>
</head>
<body>

<div id="container">
	<div class="text-center	">
		<a href="<%= ctxPath%>/main/home.gc" ><img src="<%= ctxPath%>/resources/images/여기어때로고.png" style="height: 35px; width:112px; margin:80px 0 50px 0;"/></a>
		<h2 style="margin-bottom: 10px; font-weight: bold; font-size:16pt;">회원가입</h2>
	</div>
	
	<form name="myfrm">
		  
		  <label for="inputEmail1" style="color:#0000008F; font-weight: bold;">이메일&nbsp;아이디</label>
		  <div class="form-group row" style=" display:flex; margin-left: 3px;"> 
		    <input type="text" style="height: 50px;" class="form-control col-sm-4" id="inputEmail1" aria-describedby="emailHelp" placeholder="이메일 주소" >
		  	<div class="form-group mx-6 col-sm-5" style="margin-bottom: 0px;">
		      <select class="form-control email_sel" id="emailSelector" style="height:50px;" onchange="EmailCheck()">
		        <option value="other" selected>직접입력</option>
		        <option value="1">naver.com</option>
		        <option value="2">hanmail.com</option>
		        <option value="3">daum.net</option>
		        <option value="4">google.com</option>
		        <option value="5">gamil.com</option>
		      </select>
		      
		    </div>
		    <button type="button" class="btn emailcheck check col-sm-3" style="height: 50.22222px !important;background-color:#EBEBEB;
    														width: 106px !important;">중복확인</button>
		  </div>
		   <div><span id="error_email" style="color:red;"></span></div>
		  
		  <div class="form-group">
		    <label for=inputPwd1 style="color:#0000008F; font-weight: bold;">비밀번호</label>
		    <input type="password" style="height:50px;"class="form-control" id="inputPwd1" placeholder="6 ~ 16자 영문,숫자,특수문자 1개 이상씩 혼용">
			  <div><span id="error_pwd" style="color:red;"></span></div>
		    <br>
		    <label for="inputPwd2" style="color:#0000008F; font-weight: bold;">비밀번호&nbsp;확인</label>
		    <input type="password" style="height:50px;" class="form-control" id="inputPwd2" placeholder="비밀번호 확인">
			  <div><span id="error_pwd_check" style="color:red;"></span></div>
		  </div>
		 
		  <label for="inputId1" style="color:#0000008F; font-weight: bold;">닉네임</label>
		  <div class="form-group row" style="width:100%; display:flex;  margin-left: 3px;">
		    <input type="text" style="height: 50px;" class="form-control col-sm-7" id="inputId1" placeholder="닉네임 입력">
		  	<button type="button" class="btn col-sm-4 offset-sm-1" style="background-color: #EBEBEB; color:#0000008F; height: 50px;border-radius: 6px;font-weight: bold;">딴거할래요</button>
		  </div>
		  <button type="button" id="Reghost" onclick="goHostRegister()" style="border:none;">업주로 가입하기</button>
			  <div id="host_register">
				 	<div class="form-group" style="margin:10px 0px 0px 3px;">
					    <label for=business_id style="color:#0000008F; font-weight: bold;">사업자등록번호&nbsp;<span style="font-size: 10pt;">[-제외하고 입력하세요]</span></label>
					    <input type="text" style="height:50px;"class="form-control" id="business_id" placeholder="사업자번호" maxlength="12">
				  	</div>
				  <div><span id="error_business_id" style="color:red;"></span></div>
				  
				  <div class="form-group" style="margin:10px 0px 0px 3px;">
				 	  <label for=onerName style="color:#0000008F; font-weight: bold;">대표자명</label>
				 	  <input type="text" style="height:50px;" id="onerName" class="form-control" placeholder="대표자명" />
				  </div>
				  <div><span id="error_onerName" style="color:red;"></span></div>
				  
				  <div class="form-group" style="margin:10px 0px 0px 3px;">
				 	  <label for=companyName style="color:#0000008F; font-weight: bold;">상호명</label>
				 	  <input type="text" style="height:50px;" id="companyName" class="form-control" placeholder="상호명" />
				  </div>
				  <div><span id="error_companyName" style="color:red;"></span></div>
			 </div>
		 <div class="row my-5">
		 	<div class="col-md-12 text-center">
		 		<button type="button" class="btn" style="margin-bottm: 50px;width: 100%;height: 56px; background-color: #fafafa;; color: #00000029;" onclick="goRegister()">가입하기</button>
			</div>
		</div>
		
	</form>

</div>

</body>
</html>