package com.five.goodchoice.detail.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.five.goodchoice.detail.model.InterRoomDAO;
import com.five.goodchoice.detail.model.RoomVO;

@Service
public class RoomSerivce implements InterRoomSerivce {
	
	@Autowired
	private InterRoomDAO rdao;
	
	// 객실 리스트 불러오기
	@Override
	public List<RoomVO> getRoomList(Map<String, String> paraMap) {
		List<RoomVO> roomList = rdao.getRoomList(paraMap);
		return roomList;
	}
/*	
	// acom_no에 해당하는 각 객실의 추가이미지 가져오기
	@Override
	public ArrayList<RoomVO> getRoomOne(Map<String, String> paraMap) {
		ArrayList<RoomVO> roomOne = rdao.getRoomOne(paraMap);
		return roomOne;
	}

	@Override
	public List<String> getRoom_addImageList(String room_id) {
		List<String> room_addImageList = rdao.getRoom_addImageList(room_id);
		return room_addImageList;
	}
*/

	

	
}
