<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String ctxPath = request.getContextPath();
%>

<!-- Optional JavaScript -->
<script type="text/javascript" src="<%= ctxPath%>/resources/js/jquery-3.6.4.min.js"></script>
<script type="text/javascript" src="<%= ctxPath%>/resources/bootstrap-4.6.0-dist/js/bootstrap.bundle.min.js" ></script>

<script type="text/javascript">

	
	$(document).ready(function(){		

		
		setEventHandling();
		$("button.btns-wrap__edit-btn").css({"background-color": "#fff", "color": "#bfbfbf"});
	    

		$(".btns-wrap__edit-btn").click(function() {

		  var section = $(this).closest("section");


		  section.find(".modifying-section").show();
		  section.find(".btns-wrap__edit-btn").hide();


		  section.find(".btns-wrap__submit-btn, .btns-wrap__cancel-btn").show();
		});
		
		$(".btns-wrap__cancel-btn").click(function() {

			  var section = $(this).closest("section");


			  section.find(".modifying-section, .btns-wrap__submit-btn, .btns-wrap__cancel-btn").hide();


			  section.find(".btns-wrap__edit-btn").show();
			});
		
		$("#btn_rannick").click(function() {
			let item = ['어피치', '초롱초롱', '튜브', '프로도', '라이언', '프로도', '뚜루뚜루', '멍멍이', '코코넛', '귀여웡', '안귀여웡', '비비안', '호호호', '콩닥콩닥', '무지한무지', '단무지', '무지개', '쿠키빵', '곰돌이', '꽃순이', '마빡딱대', '코카는제로', '배고파', '아깜짝아', '조장님바보', '키키케케'];

			
				  let randomItem = item[Math.floor(Math.random() * item.length)];
				  $("input#ran_nick").val("");
				  $("input#ran_nick").val(randomItem);
				  $("span#error_nickname").text("");
			
		});
	});
	
	function setEventHandling() {
		
		// 닉네임 유효성 검사
		$('input#ran_nick').on('input', nicknameCheck);
	}
	
	function nicknameCheck(e) {
		const inputNickname = $("input#ran_nick").val();
		
		
		const regExp = /^[가-힣]{2,10}$/;
		if (!regExp.test(inputNickname)) {
			$("span#error_nickname").text("한글 2자~10자만 입력 가능합니다.");
		} else {
			$("span#error_nickname").text("");
		}
	}
	
	
	
	
	
	
	
	

</script>

