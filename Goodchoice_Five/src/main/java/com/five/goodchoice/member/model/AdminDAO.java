package com.five.goodchoice.member.model;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class AdminDAO implements InterAdminDAO {
	
	@Resource
	private SqlSessionTemplate sqlsession; // 로컬 DB mymvc_user에 연결 
	// Type 에 따라 Spring 컨테이너가 알아서 root-context.xml 에 생성된 org.mybatis.spring.SqlSessionTemplate 의  sqlsession bean 을  sqlsession 에 주입시켜준다. 
    // 그러므로 sqlsession 는 null 이 아니다.
	
	
	// 모든 숙소 보여주기 
	@Override
	public List<Map<String, String>> getAcommList(Map<String, Object> paraMap) {
		List<Map<String, String>> acommList = sqlsession.selectList("admin.getAcommList",paraMap);
		return acommList;
	}

	// 카테고리 리스트 가져오기 
	@Override
	public List<String> categoryNameList() {
		List<String> categoryList = sqlsession.selectList("admin.categoryNameList");
		return categoryList;
	}

	// 분류 리스트 가져오기 
	@Override
	public List<String> specNameList() {
		List<String> specList = sqlsession.selectList("admin.specNameList");
		return specList;
	}
	
	// 모든 호스트 가져오기 
	@Override
	public List<Map<String, String>> getHostList(Map<String, Object> paraMap) {
		List<Map<String, String>> hostList = sqlsession.selectList("admin.getHostList",paraMap);
		return hostList;
	}
	
	// 호스트 권한 업데이트 하기 
	@Override
	public int updatePermission(Map<String, String> paraMap) {
		int n = sqlsession.update("admin.updatePermission", paraMap);
		return n;
	}

	// 숙소 등록 허용하기 
	@Override
	public int updatePermissionAcomm(Map<String, String> paraMap) {
		int n = sqlsession.update("admin.updatePermissionAcomm", paraMap);
		return n;
	}
	
	
}
