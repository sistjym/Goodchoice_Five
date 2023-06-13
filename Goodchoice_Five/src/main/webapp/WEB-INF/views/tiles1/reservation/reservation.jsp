<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<%
   String ctxPath = request.getContextPath();
%>

<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>

<script type="text/javascript">

	
	$(document).ready(function(){
		
		$("button#goReservation").bind("click", function() {
			
			
			
			
			
		    const frm = document.orderForm;
		    
		    frm.userName.value = $("input#userName").val();
   	        frm.email.value = $("input#email").val();
		    
   	        frm.acommName.value = $("input#acommName").val();
   	        frm.roomName.value = $("input#roomName").val();
   	        frm.checkIn.value = $("input#checkIn").val();
   	        frm.checkOut.value = $("input#checkOut").val();
   	        frm.totalPrice.value = $("input#totalPrice").val();
   	       
   	        frm.method = "post";
   	        frm.action = "<%= request.getContextPath()%>/reservation/paymentGateway.gc";
   	        frm.submit();
			
			
			
		});// end of click 결제하기
			
	
   });// end of $(document).ready(function(){})-----------------------
   
   // Function declaration
   
	function goOrderEnd() {
		
		const frm = document.orderForm;
		frm.member_id.value = $("input#member_id").val();
		frm.method="POST";
		frm.action="<%= request.getContextPath()%>/reservation/reservationEnd.gc";
		frm.submit();
	}


</script>   

		<div id="reserve_contents">
			<form name="orderForm">
				<div class="left">
					<div  class="info_chkin">
						<section>
							<h3>예약자 정보</h3>
							<strong>예약자 이름 </strong> 
							<input type="hidden" name="member_id" id="member_id" value="${sessionScope.loginuser.member_id}">
							<p class="inp_wrap remove">
								<input type="text" name="userName" id="userName" placeholder="체크인시 필요한 정보입니다." maxlength="20" value="">
							</p>
							<p data-show="name" class="alert_txt" style="visibility: hidden">
					          	  한글, 영문, 숫자만 입력 가능. (문자 사이 공백은 1칸만 입력 가능)
					        </p>
					        <div>
					        	<strong>이메일 정보(확정 메일을 받을 이메일을 입력해주세요) </strong>
					        	<span class="safety_txt">예약 확정시 이메일로 안내해드립니다</span>
					        </div>
					      
					        <div class="phone_confirm">
					        	<p class="inp_wrap remove">
					        		<input type="tel" name="email" id="email"  maxlength="20" value="ske40109@gmail.com" class="input validation-required-input">
					        	</p>
					        	   <p data-show="tel" class="alert_txt error-message">이메일을 확인해 주세요.</p>
								
					        </div>
					        
						</section>
					</div>
					<!-- <section class="pay_select">
						<h3 data-v-6119f4be="">결제수단 선택</h3> 
						<select id="payment-select" class="select_type_1">
							<option  selected="selected" value="KAKAO" >카카오페이</option>
							<option data-minprice="0" value="CARD">신용카드</option>	
	                    </select>
	                </section> -->
	                
	                
	                <!--  개인 정보 보호  박스 -->
					<section class="agree">
						<p class="all_check" >
							<label>
								<input type="checkbox" name="checkAll" class="inp_chk_02"> 
								<span>전체 동의</span>
							</label>
						</p> 
						<p>
							<input type="checkbox" name="checkOne" class="inp_chk_02" > 
							<span>
								<i>숙소이용규칙 및 취소/환불규정 동의</i><b > (필수)</b>
							</span>
						</p> 
						<p>
							<input type="checkbox" name="checkOne" class="inp_chk_02" > 
							<span>
								<i>개인정보 수집 및 이용 동의</i><b> (필수)</b>
							</span>
						</p> 
						<p>
							<input type="checkbox" name="checkOne" class="inp_chk_02"> 
							<span>
								<i>개인정보 제 3자 제공 동의</i><b> (필수)</b>
							</span></p> 
						<p class="guest_chk_area">
							<input type="checkbox" name="checkOne" class="inp_chk_02"> 
							<span>
								<i>만 14세 이상 확인</i><b> (필수)</b>
							</span>
						</p>
					</section>
			
				</div>
				
				<div class="right">
					<div>
						<section class="info">
							
							<p class="name"><strong>숙소이름</strong></p>
							<input type="text" name="acommName" id="acommName" value="하얏트 호텔" readonly="readonly">
							<p><strong>객실타입/기간</strong></p> 
							<input type="text" name="roomName" id="roomName" value="TypeA/ 1박" readonly="readonly">
							
						    <p><strong>체크인</strong></p> 
						    <input type="text" name="checkIn" id="checkIn" value="06.08 목 15:00"  readonly="readonly">
						    <p><strong>체크아웃</strong></p>
						    <input type="text" name="checkOut" id="checkOut" value="06.09 금 11:00"  readonly="readonly">
					    </section>
						<section class="total_price_pc">
							<p id="price_box">
								<strong>
									<b >총 결제 금액</b>(VAT포함)
								</strong>
								
								<span class="price" >
								<input type="text" name="totalPrice" id="totalPrice" value="100,000원"  readonly="readonly">
								</span>
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
					<button type="button" class="btn_pay gra_left_right_red" id="goReservation">
					  	 결제하기
					</button>
				</div> <!--  end of right -->
				
			</form>
				
		
		</div>  
    </body>
</html>