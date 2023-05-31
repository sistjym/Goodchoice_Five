package com.five.goodchoice.member.controller;
import javax.servlet.http.HttpServletRequest;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.five.goodchoice.member.model.MemberVO;
import com.five.goodchoice.model.service.InterMemberService;



@Controller
public class MemberController {

	@Autowired  //  TYPE 에 따라서 , SPRING 에서 알아서 BEAN 을 주입 해준다.
	private InterMemberService service ;
	@Autowired
//	private JavaMailSender mailSender;
	
	/*
	 * @RequestMapping(value="/test/test_select.gc") // DB 연결 잘 되는지 확인해보는 public
	 * String test_select(HttpServletRequest request) {
	 * 
	 * MemberVO mvo = service.test_select();
	 * 
	 * request.setAttribute("mvo", mvo); return "test/test_select"; }
	 */
	
	
	// 로그인
	@RequestMapping(value="/memberLogin.gc") 
	public String memberLogin() {
		
		return "member/memberLogin";
	}
	
	// 회원가입
	@RequestMapping(value="/memberRegister.gc") 
	public String memberRegister() {
		
		return "member/memberRegister";
	}

	// 비밀번호 재설정
	@RequestMapping(value="/passwdEditforCheck.gc") 
	public String passwdEditforCheck() {
		
		return "member/passwdEditforCheck";
	}
	
	// 이메일 중복 유무 검사
	@ResponseBody
	@RequestMapping(value="/checkDuplicateEmail.gc", method = {RequestMethod.POST}) 
	public String checkDuplicateEmail(HttpServletRequest request){
		
		
		String email = request.getParameter("email");
			boolean isExists = service.checkDuplicateEmail(email);
			
			JSONObject jsonObj = new JSONObject();
			jsonObj.put("isExists", isExists);
		
		System.out.println(isExists);	
			
		return jsonObj.toString();
		
	}
}
