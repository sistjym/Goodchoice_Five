<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
				
		<section class="btn_wrap_width_3">
			<button type="button" class="top_sort_btn btn btn-outline-none rounded my-2" onclick="">거리 순</button>
			<button type="button" class="top_sort_btn btn btn-outline-none rounded my-2" onclick="">낮은 가격 순</button>
			<button type="button" class="top_sort_btn btn btn-outline-none rounded my-2" onclick="">높은 가격 순</button>
		</section>
					
		<section id="list">			
			<section class="list-wrap">
			
				<ul>
					<li onclick="javascript:location.href='#'">
						<div class="room-img">
							<img src="<%= request.getContextPath()%>/resources/images/강남캠퍼스.jpg" alt=""/>
						</div>
						<div class="room-info">
							<div class="name p-4">
								<strong>강남 캠퍼스</strong>
								<p class="score">
									<strong class="badge badge-warning" style="color:#faeae3; position:relative; bottom:2px;">9.5</strong>
									<span>추천해요</span>
									(2670)
								</p>
								<p class="h5 bold font-weight-bold">강남구 역삼동</p>
							</div>
							
							<div class="price">
								<small>숙박</small>
								<span class="sale_badge badge badge-secondary">예약특가</span>
								<b>140,000원</b>
							</div>
							
						</div>
					</li>
					<li onclick="javascript:location.href='#'">
						<div class="room-img">
							<img src="<%= request.getContextPath()%>/resources/images/강남캠퍼스.jpg" alt=""/>
						</div>
						<div class="room-info">
							<div class="name p-4">
								<strong>강남 캠퍼스</strong>
								<p class="score">
									<strong class="badge badge-warning" style="color:#faeae3; position:relative; bottom:2px;">9.5</strong>
									<span>추천해요</span>
									(2670)
								</p>
								<p class="h5 bold font-weight-bold">강남구 역삼동</p>
							</div>
							
							<div class="price">
								<small>숙박</small>
								<span class="sale_badge badge badge-secondary">예약특가</span>
								<b>140,000원</b>
							</div>
							
						</div>
					</li>
					<li onclick="javascript:location.href='#'">
						<div class="room-img">
							<img src="<%= request.getContextPath()%>/resources/images/강남캠퍼스.jpg" alt=""/>
						</div>
						<div class="room-info">
							<div class="name p-4">
								<strong>강남 캠퍼스</strong>
								<p class="score">
									<strong class="badge badge-warning" style="color:#faeae3; position:relative; bottom:2px;">9.5</strong>
									<span>추천해요</span>
									(2670)
								</p>
								<p class="h5 bold font-weight-bold">강남구 역삼동</p>
							</div>
							
							<div class="price">
								<small>숙박</small>
								<span class="sale_badge badge badge-secondary">예약특가</span>
								<b>140,000원</b>
							</div>
						</div>
					</li>	
				</ul>

			</section>
			
			

		</section>