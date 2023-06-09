package com.five.goodchoice.detail.model;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class RoomDAO implements InterRoomDAO {
	
	@Resource
	private SqlSessionTemplate sqlsession;
	
	// acom_no에 해당하는 객실의 정보 가져오기
	@Override
	public List<Map<String, String>> show_roomList(Map<String, String> paraMap) {
		List<Map<String, String>> roomList = sqlsession.selectList("detail.show_roomList");
		return roomList;
	}

}
