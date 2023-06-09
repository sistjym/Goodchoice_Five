<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<%
   String ctxPath = request.getContextPath();
%>


<script type="text/javascript">

	
	$(document).ready(function(){
	
   });// end of $(document).ready(function(){})-----------------------
   
   // Function declaration
   


</script>   

		<div id="contents">
			<div class="left">
				<div>
					<section class="info_chkin">
						<h3>예약자 정보</h3>
						<strong>예약자 이름 </strong> 
						<p>
							<input type="text" name="userName" placeholder="체크인시 필요한 정보입니다." maxlength="20" data-v-d5c1122e="">
						</p>
						<p data-show="name" class="alert_txt" style="visibility: hidden" data-v-d5c1122e="">
				          	  한글, 영문, 숫자만 입력 가능. (문자 사이 공백은 1칸만 입력 가능)
				        </p>
				        <div>
				        	<strong>휴대폰 번호 </strong>
				        	<span class="safety_txt" data-v-413dfd7e="">개인 정보 보호를 위해 안심번호로 숙소에 전송됩니다.</span>
				        </div>
				        <!-- 비회원 진행 시 인증 번호 입력하는 부분  -->
				        <div class="phone_confirm">
				        	<div class="input-box">
				        		<input type="tel" name="userPhone" placeholder="체크인시 필요한 정보입니다." maxlength="13" value="" class="input" data-v-413dfd7e="">
				        		<div data-v-413dfd7e="" class="cancel-icn-touch"><svg data-v-413dfd7e="" height="20" width="20" xmlns="http://www.w3.org/2000/svg" class="cancel-icn"><path data-v-413dfd7e="" d="M10 17.5a7.5 7.5 0 110-15 7.5 7.5 0 010 15zm0-8.914L7.172 5.757 5.757 7.172 8.586 10l-2.829 2.828 1.415 1.415L10 11.414l2.828 2.829 1.415-1.415L11.414 10l2.829-2.828-1.415-1.415z"></path></svg></div>
				        	</div>
							<button type="button" class="btn_send btn_confirm phone-auth-btn" data-v-413dfd7e="">
						                인증번호 전송
						    </button>
						    <p data-show="tel" class="alert_txt error-message" style="" data-v-413dfd7e="">휴대폰 번호를 확인해 주세요.</p>
				        </div>
				        <div class="guest_login" style="display: block" data-v-d5c1122e=""><a data-v-d5c1122e="">
						            로그인 후 예약하시면<br data-v-d5c1122e="">할인 쿠폰과 추가 혜택을 받을수
						            있어요<br data-v-d5c1122e=""> <span data-v-d5c1122e="">로그인</span></a>
			            </div>
					</section>
				</div>
				<div>
					<section class="price_wrap total_price" data-v-6119f4be="">
						<p data-v-6119f4be="">
							<strong data-v-6119f4be="">
								<b data-v-6119f4be="">총 결제 금액</b>(VAT포함)
							</strong>
							<span class="in_price_app" data-v-6119f4be="">100,000원</span>
						</p> <!----> 
						<ul data-v-6119f4be=""><!----> 
							<li data-v-6119f4be="">
				                                    해당 객실가는 세금, 봉사료가 포함된 금액입니다
				            </li> 
				            <li data-v-6119f4be="">
	                           	 결제완료 후 
	                           	<span data-v-6119f4be="">예약자 이름</span>으로 바로
			                    <span data-v-6119f4be="">체크인</span> 하시면 됩니다
			                </li>
			            </ul>
                    </section>
				</div>
				<div>
					<section  class="">
					
					</section>
				</div>
			</div>
			
			<div class="right">
				<div>
					<section>
					
					</section>
				</div>
			</div>
		
		
		
		</div>  
    </body>
</html>