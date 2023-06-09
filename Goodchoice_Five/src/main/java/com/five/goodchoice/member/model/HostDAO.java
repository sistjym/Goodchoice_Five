package com.five.goodchoice.member.model;

import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class HostDAO implements InterHostDAO {

	@Resource
	private SqlSessionTemplate sqlsession; // 로컬 DB mymvc_user에 연결 
	// Type 에 따라 Spring 컨테이너가 알아서 root-context.xml 에 생성된 org.mybatis.spring.SqlSessionTemplate 의  sqlsession bean 을  sqlsession 에 주입시켜준다. 
    // 그러므로 sqlsession 는 null 이 아니다.
	
	// 사업자번호 중복체크
	@Override
	public boolean checkDuplicateBusinessNum(String business_id) {
		int result = sqlsession.selectOne("host.checkDuplicateBusinessNum", business_id);
		return (result ==1);
	}
	
    // 업주회원 가입
	@Override
	public boolean gohostRegister(Map<String, String> paraMap) {
		int result = sqlsession.insert("host.gohostRegister", paraMap);
		return (result==1);
	}
	
	
	// 지역구번호 알아오기
	@Override
	public int getDistrictno(Map<String, String> paraMap) {
	  int n = sqlsession.selectOne("host.getDistrictno", paraMap);
	
	  return n;
	}
	
	
	// 숙소테이블에 insert
	@Override
	public int acomoRegister(Map<String, String> paraMap) {
		int n = sqlsession.insert("host.acomoRegister", paraMap);
		return n;
	}
	
	
	
	/*
	 * // 숙소번호 알아오기
	 * 
	 * @Override public int getAcomNo(Map<String, String> paraMap) { int n =
	 * sqlsession.selectOne("host.getAcomNo", paraMap); return n; }
	 */
	
	
	// 숙소추가이미지
	@Override
	public int addAcomoImage(Map<String, Object> fileMap) {

		int n = sqlsession.insert("host.addAcomoImage", fileMap);
		return n;
	}
	
	
	// 객실 테이블에 insert
	@Override
	public int roomRegister(Map<String, String> paraMap) {
		int n = sqlsession.insert("host.roomRegister", paraMap);
		return n;
	}
	
	// 객실추가이미지
	@Override
	public void addRoomImage(Map<String, Object> fileMap1) {
		sqlsession.insert("host.addRoomImage", fileMap1);
		
	}
	
	
	// 공용시설추가
	@Override
	public int insertpublicServices(Map<String, Object> numMap) {
		int n = sqlsession.insert("host.insertpublicServices", numMap);  
		return n;
	}
	
	
	
}
