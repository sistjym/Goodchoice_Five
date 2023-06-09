package com.five.goodchoice.member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.five.goodchoice.common.Sha256;
import com.five.goodchoice.member.model.MemberVO;
import com.five.goodchoice.model.service.InterHostService;

@Controller
public class HostController {

	@Autowired  //  TYPE 에 따라서 , SPRING 에서 알아서 BEAN 을 주입 해준다.
	private InterHostService service ;
	
	
	// 사업자등록 중복 유무 검사
	@ResponseBody
	@RequestMapping(value="/checkDuplicateBusinessNum.gc", method = {RequestMethod.POST}) 
	public String checkDuplicateBusinessNum(HttpServletRequest request){
		
		
		String business_id = request.getParameter("business_id");
		boolean isExists = service.checkDuplicateBusinessNum(business_id);
		
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("isExists", isExists);
		
			
		return jsonObj.toString();

	}
	
	// 업주회원가입 
	@RequestMapping(value="/gohostRegister.gc", method = {RequestMethod.POST}) 
	public ModelAndView gohostRegister(ModelAndView mav, HttpServletRequest request){
		
		String email = request.getParameter("email");
		String pwd = request.getParameter("pwd");
		String business_id = request.getParameter("business_id");
		String onerName = request.getParameter("onerName");
		String companyName = request.getParameter("companyName");
		
		Map<String, String> paraMap = new HashMap<>();
		paraMap.put("email", email);
		paraMap.put("pwd", Sha256.encrypt(pwd));
		paraMap.put("business_id", business_id);
		paraMap.put("onerName", onerName);
		paraMap.put("companyName", companyName);
		
		String message ="";
		String loc = "";
		
		if(service.gohostRegister(paraMap)) {
			 message = "호스트로 회원가입에 성공 했습니다.";
			 loc = request.getContextPath() + "/memberLogin.gc";
		}
		
		else {
			message = "회원가입에 실패 했습니다.";
			loc = "javascript:history.back()";
		}
		
		mav.addObject("message", message);
		mav.addObject("loc", loc);
		
		mav.setViewName("msg");
		
		
		return mav;
	}
	
	
	// 업소 등록
	@RequestMapping(value="/hostRegister.gc") 
	public String hostRegister() {
		return "host/accommodations_register.tiles3";
	}
	
	
	// 업소 정보 수정
	@RequestMapping(value="/hostEdit.gc") 
	public String hostEdit() {
		return "host/accommodations_edit.tiles3";
	}
	
	
	
}
