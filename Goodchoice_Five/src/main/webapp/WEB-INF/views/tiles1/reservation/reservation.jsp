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

		<div id="reserve_contents">
			<div class="left">
				<div  class="info_chkin">
					<section>
						<h3>예약자 정보</h3>
						<strong>예약자 이름 </strong> 
						<p class="inp_wrap remove">
							<input type="text" name="userName" placeholder="체크인시 필요한 정보입니다." maxlength="20">
						</p>
						<p data-show="name" class="alert_txt" style="visibility: hidden">
				          	  한글, 영문, 숫자만 입력 가능. (문자 사이 공백은 1칸만 입력 가능)
				        </p>
				        <div>
				        	<strong>휴대폰 번호 </strong>
				        	<span class="safety_txt">개인 정보 보호를 위해 안심번호로 숙소에 전송됩니다.</span>
				        </div>
				        <!-- 비회원 진행 시 인증 번호 입력하는 부분  -->
				        <div class="phone_confirm">
				        	<p class="input-box2">
				        		<input type="tel" name="userPhone" placeholder="체크인시 필요한 정보입니다." maxlength="13" value="" class="input validation-required-input">
				        		<button type="button" class="btn_send btn_confirm phone-auth-btn" >
							                인증번호 전송
							    </button>
							 
				        	</p>
				        	   <p data-show="tel" class="alert_txt error-message">휴대폰 번호를 확인해 주세요.</p>
							
				        </div>
				        
					</section>
				</div>
				<section class="pay_select" data-v-6119f4be="">
					<h3 data-v-6119f4be="">결제수단 선택</h3> 
					<select id="payment-select" class="select_type_1" data-v-6119f4be="">
						<option  selected="selected" value="KAKAO" >카카오페이</option>
						<option data-minprice="0" value="CARD">신용카드</option>	
                    </select>
                </section>
                
                
                <!--  개인 정보 보호  박스 -->
				<section class="agree">
					<p class="all_check" data-v-d63b628c="">
						<label data-v-d63b628c="">
							<input type="checkbox" name="checkAll" class="inp_chk_02" data-v-d63b628c=""> 
							<span data-v-d63b628c="">전체 동의</span>
						</label>
					</p> 
					<p data-v-d63b628c="">
						<input type="checkbox" name="checkOne" class="inp_chk_02" data-v-d63b628c=""> 
						<span onclick="pop_agree_01();" data-v-d63b628c="">
							<i data-v-d63b628c="">숙소이용규칙 및 취소/환불규정 동의</i><b data-v-d63b628c=""> (필수)</b>
						</span>
					</p> 
					<p data-v-d63b628c="">
						<input type="checkbox" name="checkOne" class="inp_chk_02" data-v-d63b628c=""> 
						<span onclick="pop_agree_02();" data-v-d63b628c="">
							<i data-v-d63b628c="">개인정보 수집 및 이용 동의</i><b data-v-d63b628c=""> (필수)</b>
						</span>
					</p> 
					<p data-v-d63b628c="">
						<input type="checkbox" name="checkOne" class="inp_chk_02" data-v-d63b628c=""> 
						<span onclick="pop_agree_03();" data-v-d63b628c="">
							<i data-v-d63b628c="">개인정보 제 3자 제공 동의</i><b data-v-d63b628c=""> (필수)</b>
						</span></p> 
					<p class="guest_chk_area" data-v-d63b628c="">
						<input type="checkbox" name="checkOne" class="inp_chk_02" data-v-d63b628c=""> 
						<span onclick="pop_agree_04();" data-v-d63b628c="">
							<i data-v-d63b628c="">만 14세 이상 확인</i><b data-v-d63b628c=""> (필수)</b>
						</span>
					</p>
				</section>
		
			</div>
			
			<div class="right">
				<div>
					<section class="info">
						<p class="name" ><strong data-v-33033856="">숙소이름</strong> 예: 엘리에나 호텔 </p>
						<p><strong>객실타입/기간</strong> 예: 부티크 퀸 / 1박</p> 
					    <p><strong>체크인</strong> 예: 06.08 목 15:00</p> 
					    <p><strong>체크아웃</strong>예: 06.09 금 11:00 </p>
				    </section>
					<section class="total_price_pc">
						<p id="price_box">
							<strong>
								<b >총 결제 금액</b>(VAT포함)
							</strong>
							<span class="price" >100,000원</span>
						</p> 
						<ul>
							<li>
				                                         ※ 해당 객실가는 세금, 봉사료가 포함된 금액입니다
				            </li> 
				            <li>
	                                                                           ※ 결제완료 후 
	                           	&nbsp;<span>예약자 이름</span>으로 바로
			                    &nbsp;<span >체크인</span> 하시면 됩니다
			                </li>
			            </ul>
                    </section>
				</div>
				<button type="button" class="btn_pay gra_left_right_red" >
				  	 결제하기
				</button>
			</div> <!--  end of right -->
			
			
			
		
		</div>  
    </body>
</html>