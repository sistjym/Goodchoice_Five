<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String ctxPath = request.getContextPath();
%>

<script type="text/javascript">
$(document).ready(function() {
	
	
});

function getSendDateBak(checkInDate, checkOutDate) {
	  const oneDay = 24 * 60 * 60 * 1000; // 1일을 밀리초로 표현
	  const startDate = new Date(Date.parse(checkInDate));
	  const endDate = new Date(Date.parse(checkOutDate));
	  const diffDays = Math.round(Math.abs((startDate - endDate) / oneDay));
	  return diffDays;
	}

</script>

<div class="align_rt">
	<div class="reserve_list">
		
		<section class="list_fst">
		    <h3 class="liti">예약 내역</h3> 
		    <c:forEach var="reservation" items="${requestScope.reservationList}">
		        <c:if test="${reservation.reserv_status == '1' && reservation.fk_member_id == sessionScope.loginuser.member_id}">
		            <ul class="list_wrap">
		                <li class="reservation-detail">
		                    <div class="reserve-div">
		                        <input type="hidden" name="member_id" id="member_id" value="${sessionScope.loginuser.member_id}"/>
		                        <button type="button" class="btn_del">
		                            	삭제
		                        </button>
		                        <p class="pic">
		                            <img loading="lazy" srcset="https://image.goodchoice.kr/resize_354x184/adimg_new/779/203463/71325338f503e141b7d061d0eeb01053.jpg, https://image.goodchoice.kr/resize_531x276/adimg_new/779/203463/71325338f503e141b7d061d0eeb01053.jpg 1.5x , https://image.goodchoice.kr/resize_708x368/adimg_new/779/203463/71325338f503e141b7d061d0eeb01053.jpg 2x" src="<%= ctxPath%>/resources/images/${reservation.acom_image}" alt="${reservation.acom_name}" class="align">
		                        </p> 
		                        <a href="<%= ctxPath%>/reservation-detail.gc?acom_name=${reservation.acom_name}&room_type=${reservation.room_type}&price=${reservation.price}&check_in_date=${reservation.check_in_date}&check_out_date=${reservation.check_out_date}&reserv_id=${reservation.reserv_id}" class="product-title">
		                            <i class="bg_w">예약숙소</i> 
		                            <strong>${reservation.room_type}</strong> 
		                            <span style="display: block; padding-left: 20px; font-size: 18px;">
		                                ${reservation.check_in_date} - ${reservation.check_out_date} • 1박
		                            </span> 
		                            <b>예약 상세 &gt;</b>
		                        </a> 
		                        <p class="btn_re">
		                            <%-- <a href="<%= ctxPath%>/reservation/reservation.gc?acom_name=${reservation.acom_name}&room_type=${reservation.room_type}&price=${reservation.price}&send_date_bak=${send_date_bak}&check_in_date=${reservation.check_in_date}&check_out_date=${reservation.check_out_date}"> 다시 예약 </a> --%>
		                       <a href="<%= ctxPath%>/reservation/reservation.gc?acom_name=${reservation.acom_name}&room_type=${reservation.room_type}&price=${reservation.price}&check_in_date=${reservation.check_in_date}&check_out_date=${reservation.check_out_date}"> 다시 예약 </a>
		                       
		                        </p>
		                    </div>
		                </li>
		            </ul>
		        </c:if>
		    </c:forEach>
		</section>
		
		
		<%-- <c:if test="">
		
		<section class="list_cancel">
			<h3 class="liti">이용 내역</h3> 
			<ul class="list_wrap"></ul>
		</section> 
		
		</c:if>
		
		<c:if test="">
		
		<section class="list_cancel">
			<h3 class="liti">취소 내역</h3> 
			<ul class="list_wrap">
				<li class="reservation-detail">
					<div class="reserve-div">
						<input type="hidden" name="member_id" id="member_id" value="${sessionScope.loginuser.member_id}">
						<button  type="button" data-order-number="23052314010DCAYE1" data-target-list="canceledList" class="btn_del">
        				삭제
    					</button> 
    					<p class="pic">
    						<img  loading="lazy" srcset="https://image.goodchoice.kr/resize_354x184/adimg_new/779/203463/71325338f503e141b7d061d0eeb01053.jpg, https://image.goodchoice.kr/resize_531x276/adimg_new/779/203463/71325338f503e141b7d061d0eeb01053.jpg 1.5x , https://image.goodchoice.kr/resize_708x368/adimg_new/779/203463/71325338f503e141b7d061d0eeb01053.jpg 2x" src="https://image.goodchoice.kr/resize_354x184/adimg_new/779/203463/71325338f503e141b7d061d0eeb01053.jpg" alt="신촌 라뉘호텔" class="align">
    					</p> 
    					<a href="<%= ctxPath%>/reservation-detail.gc" class="product-title">
    						<i class="bg_w">예약취소</i> 
    						<strong>신촌 라뉘호텔</strong> 
    						<span style="display: block; padding-left: 20px; font-size: 18px;">
						    	05.26 금
						    		-
						    	05.27 토
						        •
						        1박
        					</span> 
        					<b>예약 상세 &gt;</b>
        				</a> 
        				<p class="btn_re">
        					<a href="https://www.goodchoice.kr/product/detail?ano=779&amp;adcno=1&amp;sel_date=2023-05-23&amp;sel_date2=2023-05-23"> 다시 예약 </a>
        				</p>
        			</div>
        		</li>
        		<li class="reservation-detail">
        			<div>
        				<button  type="button" data-order-number="23052214003A3AYE1" data-target-list="canceledList" class="btn_del">
        				삭제
    					</button> 
    					<p  class="pic">
    						<img  loading="lazy" srcset="https://image.goodchoice.kr/resize_354x184/affiliate/2023/03/30/642528b949988.jpg, https://image.goodchoice.kr/resize_531x276/affiliate/2023/03/30/642528b949988.jpg 1.5x , https://image.goodchoice.kr/resize_708x368/affiliate/2023/03/30/642528b949988.jpg 2x" src="https://image.goodchoice.kr/resize_354x184/affiliate/2023/03/30/642528b949988.jpg" alt="마리호텔" class="align">
    					</p> 
    					<a  href="/my/reservation-detail/23052214003A3AYE1" class="product-title">
    						<i  class="bg_w">예약취소</i> 
    						<strong >마리호텔</strong> 
    						<span >
					            05.31 수
					            -
					            06.01 목
					            •
					            1박
        					</span> 
        					<b >예약 상세 &gt;</b>
        				</a> 
        				<p  class="btn_re">
        					<a  href="https://www.goodchoice.kr/product/detail?ano=51237&amp;adcno=2&amp;sel_date=2023-05-23&amp;sel_date2=2023-05-23"> 다시 예약 </a>
        				</p>
        			</div>
        		</li>
        		<li class="reservation-detail">
        			<div >
        				<button  type="button" data-order-number="23051518004FDCYE1" data-target-list="canceledList" class="btn_del">
        				삭제
    					</button> 
    					<p  class="pic">
    						<img  loading="lazy" srcset="https://image.goodchoice.kr/resize_354x184/adimg_new/45758/102096/9c990a1dc158985e4437d2cb5312ac0b.jpg, https://image.goodchoice.kr/resize_531x276/adimg_new/45758/102096/9c990a1dc158985e4437d2cb5312ac0b.jpg 1.5x , https://image.goodchoice.kr/resize_708x368/adimg_new/45758/102096/9c990a1dc158985e4437d2cb5312ac0b.jpg 2x" src="https://image.goodchoice.kr/resize_354x184/adimg_new/45758/102096/9c990a1dc158985e4437d2cb5312ac0b.jpg" alt="명동 New Stay inn" class="align">
    					</p> 
    					<a  href="/my/reservation-detail/23051518004FDCYE1" class="product-title">
    						<i  class="bg_w">예약취소</i> 
    						<strong >명동 New Stay inn</strong> 
    						<span >
					            05.26 금
					            -
					            05.26 금
					            •
								대실
        					</span> 
        					<b >예약 상세 &gt;</b>
        				</a> 
        				<p  class="btn_re">
        					<a  href="https://www.goodchoice.kr/product/detail?ano=45758&amp;adcno=1&amp;sel_date=2023-05-23&amp;sel_date2=2023-05-23"> 다시 예약 </a>
        				</p>
        			</div>
        		</li>
        	</ul>
		</section>
		</c:forEach>
		</c:if> --%>
	</div>
</div>