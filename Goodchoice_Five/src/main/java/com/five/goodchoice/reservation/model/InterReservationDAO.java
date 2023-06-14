package com.five.goodchoice.reservation.model;

import java.util.Map;

public interface InterReservationDAO {

	// 결제가 성공적으로 이루어지면 예약테이블에 정보 넣기 
	int insertReservationInfo(Map<String, String> paraMap);

	// 사용한 초인트 뻬고 적립될 포인트 더하기
	int updatePoint(Map<String, String> paraMap);

}
