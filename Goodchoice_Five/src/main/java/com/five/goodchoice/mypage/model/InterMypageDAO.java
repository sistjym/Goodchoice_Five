package com.five.goodchoice.mypage.model;

import java.util.List;
import java.util.Map;

import com.five.goodchoice.detail.model.RoomVO;
import com.five.goodchoice.member.model.MemberVO;

public interface InterMypageDAO {

	List<ReservationVO> getAllReservations();

	int nickEdit(Map<String, String> paraMap);

	int reservNameEdit(Map<String, String> paraMap);

	int pwdUpdate(Map<String, String> paraMap);


}
