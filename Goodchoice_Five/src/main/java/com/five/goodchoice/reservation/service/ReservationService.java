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
	
}
