package com.five.goodchoice.member.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.five.goodchoice.model.service.InterAdminService;



@Controller
public class AdminController {
	@Autowired
	private InterAdminService service;

    // 관리자 페이지 승인 부분
	@RequestMapping(value="/host_approve.gc") 
	public String host_approve() {
		
		List<String> hostList = service.HostList();
		
		
		return "admin/host_approve.tiles3";
	}
	
	// 관리자 모든 숙소 보기
	@RequestMapping(value="/showAllAcomm.gc") 
	public String showAllAcomm() {
		return "admin/showAllAcomm.tiles3";
	}
	
	// 관리자 모든 회원 보기
	@RequestMapping(value="/showAllMember.gc") 
	public String showAllMember() {
		return "admin/showAllMember.tiles3";
	}
	
	
	
	
	
	
	
	
		
}
