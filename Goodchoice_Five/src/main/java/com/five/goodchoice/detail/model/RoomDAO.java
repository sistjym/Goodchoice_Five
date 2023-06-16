package com.five.goodchoice.detail.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class RoomDAO implements InterRoomDAO {
	
	@Resource
	private SqlSessionTemplate sqlsession;
	
	// 객실 리스트 불러오기
	@Override
	public List<RoomVO> getRoomList(Map<String, String> paraMap) {
		List<RoomVO> roomList = sqlsession.selectList("detail.getRoomList", paraMap);
		return roomList;
	}
	
	
/*	
	// acom_no에 해당하는 각 객실의 추가이미지 가져오기
	@Override
	public ArrayList<RoomVO> getRoomOne(Map<String, String> paraMap) {
		ArrayList<RoomVO> roomOne = sqlsession.selectOne("detail.getRoomOne", paraMap);
		return roomOne;
	}
*/
	@Override
	public List<RoomVO> getRoom_addImageList(Map<String, String> paraMap) {
		List<RoomVO> room_addImageList = sqlsession.selectList("detail.getRoom_addImageList", paraMap);
		return room_addImageList;
	}


	
	

}
