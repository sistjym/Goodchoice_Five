package com.five.goodchoice.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.five.goodchoice.member.service.InterAdminService;

@Controller
public class IndexController {

	
	@	RequestMapping(value="/") //	http://localhost:9090/goodchoice/
	public ModelAndView home ( ModelAndView mav) {
		
		mav.setViewName("redirect:/index.gc");		
		return mav ;
	}
		
	@	RequestMapping(value="/index.gc")//   http://localhost:9090/goodchoice/index.gc  로 검색해보세요
	public ModelAndView index ( ModelAndView mav) {
		mav.setViewName("index");		
		return mav ;
	}

	@RequestMapping(value="/test/tiles_test_1.gc") // tiles test 입니다.
	public String tiles_test_1() {
		
		return "tile_test.tiles1";
	}
	
	@RequestMapping(value="/test/tiles_test_2.gc") 
	public String tiles_test_2() {
		return "product/content.tiles2";
	}
	
	@RequestMapping(value="/test/tiles_test_3.gc") // tiles2 
	public String tiles_test_3() {
		return "test/test.tiles2";
	}
	
	// 메인용 
	
	
	
	/*
	 * @RequestMapping(value="/main/home.gc") // tiles test 입니다. public String
	 * main(HttpServletRequest request) {
	 * 
	 * return "main/home.tiles1" ; // /WEB-INF/views/tiles1/{1}/{2}.jsp }
	 * 
	 * }
	 */
	 
	  
	  
	@RequestMapping(value="/my/page.gc") 
	public String my_page_1() {
		return "my/page.tiles2";
	}
	@RequestMapping(value="/my/point.gc") 
	public String my_page_2() {
		return "my/point.tiles2";
	}
	
	// 업소 등록
/*	
    @RequestMapping(value="/hostRegister.gc") 
	public String hostRegister() {
		return "host/accommodations_register.tiles3";
	}
	*/
	
	/*
	 * // 관리자 페이지 승인 부분
	 * 
	 * @RequestMapping(value="/host_approve.gc") public String host_approve() {
	 * return "admin/host_approve.tiles3"; } // 관리자 모든 숙소 보기
	 * 
	 * @RequestMapping(value="/showAllAcomm.gc") public String showAllAcomm() {
	 * return "admin/showAllAcomm.tiles3"; } // 관리자 모든 회원 보기
	 * 
	 * @RequestMapping(value="/showAllMember.gc") public String showAllMember() {
	 * return "admin/showAllMember.tiles3"; }
	 */
	
	// 업소 정보 수정
/*	
	@RequestMapping(value="/hostEdit.gc") 
	public String hostEdit() {
		return "host/accommodations_edit.tiles3";
	}
*/	
	
}

