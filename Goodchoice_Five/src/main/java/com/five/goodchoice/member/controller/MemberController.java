package com.five.goodchoice.member.controller;
import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.five.goodchoice.common.AES256;
import com.five.goodchoice.common.GoogleMail;
import com.five.goodchoice.common.Sha256;
import com.five.goodchoice.member.model.HostVO;
import com.five.goodchoice.member.model.MemberVO;
import com.five.goodchoice.model.service.InterMemberService;



@Controller
public class MemberController {
	
	@Autowired
	private AES256 aes;
	
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
	
	// 비밀번호 재설정
	@RequestMapping(value="/passwdEdit.gc") 
	public String passwdEdit(HttpServletRequest request) {
		String email = request.getParameter("email");
		request.setAttribute("email", email);
		return "member/passwdEdit";
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
		
		return jsonObj.toString();
		
	}
	
	@RequestMapping(value="/gomemberRegister.gc", method = {RequestMethod.POST}) 
	public ModelAndView memberRegister(ModelAndView mav, HttpServletRequest request){
		
		String email = request.getParameter("email");
		String pwd = request.getParameter("pwd");
		String nickname = request.getParameter("nickname");
		
		// System.out.println("이메일: " +email);
		
		Map<String, String> paraMap = new HashMap<>();
		paraMap.put("email", email);
		paraMap.put("pwd", Sha256.encrypt(pwd));
		paraMap.put("nickname", nickname);
		
		String message ="";
		String loc = "";
		
		if(service.registerMember(paraMap)) {
			request.setAttribute("email", email);
			request.setAttribute("pwd", pwd);
			
			message = "회원가입에 성공 했습니다.";
			loc = request.getContextPath() + "/main/home.gc";
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
	
	
	@RequestMapping(value="/loginMember.gc" , method = {RequestMethod.POST})
	public ModelAndView loginMember(ModelAndView mav, HttpServletRequest request) {
	
		String Email = request.getParameter("Email");
		String passwd = request.getParameter("passwd");
		
		// System.out.println("Email : " +Email);
		
		Map<String, String> paraMap = new HashMap<>();
		paraMap.put("Email", Email);
		paraMap.put("passwd", Sha256.encrypt(passwd));
		
		MemberVO loginuser = service.loginMember(paraMap);
		
		// System.out.println("loginuser: " +loginuser);
		
		if(loginuser == null) {	// 로그인 실패시 [존재하지않은 아이디 비번을 입력했을시]
			String message = "아이디 또는 암호가 틀립니다.";
			String loc = "javascript:history.back()";
			
			mav.addObject("message", message);
			mav.addObject("loc", loc);
			
			mav.setViewName("msg");
			// /WEB-INF/views/[접두어]	msg	.jsp[접미어] 해서 /WEB-INF/views/msg.jsp 가된다.
		}
		else {	// 로그인 한지 1년 이내인 경우
			
			HttpSession session = request.getSession();
			// 메모리에 생성되어져 있는 session 을 불러오는 것이다.
			
			session.setAttribute("loginuser", loginuser);
			// session(세션)에 로그인 되어진 사용자 정보인 loginuser 을 키이름을 "loginuser" 으로 저장시켜두는 것이다.
			
			if(loginuser.isRequirePwdChange() == true) {	// 비밀번호를 마지막으로 변경한지 3개월이 지난경우
				
				String message = "비밀번호를 변경하신지 3개월이 경과했습니다.\\n암호를 변경하시는 것을 추천합니다.";
				String loc = request.getContextPath()+"/main/home.gc";
				// 플젝에서(원래)는 위와 같이 index.action 이 아니라 사용자의 암호를 변경해주는 페이지로 잡아주어야 한다.
				
				mav.addObject("message", message);
				mav.addObject("loc", loc);
				
				mav.setViewName("msg");
				// /WEB-INF/views/[접두어]	msg	.jsp[접미어] 해서 /WEB-INF/views/msg.jsp 가된다.
			}
			else {	// 암호를 마지막으로 변경한 것이 3개월 이내인 경우
				// 로그인을 해야만 접근할 수 있는 페이지에 로그인을 하지 않은 상태에서 접근을 시도한 경우 
	            // "먼저 로그인을 하세요!!" 라는 메시지를 받고서 사용자가 로그인을 성공했다라면
	            // 화면에 보여주는 페이지는 시작페이지로 가는 것이 아니라
	            // 조금전 사용자가 시도하였던 로그인을 해야만 접근할 수 있는 페이지로 가기 위한 것이다.
				String goBackURL = (String)session.getAttribute("goBackURL");
				
				if(goBackURL != null) {
					mav.setViewName("redirect:"+goBackURL);
					session.removeAttribute("goBackURL"); // 세션에서 반드시 제거해 주어야 한다.
				}
				
				else {
					mav.setViewName("redirect:/main/home.gc");  // 시작페이지로 이동
				}
				
			}
		
		}
		
		return mav; 
	}
	
	
	// 호스트로 로그인
	@RequestMapping(value="/loginHost.gc" , method = {RequestMethod.POST})
	public ModelAndView loginHost(ModelAndView mav, HttpServletRequest request) {
	
		String Email = request.getParameter("Email");
		String passwd = request.getParameter("passwd");
		
		
		
		Map<String, String> paraMap = new HashMap<>();
		paraMap.put("Email", Email);
		paraMap.put("passwd", Sha256.encrypt(passwd));
		
		HostVO loginuser = service.loginHost(paraMap);
		
		 System.out.println("loginuser: " +loginuser);
		
		if(loginuser == null) {	// 로그인 실패시 [존재하지않은 아이디 비번을 입력했을시]
			String message = "아이디 또는 암호가 틀립니다.";
			String loc = "javascript:history.back()";
			
			mav.addObject("message", message);
			mav.addObject("loc", loc);
			
			mav.setViewName("msg");
			// /WEB-INF/views/[접두어]	msg	.jsp[접미어] 해서 /WEB-INF/views/msg.jsp 가된다.
		}
		else {	// 로그인 한지 1년 이내인 경우
			
			HttpSession session = request.getSession();
			// 메모리에 생성되어져 있는 session 을 불러오는 것이다.
			
			session.setAttribute("loginuser", loginuser);
			// session(세션)에 로그인 되어진 사용자 정보인 loginuser 을 키이름을 "loginuser" 으로 저장시켜두는 것이다.
			
			
			
				String goBackURL = (String)session.getAttribute("goBackURL");
				
				if(goBackURL != null) {
					mav.setViewName("redirect:"+goBackURL);
					session.removeAttribute("goBackURL"); // 세션에서 반드시 제거해 주어야 한다.
				}
				
				else {
					mav.setViewName("redirect:/main/hosthome.gc");  // 시작페이지로 이동
				}
				
			}
		
		
		
		return mav; 
	}
	
	
	// 로그아웃 처리
	@RequestMapping(value="/memberLogout.gc")
	public ModelAndView memberLoout(ModelAndView mav, HttpServletRequest request) {
		
		// 로그아웃시 시작페이지로 돌아가는것임
		HttpSession session = request.getSession();
		
		session.invalidate();
		
		String message = "로그아웃 되었습니다.";
		String loc = request.getContextPath()+"/main/home.gc";
		
		mav.addObject("message", message);
		mav.addObject("loc", loc);
		
		mav.setViewName("msg");
		
		return mav;
	}
	
	
	
	@Autowired	// Type에 따라 알아서 Bean을 주입해준다.
	private GoogleMail mail;
	
	
	@RequestMapping(value="/mailSend.gc", method = {RequestMethod.POST})
	public ModelAndView mailSend(ModelAndView mav, HttpServletRequest request) {
		
		String Email = request.getParameter("Email");
		
		System.out.println("Email : " + Email);
		
		boolean isEmailExist = service.isEmailExist(Email);
		
		boolean sendMailSuccess = false;// 메일이 정상적으로 전송되었는지 유무를 알아오기 위한 용도
		
		
		
		String message = "";
		String loc ="";
		if(isEmailExist) {
			// 회원으로 존재하는 경우
			
			String enEmail = "";
			try {
				enEmail = aes.encrypt(Email);
			} catch (UnsupportedEncodingException | GeneralSecurityException e1) {
				e1.printStackTrace();
			}
			
		GoogleMail mail = new GoogleMail();
		
		try {
			mail.sendmail(Email, enEmail);
			sendMailSuccess = true; // 메일 전송이 성공했음을 기록한다.
			
			 message = "메일로 인증번호를 발송하였습니다 !";
			 loc = request.getContextPath() + "/main/home.gc";
			
			
		} catch (Exception e) {	// 메일 전송이 실패한 경우
			System.out.println("~~~ 메일 전송에 실패함 ㅜㅜ ~~~");
			 message = "메일 전송에 실패하였습니다.";
			 loc = "javascript:history.back()";
			e.printStackTrace();
			sendMailSuccess = false; // 메일 전송에 실패했음을 기록한다.
		}	
			
			
		}// end of if(isUserExist) ----------------------------------------
	
		
		
		mav.addObject("message", message);
		mav.addObject("loc", loc);
		
		mav.setViewName("msg");
		return mav;
		
	}
		
	@RequestMapping(value="/pwUpdate.gc", method = {RequestMethod.POST})
	public ModelAndView pwUpdate(ModelAndView mav, HttpServletRequest request) {
		
		
		String member_pwd = request.getParameter("passwd");
		String email = request.getParameter("email");
		
		
		Map<String, String> paraMap = new HashMap<>();
		paraMap.put("member_pwd", Sha256.encrypt(member_pwd));
		paraMap.put("email", email);
		
		int n = service.pwUpdate(paraMap);
		System.out.println("n : " +n);
		String message = "";
		String loc = "";
		if(n==1) {
			message = "비밀번호가 성공적으로 변경되었습니다 !";
			loc = request.getContextPath()+"/memberLogin.gc";
		}
		
		
		mav.addObject("message", message);
		mav.addObject("loc", loc);
		
		mav.setViewName("msg");
		return mav;
	}	
	
}
	
