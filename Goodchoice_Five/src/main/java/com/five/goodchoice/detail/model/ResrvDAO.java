package com.five.goodchoice.detail.model;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class ResrvDAO implements InterResrvDAO {

	
	@Resource
	private SqlSessionTemplate sqlsession;
	
	// 예약 리스트 불러오기
	@Override
	public List<ReservationVO> getReservationList(Map<String, String> paraMap) {
		List<ReservationVO> reservationList = sqlsession.selectList("detail.getReservationList", paraMap);
		return reservationList;
	}

}
