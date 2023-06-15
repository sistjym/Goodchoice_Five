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
	 /* 
	 @Override 
	 public ReservationVO getReservcount(Map<String, String>paraMap) { 
		 
		 ReservationVO reservcount = sqlsession.selectOne("detail.getReservcount", paraMap); 
		 
		 return reservcount; 
		 
	 }
	 */

}
