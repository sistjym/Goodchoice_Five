package com.five.goodchoice.reservation.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.five.goodchoice.reservation.model.InterReservationDAO;
@Service
public class ReservationService implements InterReservationService {

	@Autowired
	 private InterReservationDAO dao;
	
	// 결제가 성공적으로 이루어지면 예약테이블에 정보 넣기 
	@Override
	public int insertReservationInfo(Map<String, String> paraMap) {
		int n = dao.insertReservationInfo(paraMap);
		return n;
	}

	// 사용한 초인트 뻬고 적립될 포인트 더하기
	@Override
	public int updatePoint(Map<String, String> paraMap) {
		int n = dao.updatePoint(paraMap);
		return n;
	}

	
	
	
}
