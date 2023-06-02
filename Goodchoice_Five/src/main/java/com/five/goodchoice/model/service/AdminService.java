package com.five.goodchoice.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.five.goodchoice.member.model.InterAdminDAO;


@Service
public class AdminService implements InterAdminService {

	@Autowired
	 private InterAdminDAO dao;
	
	
	//권한을 승인하길 기다리는 모든 호스트를 보여주기 
	@Override
	public List<String> HostList() {
		
		return null;
	}
	
	// 모든 숙소 보여주기 
	@Override
	public List<Map<String, String>> getAcommList(Map<String, Object> paraMap) {
		List<Map<String, String>> acommList = dao.getAcommList(paraMap);
		return acommList;
	}

	// 카테고리 리스트 가져오기 
	@Override
	public List<String> categoryNameList() {
		List<String> categoryList = dao.categoryNameList();
		return categoryList;
	}

	// 분류 리스트 가져오기 
	@Override
	public List<String> specNameList() {
		List<String> specList = dao.specNameList();
		return specList;
	}

	@Override
	public List<Map<String, String>> getHostList(Map<String, Object> paraMap) {
		List<Map<String, String>> hostList = dao.getHostList(paraMap);
          
		return hostList;
	}

	@Override
	public int updatePermission(Map<String, String> paraMap) {
		int n = dao.updatePermission(paraMap);
		return n;
	}
 
}
