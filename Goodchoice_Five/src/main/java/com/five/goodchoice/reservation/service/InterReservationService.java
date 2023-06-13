package com.five.goodchoice.reservation.service;

import java.util.Map;

public interface InterReservationService {

	// 결제가 성공적으로 이루어지면 예약테이블에 정보 넣기 
	int insertReservationInfo(Map<String, String> paraMap);

}
