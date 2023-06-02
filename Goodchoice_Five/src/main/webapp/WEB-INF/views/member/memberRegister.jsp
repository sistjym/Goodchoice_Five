<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<%
    String ctxPath = request.getContextPath();

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
	
	button.check{
		color:#ffffff !important; 
		border: solid 1px #cccccc; 
		background-color:#FFA751;
		width:100px;
		font-size: 10pt;
	}
	button.check_success{
		color:#ccc !important; 
		border: solid 1px #cccccc; 
		font-size: 10pt;
		background-color:##ffffff;
		width:100px;
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
	let host_flag = false;	// 업주로 가입인지 일반회원가입인지 
 	let bsNum_flag = false;
	
	$(document).ready(function(){		

		host_flag = false;
		$("div#host_register").hide();
		setEventHandling();
	      
	});
	
	function setEventHandling() {
		// 이메일 유효성 검사 및 중복 검사
		$('input#inputEmail1').on('input',EmailCheck);
		$('select.email_sel').on('change',EmailCheck);
		
		$('input#business_id').on('change',businessNumCheck);
		
		$('button.bsNumcheck').click(bsNumDuplicateCheck);
		$('button.emailcheck').click(emailDuplicateCheck);
		
		// PWD 유효성 검사 및 비밀번호 일치 검사
		$('input#inputPwd1').on('input',pwdCheck);
		$('input#inputPwd2').on('input',pwdSame);
		
		// 닉네임 유효성 검사
		$('input#nickname').on('input', nicknameCheck);
		
		// 대표자명 유효성 검사
		$('input#onerName').on('input', onerNameCheck);
		// 상호명 유효성 검사
		$('input#companyName').on('input', compnayNameCheck);
	}
	
	
	function btnFlag(flag,id) {
		if( flag ){ // 중복확인이 된 경우
			$('button.'+id).removeClass("check");
			$('button.'+id).addClass("check_success");
			$('button.'+id).text("확인완료");
		}
		else{
			$('button.'+id).removeClass("check_success");
			$('button.'+id).addClass("check");
			$('button.'+id).text("중복확인");
		}
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
			$("input#inputEmail1").focus();
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
	      	url:"<%= ctxPath%>/checkDuplicateEmail.gc",
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
	  		const pwd1 = $('input#inputPwd1').val(); // 비밀번호
	  		const pwd2 = $(this).val(); // 비밀번호 확인 
	  		
	  		if ( pwd1 == pwd2 ){
	  			$('span#error_pwd_check').text("");
	  		}
	  		else{
	  			$('span#error_pwd_check').text("비밀번호가 일치하지 않습니다.");
	  		}
	  		
	  		
	  	}// END OF FUNCTION PWDSAME()
	
	
	function nicknameCheck(e) {
		const inputNickname = $("input#nickname").val();
		
		
		const regExp = /^[가-힣]{2,10}$/;
		if (!regExp.test(inputNickname)) {
			$("span#error_nickname").text("한글 2자~10자만 입력 가능합니다.");
		} else {
			$("span#error_nickname").text("");
		}
	}
	  	
	function businessNumCheck(e) {
		bsNum_flag = false ;
		btnFlag(bsNum_flag,'bsNumcheck');
		
		
		const registrationNumber = $("input#business_id").val();
		
		if (registrationNumber.length !== 11) {
		      $('span#error_business_id').text('사업자등록번호는 11자리여야 합니다.').css('color','red');
		      return;
	} 	
		const pattern = /^\d+$/;
	    if (!pattern.test(registrationNumber)) {
	      $('span#error_business_id').text('사업자등록번호는 숫자로만 입력해야 합니다.').css('color','red');
	      return;
	    }
	    
	    $('span#error_business_id').text('사용가능한 사업자등록번호입니다.').css('color','green');
	} // end of businessNumCheck(e) ------------------
	
	function bsNumDuplicateCheck(){
		const business_id = $("input#business_id").val();
		
		if ($('span#error_business_id').text() != "사용가능한 사업자등록번호입니다." || $("input#business_id").val() == ""){
			alert('사업자등록번호를 정확하게 입력해주세요.');
			$("input#business_id").focus();
			return ;
		}
		
		$.ajax({
	      	url:"<%= ctxPath%>/checkDuplicateBusinessNum.gc",
	      	data:{"business_id":business_id},
	      	type:"post", // 생략시 get
	      	dataType:"json",
	      	async:false,
	      	success:function(json) {
	      		
	      		if(json["isExists"]) {
	      			alert("이미 존재하는 사업자등록번호입니다.\n다른 사업자등록번호를 입력해주세요.");
	      		} else {
	      			bsNum_flag = true ;
	      			btnFlag(bsNum_flag,'bsNumcheck');
	      			
	      		}
	      	},
	      	error: function(request, status, error){
	              alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
	            }
	      }); 
	}// END OF EMAILDUPLICATECHECK
	
	
	function onerNameCheck(e) {
		const onerName = $("input#onerName").val();
		
		
		const regExp = /^[가-힣]{2,10}$/;
		if (!regExp.test(onerName)) {
			$("span#error_onerName").text("한글 2자~10자만 입력 가능합니다.");
		} else {
			$("span#error_onerName").text("");
		}
	}
	
	function compnayNameCheck(e) {
		const companyName = $(this).val();
		
		// 한글과 영어만 입력 가능한지 확인
	    var pattern = /^[a-zA-Z가-힣0-9\s]*$/;
	    if (!pattern.test(companyName)) {
	      $('span#error_companyName').text('상호명은 한글과 영어만 입력 숫자만 가능합니다.');
	      return;
	    }
	    if (companyName.length < 2 || companyName.length > 10) {
	        $('span#error_companyName').text('상호명은 2글자 이상 10글자 이하여야 합니다.');
	        return;
	      }
	    
	    $('span#error_companyName').text("");
	}
	
	
	
	
	function goHostRegister() {
			
			$('button.bsNumcheck').removeClass("check_success");
			$('button.bsNumcheck').addClass("check");
			$('button.bsNumcheck').text("중복확인");
			$('button.emailcheck').removeClass("check_success");
			$('button.emailcheck').addClass("check");
			$('button.emailcheck').text("중복확인");
			host_flag = true;
			$("div#host_register").show();
			$(".nickname").hide();
			$("span#error_email").text("");
			$("span#error_pwd").text("");
			$("span#error_pwd_check").text("");
			$("span#error_nickname").text("");
			$("input#inputEmail1").val("");
			$("select#emailSelector").val("other");
			$("input#inputPwd1").val("");
			$("input#inputPwd2").val("");
			$("input#nickname").val("");
	}
	
	function goMemberRegister() {
		
		
		$('button.bsNumcheck').removeClass("check_success");
		$('button.bsNumcheck').addClass("check");
		$('button.bsNumcheck').text("중복확인");
		$('button.emailcheck').removeClass("check_success");
		$('button.emailcheck').addClass("check");
		$('button.emailcheck').text("중복확인");
		host_flag = false;
		$("div#host_register").hide();
		$(".nickname").show();
		$("span#error_email").text("");
		$("span#error_pwd").text("");
		$("span#error_pwd_check").text("");
		$("span#error_business_id").text("");
		$("span#error_onerName").text("");
		$("span#error_companyName").text("");
		$("input#inputEmail1").val("");
		$("select#emailSelector").val("other");
		$("input#inputPwd1").val("");
		$("input#inputPwd2").val("");
		$("input#business_id").val("");
		$("input#onerName").val("");
		$("input#companyName").val("");
		
}
	
	
	
	let item = ['어피치', '초롱초롱', '튜브', '프로도', '라이언', '프로도', '뚜루뚜루', '멍멍이', '코코넛', '귀여웡', '안귀여웡', '비비안', '호호호', '콩닥콩닥', '무지한무지', '단무지', '무지개', '쿠키빵', '곰돌이', '꽃순이', '마빡딱대', '코카는제로', '배고파', '아깜짝아', '조장님바보', '키키케케'];

	function getRandomItem() {
		  let randomItem = item[Math.floor(Math.random() * item.length)];
		  $('input#nickname').val(randomItem);
		  $("span#error_nickname").text("");
		}
	
	
	function goRegister(){
		// console.log("host_flag : " + host_flag);
		if(!host_flag){
			
			// 이메일 	
			if( $('input#inputEmail1').val() == "" ) {
				alert('이메일은 필수 입력사항입니다.');	
				$('input#inputEmail1').focus();
				return ;
			}
			
			if( !email_flag ){
				alert('이메일 중복확인을 클릭해주세요');
				return ;
			}
			
			// 비밀번호 
			if( $('input#inputPwd1').val() == "" || $('input#inputPwd2').val() == ""){
				alert('비밀번호와 비밀번호 확인은 필수 입력사항입니다.');	
				$('input#inputPwd1').focus();
				return ;
			}
			
			if ( $('span#error_pwd').text() != "" || $('span#error_pwd_check').text() != ""  ){
				alert('비밀번호와 비밀번호확인은 조건에 따라 입력하셔야 합니다.');
				return ;
			}
			
			if( $('input#nickname').val().trim() == "" || $("span#error_nickname").text() != "") {
				alert('닉네임을 올바르게 입력해주세요.');
				$('input#nickname').focus();
				return;
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
			
			
			myfrm.action = "<%= ctxPath%>/gomemberRegister.gc"
			myfrm.method = "post";
			myfrm.submit();	
		
		}
		
		else {	// 호스트로 가입할때
			// console.log("host_flag : " + host_flag);
			// 이메일 	
			if( $('input#inputEmail1').val() == "" ) {
				alert('이메일은 필수 입력사항입니다.');	
				$('input#inputEmail1').focus();
				return ;
			}
			
			if( !email_flag ){
				alert('이메일 중복확인을 클릭해주세요');
				return ;
			}
			// 비밀번호 
			if( $('input#inputPwd1').val() == "" || $('input#inputPwd2').val() == ""){
				alert('비밀번호와 비밀번호 확인은 필수 입력사항입니다.');
				$('input#inputPwd1').focus();
				return ;
			}
			
			if ( $('span#error_pwd').text() != "" || $('span#error_pwd_check').text() != ""  ){
				alert('비밀번호와 비밀번호확인은 조건에 따라 입력하셔야 합니다.');
				return ;
			}
			
			if( !bsNum_flag ){
				alert('사업자번호 중복확인을 클릭해주세요');
				return ;	
			}
			
			if( $('input#business_id').val().trim() == "") {
				alert('사업자등록번호는 필수 입력사항입니다.');
				$('input#business_id').focus();
				return;
			}
			
			if( $('input#onerName').val().trim() == "" || $("span#error_onerName").text() != "") {
				alert('대표자명을 입력하지 않았거나 올바르지 않습니다.');
				$('input#onerName').focus();
				return;
			}
			
			if( $('input#companyName').val().trim() == "" || $('span#error_companyName').text() != "") {
				alert('상호명을 올바르게 입력해주세요.');
				$('input#companyName').focus();
				return;
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
			
			myfrm.action = "<%= ctxPath%>/gohostRegister.gc"
			myfrm.method = "post";
			myfrm.submit();	
			
		}
			
		
			
			
		
	}// END OF FUNCTIO GOREGISTER
	
	
	
</script>
</head>
<body>

<div id="container">
	<div class="text-center	">
		<a href="<%= ctxPath%>/main/home.gc" ><img src="<%= ctxPath%>/resources/images/여기어때로고.png" style="height: 35px; width:112px; margin:80px 0 50px 0;"/></a>
		<h2 style="margin-bottom: 10px; font-weight: bold; font-size:16pt;">회원가입</h2>
		<button type="button" id="Regmember" onclick="goMemberRegister()"style="border:solid 1px #bfbfbf; color:#bfbfbf; background-color: #fff; border-radius: 5px;">일반회원 가입하기</button>
		<button type="button" id="Reghost" onclick="goHostRegister()" style="border:solid 1px #bfbfbf; color:#bfbfbf; background-color: #fff; border-radius: 5px;">업주로 가입하기</button>
	</div>
	
	<form name="myfrm" style="margin-top:15px;">
		  
		  <label for="inputEmail1" style="color:#0000008F; font-weight: bold;">이메일&nbsp;아이디</label>
		  <div class="form-group row" style=" display:flex; margin-left: 3px;"> 
		    <input type="text" style="height: 50px;" class="form-control col-sm-4" id="inputEmail1" aria-describedby="emailHelp" placeholder="이메일 주소" >
		  	<input type="hidden" name="email">
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
		    <input type="password" style="height:50px;"class="form-control" id="inputPwd1" name="pwd" placeholder="6 ~ 16자 영문,숫자,특수문자 1개 이상씩 혼용">
			  <div><span id="error_pwd" style="color:red;"></span></div>
		    <br>
		    <label for="inputPwd2" style="color:#0000008F; font-weight: bold;">비밀번호&nbsp;확인</label>
		    <input type="password" style="height:50px;" class="form-control" id="inputPwd2" placeholder="비밀번호 확인">
			  <div><span id="error_pwd_check" style="color:red;"></span></div>
		  </div>
		 
		  <label class="nickname" for="nickname" style="color:#0000008F; font-weight: bold;">닉네임</label>
		  <div class="form-group row nickname"  style="width:100%; display:flex;  margin-left: 3px;">
		    <input type="text" style="height: 50px;" class="form-control col-sm-7" id="nickname" name="nickname" placeholder="닉네임 입력">
		  	<button type="button" id="btn_random" class="btn col-sm-4 offset-sm-1" style="background-color: #EBEBEB; color:#0000008F; height: 50px;border-radius: 6px;font-weight: bold;" onclick="getRandomItem()" >딴거할래요</button>
		  	<div><span id="error_nickname" style="color:red;"></span></div>
		  </div>
		  	
			  <div id="host_register">
				 	<div class="form-group row" style="margin:10px 0px 0px 3px; ">
					    <label for=business_id style="color:#0000008F; font-weight: bold;">사업자등록번호&nbsp;<span style="font-size: 10pt;">[-제외하고 입력하세요]</span></label>
					    <input type="text" style="height:50px;"class="form-control col-sm-8" id="business_id" name="business_id" placeholder="사업자번호" maxlength="11">
				  		<button type="button" class="btn bsNumcheck check col-sm-3 offset-sm-1" style="height: 50.22222px !important;background-color:#EBEBEB; 
    														width: 106px  !important;">중복확인</button>
				  	</div>
				  <div><span id="error_business_id" style="color:red;"></span></div>
				  
				  <div class="form-group" style="margin:10px 0px 0px 3px;">
				 	  <label for=onerName style="color:#0000008F; font-weight: bold;">대표자명</label>
				 	  <input type="text" style="height:50px;" id="onerName" name="onerName" class="form-control" maxlength="15" placeholder="대표자명" />
				  </div>
				  <div><span id="error_onerName" style="color:red;"></span></div>
				  
				  <div class="form-group" style="margin:10px 0px 0px 3px;">
				 	  <label for=companyName style="color:#0000008F; font-weight: bold;">상호명</label>
				 	  <input type="text" style="height:50px;" id="companyName" name="companyName" class="form-control" maxlength="15" placeholder="상호명" />
				  </div>
				  <div><span id="error_companyName" style="color:red;"></span></div>
			 </div>
		 <div class="row my-5">
		 	<div class="col-md-12 text-center">
		 		<button type="button" class="btn" style="margin-bottm: 50px;width: 100%;height: 56px; background-color: #f2114c; color: #fff;" onclick="goRegister()">가입하기</button>
			</div>
		</div>
		
	</form>

</div>

</body>
</html>