package com.five.goodchoice.detail.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.five.goodchoice.detail.model.InterRoomDAO;

@Service
public class RoomSerivce implements InterRoomSerivce {
	
	@Autowired
	private InterRoomDAO rdao;
	
	
	// acom_no에 해당하는 객실의 정보 가져오기
	@Override
	public List<Map<String, String>> show_roomList(Map<String, String> paraMap) {
		List<Map<String, String>> roomList = rdao.show_roomList(paraMap);
		return roomList;
	}
}
