<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<script type="text/javascript">

	$(document).ready(function(){
		
	
	});// end of ready() -------------------------------------------------------------------------------------
 
</script>    
			
					
		<section id="list">			
			<section class="list-wrap">
			
				<c:if test="${empty requestScope.acomListByProvNo}">
					<div style="text-align: left; margin-top: 70px ;">검색조건에 맞는 숙소가 없습니다.</div>
				</c:if>
				<ul>					
					<c:if test="${!empty requestScope.acomListByProvNo}">
						
					
						<c:forEach var="acom" items="${requestScope.acomListByProvNo}">
							<li onclick="javascript:location.href='<%=request.getContextPath()%>/details/detail.gc?acom_no=${acom.acom_no}&category_no=2&check_in_date=${filter_condition_Map.check_in_date}&check_out_date=${filter_condition_Map.check_out_date}'">
								<div class="room-img">
									<img src="<%= request.getContextPath()%>/resources/images/${fn:replace(acom.acom_name,' ','')}.jpg" alt="" height="300"/>
									<!-- TODO. 숙소 이름을 공백을 제거한 다음 .jpg 를 붙여 이미지를 완성해야 한다. -->
								</div>
								<div class="room-info">
									<div class="name p-4">
										<strong>${acom.acom_name}</strong>
										<p class="score">
											<strong class="badge badge-warning" style="color:#faeae3; position:relative; bottom:2px;">${acom.rating_avg}</strong>
											<span>
												<c:choose>
													<c:when test="${acom.rating_avg >= 9.0}">
														추천해요
													</c:when>
													<c:when test="${acom.rating_avg < 9.0 && acom.rating_avg >= 8.0}">
														훌륭해요
													</c:when>
													<c:when test="${acom.rating_avg < 8.0 && acom.rating_avg >= 7.0}">
														좋아요
													</c:when>
													<c:otherwise>
														글쎄요
													</c:otherwise>												
												</c:choose> 										
											</span>
											(${acom.rating_cnt})
										</p>
										<p class="h5 bold font-weight-bold text-white">${acom.address}</p>
									</div>
									
									<div class="price">
										<small>숙박</small>
										<span class="sale_badge badge badge-secondary">예약특가</span>
										<b><fmt:formatNumber value="${acom.price}" pattern="#,###"/>원</b>
									</div>
									
								</div>
							</li>
						</c:forEach>
					</c:if>
				</ul>

			</section>
			
			

		</section>