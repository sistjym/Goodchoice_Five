package com.five.goodchoice.mypage.service;

import java.util.List;
import java.util.Map;

import com.five.goodchoice.detail.model.RoomVO;
import com.five.goodchoice.member.model.MemberVO;
import com.five.goodchoice.mypage.model.ReservationVO;

public interface InterMypageService {

	List<ReservationVO> getAllReservations();

	int nickEdit(Map<String, String> paraMap);

	int reservNameEdit(Map<String, String> paraMap);

	int pwdUpdate(Map<String, String> paraMap);

}
