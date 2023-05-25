package com.five.goodchoice.model.service;

import java.util.List;

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

}
