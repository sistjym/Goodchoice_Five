<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<%
   String ctxPath = request.getContextPath();
%>

<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.2.js"></script>

<script type="text/javascript">

	
	$(document).ready(function(){
		// 체크박스 제어 
		$("#checkAll").click(function() {
			if($("#checkAll").is(":checked")) 
				$("input[name=checkOne]").prop("checked", true);
			else $("input[name=checkOne]").prop("checked", false);
		});
	
		$("input[name=checkOne]").click(function() {
			var total = $("input[name=checkOne]").length;
			var checked = $("input[name=checkOne]:checked").length;
	
			if(total != checked) $("#checkAll").prop("checked", false);
			else $("#checkAll").prop("checked", true); 
		});

	
		$("button#goReservation").bind("click", function() {
			if(!$("#checkAll").is(":checked")){
				alert("약관에 동의하셔야 결제가 가능 합니다!");
		   	    
			}
			else{
				 var IMP = window.IMP;     // 생략가능
		   	     IMP.init('imp43877375');  // 중요!!  아임포트에 가입시 부여받은 "가맹점 식별코드". 
		   	     requestPay();
			}
   	 
		});	 // end of click 결제하기

		
		
		// 포인트 적용 
			$("button#pointApply").bind("click", function() {
				//totalPrice 최종가격
				//price
				//user_point
				let price = $("input#price").val();
				
				let point = document.getElementById("user_point").value;
				console.log(point);
				let totalprice = Number(price) - Number(point);
				console.log(totalprice);
				
				
				$("input#totalPrice").val(totalprice);


				
				
				
			})
		
	
		
	
   });// end of $(document).ready(function(){})-----------------------
   
   // Function declaration
   
	
	   function requestPay() {
	   	      // IMP.request_pay(param, callback) 결제창 호출
	   	      IMP.request_pay({ // param
	   	    	  pg : 'html5_inicis', // 결제방식 PG사 구분
		   	      pay_method : 'card',	// 결제 수단
		   	      merchant_uid : $("input#roomName").val() + new Date().getTime(), // 가맹점에서 생성/관리하는 고유 주문번호
		   	      name : $("input#roomName").val(),	 // 코인충전 또는 order 테이블에 들어갈 주문명 혹은 주문 번호. (선택항목)원활한 결제정보 확인을 위해 입력 권장(PG사 마다 차이가 있지만) 16자 이내로 작성하기를 권장
		   	      amount : 100,//100	// '${coinmoney}'  결제 금액 number 타입. 필수항목. 
		   	      buyer_email : $("input#email").val(),  // 구매자 email
		   	      buyer_name : $("input#userName").val(),	  // 구매자 이름 
		   	      // buyer_tel : '${requestScope.mobile}',    // 구매자 전화번호 (필수항목)
		   	      buyer_addr : '',  
		   	      buyer_postcode : '',
		   	      m_redirect_url : ''  // 휴대폰 사용시 결제 완료 후 action : 컨트롤러로 보내서 자체 db에 입력시킬것!
	   	      }, function (rsp) { // callback
	   	          if (rsp.success) {
	   	        	  
	   	        	const frm = document.orderForm;
				    
	   			    frm.userName.value = $("input#userName").val();
	   		        frm.email.value = $("input#email").val();
	
	   		        frm.user_point.value = $("input#user_point").val();
	   			    
	   		        frm.acommName.value = $("input#acommName").val();
	   		        frm.roomName.value = $("input#roomName").val();
	   		        frm.checkIn.value = $("input#checkIn").val();
	   		        frm.checkOut.value = $("input#checkOut").val();
	   		        frm.totalPrice.value = $("input#totalPrice").val();
	   			
	   				
	   				frm.method="POST";
	   				frm.action="<%= request.getContextPath()%>/reservation/reservationEnd.gc";
	   				frm.submit();
	   				
	   			    self.close(); // 자신의 팝업창을 닫는 것이다.
	   			    
	   	          } else {
	   	        	location.href="<%= request.getContextPath()%>/main/home.gc";
	   	            
	   	            alert("결제에 실패하였습니다.");
	   	          }
	   	      });

				
	   }
   
	   function goOrderEnd() {
		   
			const frm = document.orderForm;
			    
		    frm.userName.value = $("input#userName").val();
	        frm.email.value = $("input#email").val();
	        frm.email.value = $("input#email").val();
		    
	        frm.acommName.value = $("input#acommName").val();
	        frm.roomName.value = $("input#roomName").val();
	        frm.checkIn.value = $("input#checkIn").val();
	        frm.checkOut.value = $("input#checkOut").val();
	        frm.totalPrice.value = $("input#totalPrice").val();
		
			
			frm.method="POST";
			frm.action="<%= request.getContextPath()%>/reservation/reservationEnd.gc";
			frm.submit();
		}
	   


