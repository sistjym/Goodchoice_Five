package com.five.goodchoice.detail.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.five.goodchoice.detail.model.InterResrvDAO;
import com.five.goodchoice.detail.model.ReservationVO;

@Service
public class ResrvService implements InterResrvSerivce {
	
	@Autowired
	private InterResrvDAO resrv_dao;
	/*
	// 예약 리스트 불러오기
	@Override
	public ReservationVO getReservcount(Map<String, String> paraMap) {
		ReservationVO reservcount = resrv_dao.getReservcount(paraMap);
		return reservcount;
	}
*/
}
