package com.five.goodchoice.mypage.model;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class MypageDAO implements InterMypageDAO {

	@Resource
	private SqlSessionTemplate sqlsession;

	@Override
	public List<ReservationVO> getAllReservations() {
		List<ReservationVO> getAllReservations = sqlsession.selectList("myreservation.getAllReservations");
        return getAllReservations;
    }

	
	

}