<div id="content" class="sub_wrap my_wrap">

	<div class="align_rt">
		<div class="mypage">
			<form name="form1" action="" method="post" novalidate="novalidate">
				
				<section class="top_area">
					<strong>내 정보 수정</strong>
					<div class="login_info">
						<div class="dimg"><img src="<%= ctxPath%>/resources/images/ico_21.png" alt=""></div>
						<p>${sessionScope.dec_email}</p>
					</div>

					<div class="pw_input">
						<div class="pw_input__title">
							<b>닉네임</b>
							<span class="title__uinfo">${sessionScope.loginuser.member_nickname}</span>
						</div>
						<section class="modifying-section" style="display: none;">
							<p class="inp_wrap remove form-errors">
								<input type="text" name="ran_nick" value="${sessionScope.loginuser.member_nickname}" placeholder="체크인시 필요한 정보입니다." class="required_my" data-input="unick" data-msg-required="닉네임을 입력하세요." data-rule-minlength="2" data-rule-maxlength="14" data-rule-spacechar="true" data-rule-specialchar="true"/>
							</p>
							<button type="button" id="btn_rannick" class="btn_etc btn_confirm active">딴거할래요</button> <!-- 활성화 클래스 'active' -->
							<div><span id="error_nickname" style="color:red;"></span></div>
						</section>
						<div class="pw_input__btns-wrap">
							<button class="btns-wrap__edit-btn" type="button">수정</button>
							<button class="btns-wrap__submit-btn" type="submit">수정완료</button>
							<button class="btns-wrap__cancel-btn" type="button">수정취소</button>
						</div>
					</div>
				</section>
			</form>
			<form name="form2" action="https://www.goodchoice.kr/my/mypageInfoUpdate" autocomplete="off" method="post" novalidate="novalidate" data-form="uname">
				<!-- 폼전송시 전달되는 data target element -->
				<div class="mypageForm__form-inputs-wrap" aria-hidden="true">
					<input type="hidden" name="uno" value="20570882">
					<input type="text" name="unick" aria-hidden="true" value="nickname">
					<input type="text" name="uname" aria-hidden="true" value="reserved_name">
				</div>

				<section class="top_area">
					<div class="pw_input">
						<div class="pw_input__title">
							<b>예약자 이름</b>
							<span class="title__uinfo"></span>
						</div>
						<section class="modifying-section" style="display: none;">
							<p class="inp_wrap remove form-errors">
								<input type="text" id="uname" value="" placeholder="체크인시 필요한 정보입니다." class="required_my" data-input="uname" data-rule-spacechar="true" data-rule-specialchar="true">
							</p>
						</section>
						<div class="pw_input__btns-wrap">
							<button class="btns-wrap__edit-btn" type="button" style="?android:attr/borderlessButtonStyle">수정</button>
							<button class="btns-wrap__submit-btn" type="submit">수정완료</button>
							<button class="btns-wrap__cancel-btn" type="button" style="?android:attr/borderlessButtonStyle">수정취소</button>
						</div>
					</div>
				</section>
			</form>

			<form name="form3" action="https://www.goodchoice.kr/my/mypageInfoUpdate" autocomplete="off" method="post" novalidate="novalidate" data-form="uphone">
				<section>
					<!-- 폼전송시 전달되는 data target element -->
					<div class="mypageForm__form-inputs-wrap" aria-hidden="true">
						<input type="hidden" name="uno" value="20570882">
						<input type="text" name="unick" aria-hidden="true" value="nickname">
						<input type="text" name="uname" aria-hidden="true" value="reserved_name">
						<input type="tel" name="uphone" aria-hidden="true" value="phone-num">
					</div>
					<!-- <div class="pw_input phone_confirm">
						<div class="pw_input__title">
							<b>휴대폰 번호</b>
							<span class="title__uinfo">phone-num</span>
							<div class="safety_txt">개인 정보 보호를 위해 내 정보는 모두 안전하게 암호화됩니다.</div>
						</div>
						<div class="modifying-section" style="display: none;">
							<div id="sendCode">
								<section>
									<div class="inp_wrap remove form-errors">
										<input type="tel" id="phone_number" value="" placeholder="체크인시 필요한 정보입니다." maxlength="13" data-input="uphone" data-msg-required="휴대폰 번호를 인증받으세요." data-rule-phonenumber="true">
										<button type="button" class="btn_checked">확인</button>
									</div>
									<button type="button" class="btn_send btn_confirm">인증번호 전송</button> 활성화 클래스 'active'
								</section>
							</div>
							<div id="verificationCode" style="display: none;">
								<b>인증 번호</b>
								<section>
									<div class="inp_wrap remove">
										<input type="tel" id="digit" minlength="4" maxlength="4">
										<span class="timer">&nbsp;</span>
									</div>
									<button type="button" class="btn_ok btn_confirm" data-verification-type="call" data-verification-next="mypageVerify">확인</button>
								</section>
							</div>
							<input type="hidden" id="phone_certification_point" value="MYPAGE" style="display: none;">
						</div>
						<div class="pw_input__btns-wrap">
							<button class="btns-wrap__edit-btn " type="button">수정</button>
							<button class="btns-wrap__submit-btn" type="submit">수정완료</button>
							<button class="btns-wrap__cancel-btn" type="button">수정취소</button>
						</div>
					</div> -->
				</section>
			</form>
			<!-- <button class="btn_submit disabled btn_one" type="submit">저장</button>-->

							<p class="bot_link"><a href="">비밀번호 변경</a> &gt;</p>
					</div>

		<div class="bot_btn">
			<p>여기어때를 이용하고 싶지 않으신가요?</p>
			<button type="button" onclick="pop_twobtn('ell','로그아웃 하시겠습니까?','취소','로그아웃','close_layer()','logoutPro()');">로그아웃</button>
							<button type="button"><a href="https://www.goodchoice.kr/my/withdraw">회원탈퇴</a></button>
					</div>
	</div>
</div>