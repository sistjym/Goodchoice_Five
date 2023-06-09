<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String ctxPath = request.getContextPath();
%>


<script type="text/javascript">
	$(document).ready(function() {
		
		
	});
	
	function handleReviewWriteButtonClick() {
        // reviewRegister 페이지로 이동
        window.location.href = "/reviewRegister.gc";
    }

    // 버튼 클릭 이벤트 리스너 등록
    document.getElementById("reviewWriteButton").addEventListener("click", handleReviewWriteButtonClick);
	
</script>

<!-- if문으로 예약 내역, 이용 내역, 취소 내역 각각 처리-->

<div class="align_rt">
	<div class="reserve_detail">
	<c:forEach var="reservation" items="${requestScope.reservationList}">
		<c:if test="${reservation.reserv_id != null && reservation.reserv_id == requestScope.reserv_id}">
			<div class="info" >
				<img src="<%= request.getContextPath()%>/resources/images/${fn:replace(reservation.acom_name,' ','')}.jpg"/>
				<div>
					<i class="bg_w">예약내역</i> 
					<strong style="font-weight: normal; display: block; margin-bottom: 9px; font-size: 24px; color: rgba(0, 0, 0, 0.87);">${reservation.acom_name}</strong> 
					<span style="margin-bottom: 9px; display: block; font-size: 20px; color: rgba(0, 0, 0, 0.87);" >
						${reservation.check_in_date} - ${reservation.check_out_date} • 1박
					</span>
				</div>
			</div> 
		
			<section>
				<div>
					<p>
						<strong class="sec-str">예약번호</strong>
						${reservation.reserv_id}
					</p>
					<p>
						<strong class="sec-str">예약자 이름</strong>
						${reservation.reserv_person}
					</p> 
				</div> 
				<div class="total">
					<div class="payment-info-pc">
						<div class="payment-info-pc__top">
							<div class="title-container">
								<p class="payment-info-pc__title">
									결제정보
								</p> 
								<p class="payment-info-pc__caption">
									* 거래내역서는 예약 확정 후 제공돼요.
								</p>
							</div> 
							<div class="payment-info-pc__receipt">
								<button type="button" class="base-button">
									영수증
								</button> 
								<button type="button" class="base-button">
									거래내역서
								</button>
							</div>
						</div> 
						<div class="payment-info-pc__bottom">
							<p>
								<strong class="sec-str">예약취소 금액</strong>
							</p> 
							<p>
								<b style="font-weight: bold; color: rgb(230, 28, 81);">${reservation.price}원</b>
							</p>
						</div>
					</div>
				</div>
			</section> 

			<section>
				<!-- 예약내역 작성 시 추가
				<div class="reservation-cancel">
					<button type="button" class="base-button">예약취소</button>
				</div>
				 -->
				
				<!-- 이용내역 작성 시 추가 -->
				<div class="reserve-review-write">
					<button type="button" class="base-button" id="reviewWriteButton">리뷰작성</button>
				</div>

			</section>
		</c:if>
	</c:forEach>
</div>
</div>