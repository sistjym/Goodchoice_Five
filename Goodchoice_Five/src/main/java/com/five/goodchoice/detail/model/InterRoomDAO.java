package com.five.goodchoice.detail.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public interface InterRoomDAO {
	
	// 객실 리스트 불러오기
	List<RoomVO> getRoomList(Map<String, String> paraMap);
/*	
	// acom_no에 해당하는 각 객실의 추가이미지 가져오기
	ArrayList<RoomVO> getRoomOne(Map<String, String> paraMap);
*/	
	List<RoomVO> getRoom_addImageList(Map<String, String> paraMap);




}
