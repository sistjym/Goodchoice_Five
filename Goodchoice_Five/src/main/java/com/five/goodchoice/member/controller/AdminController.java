package com.five.goodchoice.member.controller;

import org.springframework.web.bind.annotation.RequestMapping;

public class AdminController {

    // 관리자 페이지 승인 부분
	@RequestMapping(value="/host_approve.gc") 
	public String host_approve() {
		
		
		
		
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
