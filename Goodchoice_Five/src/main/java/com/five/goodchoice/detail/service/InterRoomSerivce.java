package com.five.goodchoice.detail.service;

import java.util.List;
import java.util.Map;

public interface InterRoomSerivce {
	
	// acom_no에 해당하는 객실의 정보 가져오기
	List<Map<String, String>> show_roomList(Map<String, String> paraMap);

}
