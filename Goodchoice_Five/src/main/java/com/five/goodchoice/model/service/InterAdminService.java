package com.five.goodchoice.model.service;

import java.util.List;

public interface InterAdminService {
	
	//권한을 승인하길 기다리는 모든 호스트를 보여주기 
	List<String> HostList();

}