</script>   
	<div id="content">
		<div id="reserve_contents">
			<form name="orderForm">
				<div class="left">
				  <h3 class="reserver_name">예약자 정보</h3>
					<div class="info_chkin">
						<section class="sub_info">
							<strong >예약자 이름 </strong> 
							<input type="hidden" name="member_id" id="member_id" value="${sessionScope.loginuser.member_id}">
							<p class="inp_wrap remove">
								<input type="text" class="transInput" name="userName" id="userName" placeholder="체크인시 필요한 정보입니다." maxlength="200" value="">
							</p>
							<p data-show="name" class="alert_txt" style="visibility: hidden">
					          	  한글, 영문, 숫자만 입력 가능. (문자 사이 공백은 1칸만 입력 가능)
					        </p>
					        <div id="emailBox">
					        	<strong>이메일 정보(확정 메일을 받을 이메일을 입력해주세요) </strong>
					        	<span class="safety_txt">예약 확정시 이메일로 안내해드립니다</span>
					        </div>
					      
					        <div class="phone_confirm">
					        	<p class="inp_wrap remove">
					        		<input type="tel" name="email" id="email" class="transInput"  maxlength="150" value="" class="input validation-required-input">
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
	                
	                <!-- 할인 수단  -->
	                <h3 class="reserver_name">결제 정보</h3>
	                <section class="price_wrap sub_info" >
	                	<ul>
	                		<li class="price_li">
								<strong>구매총액</strong>   
								<span >
									<input class="transInput price_box" id="price" type="text" value="${requestScope.room_price}" readonly="readonly">
								</span>
								
	                		</li>
	                		<li class="price_li">
	                			<strong>포인트</strong>
								<input class="transInput price_box" type="text" value="${sessionScope.loginuser.point} P" readonly="readonly">
	                		</li>
	                		<li class="price_li">
								<strong>사용할 포인트</strong>
								<input class="transInput price_box point" id="user_point" type="text" value="" placeholder="P">
	                			
	                		</li>
	                		
	                	</ul>
	                	
	                	<br><br>
	                	<button type="button" id="pointApply">적용</button>
	                </section>
	                
	                
	                <!--  개인 정보 보호  박스 -->
	                <h3 class="reserver_name">약관 동의</h3>
					<section class="agree sub_info">
						<p class="all_check" >
							<label>
								<input type="checkbox" name="checkAll" id="checkAll" class="inp_chk_02"> 
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
							<input class="transInput acomInfo" type="text" name="acommName" id="acommName" value="${requestScope.acom_name}" readonly="readonly">
							
							<p><strong>객실타입/기간</strong></p> 
							<input class="transInput acomInfo" type="text" name="roomName" id="roomName" value="${requestScope.room_type} / ${requestScope.send_date_bak}" readonly="readonly">
							
						    <p><strong>체크인</strong></p> 
						    <input class="transInput acomInfo" type="text" name="checkIn" id="checkIn" value="${requestScope.check_in_date}"  readonly="readonly">
						    <p><strong>체크아웃</strong></p>
						    <input  class="transInput acomInfo" type="text" name="checkOut" id="checkOut" value="${requestScope.check_out_date}"  readonly="readonly">
					    </section>
						<section class="total_price_pc">
							<p id="price_box">
								<strong>
									<b >총 결제 금액</b>(VAT포함)
								</strong>
								
								<span class="price" >
								<input class="transInput acomInfo" type="text" name="totalPrice" id="totalPrice" value=""  readonly="readonly">
								</span>.
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
		</div>  
    </body>
</html>