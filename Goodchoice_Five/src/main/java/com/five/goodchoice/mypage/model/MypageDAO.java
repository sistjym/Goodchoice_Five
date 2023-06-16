package com.five.goodchoice.mypage.model;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.five.goodchoice.member.model.MemberVO;

@Repository
public class MypageDAO implements InterMypageDAO {

	@Resource
	private SqlSessionTemplate sqlsession;

	@Override
	public List<ReservationVO> getAllReservations() {
		List<ReservationVO> getAllReservations = sqlsession.selectList("myreservation.getAllReservations");
        return getAllReservations;
    }

	@Override
	public int nickEdit(Map<String, String> paraMap) {
		
		int n = sqlsession.update("myreservation.nickEdit", paraMap);
		return n;
	}

	@Override
	public int reservNameEdit(Map<String, String> paraMap) {
		int n = sqlsession.insert("myreservation.reservNameEdit", paraMap);
		return n;
	}

	@Override
	public int pwdUpdate(Map<String, String> paraMap) {
		int n = sqlsession.update("myreservation.pwdUpdate", paraMap);
		return n;
	}

	
	

}
