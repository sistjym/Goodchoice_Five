package com.five.goodchoice.mypage.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.five.goodchoice.detail.model.RoomVO;
import com.five.goodchoice.member.model.MemberVO;
import com.five.goodchoice.mypage.model.InterMypageDAO;
import com.five.goodchoice.mypage.model.ReservationVO;

@Service
public class MypageService implements InterMypageService {

	@Autowired  // Type 에 따라 알아서 Bean 을 주입해준다.
	private InterMypageDAO dao;


	public List<ReservationVO> getAllReservations() {
		List<ReservationVO> getAllReservations = dao.getAllReservations();
	    return getAllReservations;
	}


	@Override
	public int nickEdit(Map<String, String> paraMap) {
		
		int n = dao.nickEdit(paraMap);
		
		return n;
	}


	@Override
	public int reservNameEdit(Map<String, String> paraMap) {
		
		int n = dao.reservNameEdit(paraMap);
		
		return n;
	}


	@Override
	public int pwdUpdate(Map<String, String> paraMap) {
		
		int n = dao.pwdUpdate(paraMap);
		
		return n;
	}
	
	
}
