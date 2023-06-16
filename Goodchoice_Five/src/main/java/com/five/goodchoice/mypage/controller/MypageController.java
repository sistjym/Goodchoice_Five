package com.five.goodchoice.mypage.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;

import com.five.goodchoice.common.AES256;
import com.five.goodchoice.common.Sha256;
import com.five.goodchoice.member.model.MemberVO;
import com.five.goodchoice.mypage.model.ReservationVO;
import com.five.goodchoice.mypage.service.InterMypageService;


@Controller
public class MypageController {
	
	@Autowired
	private AES256 aes;
	
	@Autowired  //  TYPE 에 따라서 , SPRING 에서 알아서 BEAN 을 주입 해준다.
	private InterMypageService service ;
	
	@RequestMapping(value="/myreservation.gc") 
	public ModelAndView my_page_1(ModelAndView mav, HttpServletRequest request) {

		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
		
		
		
		if (loginuser != null) {
	        List<ReservationVO> reservationList = service.getAllReservations();
	        mav.addObject("reservationList", reservationList);
	        mav.setViewName("my/reservation_list.tiles4");
	    } else {
	        String message = "로그인이 필요한 페이지입니다.";
	        String loc = "javascript:history.back()";
	        
	        mav.addObject("message", message);
	        mav.addObject("loc", loc);
	        mav.setViewName("msg");
	    }
	    
	    return mav;
	}
	@RequestMapping(value="/mypage.gc") 
	public ModelAndView my_page_2(ModelAndView mav, HttpServletRequest request) {
		
		
		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
		
		
		
		if(loginuser != null) {
			
			String dec_email;
			try {
				dec_email = aes.decrypt(loginuser.getMember_email());
				
				session.setAttribute("dec_email", dec_email);
			} catch (UnsupportedEncodingException | GeneralSecurityException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			session.setAttribute("loginuser", loginuser);
			
			mav.setViewName("my/page.tiles4");
		}
		else {
			String message = "로그인이 필요한 페이지입니다.";
			String loc = "javascript:history.back()";
			
			mav.addObject("message", message);
			mav.addObject("loc", loc);
			mav.setViewName("msg");
		}
		return mav;
		
	}

	@RequestMapping(value="/mypoint.gc", method = {RequestMethod.GET}) 
	public ModelAndView my_page_3(ModelAndView mav, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
		
		if(loginuser != null) {
			mav.setViewName("my/point.tiles4");
		}
		else {
			String message = "로그인이 필요한 페이지입니다.";
			String loc = "javascript:history.back()";
			
			mav.addObject("message", message);
			mav.addObject("loc", loc);
			mav.setViewName("msg");
		}
		return mav;
		
	}
	@RequestMapping(value="/reservation-detail.gc") 
	public ModelAndView my_page_4(ModelAndView mav, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
		
		String reserv_id = request.getParameter("reserv_id");
		
		/*
		 * String product_id = request.getParameter("product_id"); String order_serial =
		 * request.getParameter("order_serial");
		 */
		
	
		
		/*
		 * Map<String, String> paraMap = new HashMap<>(); paraMap.put("product_id",
		 * product_id); paraMap.put("order_serial", order_serial);
		 * 
		 * 
		 * InterProductDAO pdao = new ProductDAO(); OrderDTO odto =
		 * pdao.ProductOrderDetail(paraMap); request.setAttribute("odto", odto);
		 * 
		 * super.setViewPage("/WEB-INF/views/member/mypage_ReviewWrite.jsp");
		 */
		
		
		if(loginuser != null) {
			List<ReservationVO> reservationList = service.getAllReservations();
			mav.addObject("reserv_id", reserv_id);
	        mav.addObject("reservationList", reservationList);
			mav.setViewName("my/reservation-detail.tiles4");
		}
		else {
			String message = "로그인이 필요한 페이지입니다.";
			String loc = "javascript:history.back()";
			
			mav.addObject("message", message);
			mav.addObject("loc", loc);
			mav.setViewName("msg");
		}
		return mav;
	}
	
	
	@RequestMapping(value="/nickEdit.gc", method = {RequestMethod.POST}) 
	public ModelAndView nickEdit(ModelAndView mav, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
		
		String email = loginuser.getMember_email();
		String nickname = request.getParameter("nickname");
		
		Map<String, String> paraMap = new HashMap<>();
		paraMap.put("nickname", nickname);
		paraMap.put("email", email);
		
		String message = "";
		String loc = "";
		
		int n = service.nickEdit(paraMap);
		
		if(n == 1) {
			request.setAttribute("nickname", nickname);
			message = "닉네임 변경이 성공했습니다.";
			loc = request.getContextPath() + "/mypage.gc";
		}
		
		else {
			message = "닉네임 변경에 실패 했습니다.";
			loc = "javascript:history.back()";
		}
		
		if(message != "") {
			mav.addObject("message", message);
		}
		mav.addObject("loc", loc);
		
		mav.setViewName("msg");
		
		
		return mav;
	}
	
	/*
	 * @RequestMapping(value="/reservNameEdit.gc", method = {RequestMethod.POST})
	 * public ModelAndView reservNameEdit(ModelAndView mav, HttpServletRequest
	 * request) {
	 * 
	 * HttpSession session = request.getSession(); MemberVO loginuser =
	 * (MemberVO)session.getAttribute("loginuser");
	 * 
	 * String email = loginuser.getMember_email(); String reserved_name =
	 * request.getParameter("reserved_name");
	 * 
	 * Map<String, String> paraMap = new HashMap<>(); paraMap.put("reserved_name",
	 * reserved_name); paraMap.put("email", email);
	 * 
	 * String message = ""; String loc = "";
	 * 
	 * int n = service.reservNameEdit(paraMap);
	 * 
	 * if(n == 1) { request.setAttribute("reserved_name", reserved_name); message =
	 * "닉네임 변경이 성공했습니다."; loc = request.getContextPath() + "/mypage.gc"; }
	 * 
	 * else { message = "닉네임 변경에 실패 했습니다."; loc = "javascript:history.back()"; }
	 * 
	 * mav.addObject("message", message); mav.addObject("loc", loc);
	 * 
	 * mav.setViewName("msg");
	 * 
	 * 
	 * return mav; }
	 */
	
	
	
	/*
	 * @RequestMapping(value="/reviewRegister.gc", method = {RequestMethod.POST})
	 * public ModelAndView reviewWrite(ModelAndView mav, HttpServletRequest request)
	 * {
	 * 
	 * HttpSession session = request.getSession(); MemberVO loginuser = (MemberVO)
	 * session.getAttribute("loginuser");
	 * 
	 * MultipartRequest mtrequest = null;
	 * 
	 * ServletContext svlCtx = session.getServletContext(); String uploadFileDir =
	 * svlCtx.getRealPath("/images");
	 * 
	 * try { mtrequest = new MultipartRequest(request, uploadFileDir, 10*1024*1024,
	 * "UTF-8", new DefaultFileRenamePolicy() ); } catch (IOException e) {
	 * request.setAttribute("message",
	 * "업로드 되어질 경로가 잘못되었거나 또는 최대용량 10MB를 초과했으므로 파일업로드 실패함!!");
	 * request.setAttribute("loc",
	 * request.getContextPath()+"/mypage/reviewlist.dak");
	 * 
	 * mav.setViewName("msg"); return mav; // 종료 } String orderSerial =
	 * mtrequest.getParameter("orderSerial"); String product_id =
	 * mtrequest.getParameter("product_id"); String rating =
	 * mtrequest.getParameter("rating"); String contents =
	 * mtrequest.getParameter("contents");
	 * 
	 * String userid = loginuser.getMbrId(); String rimage =
	 * mtrequest.getFilesystemName("rimage"); String rimage1 =
	 * mtrequest.getFilesystemName("rimage1"); contents = contents.replaceAll("<",
	 * "&lt;"); contents = contents.replaceAll(">", "&gt;"); contents =
	 * contents.replaceAll("\r\n", "<br>");
	 * 
	 * 
	 * Map<String, String> paraMap = new HashMap<>();
	 * 
	 * paraMap.put("rimage", rimage); paraMap.put("rimage1", rimage1);
	 * paraMap.put("orderSerial", orderSerial); paraMap.put("product_id",
	 * product_id); paraMap.put("userid", userid); paraMap.put("rating", rating);
	 * paraMap.put("contents", contents);
	 * 
	 * 
	 * InterProductDAO pdao = new ProductDAO();
	 * 
	 * String message = ""; String loc = ""; try { int n = pdao.addReview(paraMap);
	 * 
	 * if(n == 1) {
	 * 
	 * message = "리뷰등록 성공!!"; loc =
	 * request.getContextPath()+"/mypage/reviewlist.dak";
	 * 
	 * } } catch (SQLException e) { e.printStackTrace();
	 * 
	 * message = "리뷰등록 실패!!"; loc =
	 * request.getContextPath()+"/mypage/reviewlist.dak"; }
	 * request.setAttribute("message", message); request.setAttribute("loc", loc);
	 * 
	 * mav.setViewName("msg");
	 * 
	 * return mav; }
	 */
	
	@RequestMapping(value="/pwdChange.gc") 
	public ModelAndView pwdChange(ModelAndView mav, HttpServletRequest request) {
		
		mav.setViewName("my/pwdChange.tiles4");
		
		return mav;
	}
	
	@RequestMapping(value="/pwdChangeEnd.gc", method = {RequestMethod.POST}) 
	public ModelAndView pwdChangeEnd(ModelAndView mav, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
		
		if(loginuser != null) {
			// 암호변경하기 버튼을 클릭한 경우
			String pwd = request.getParameter("pwd");
			String email = loginuser.getMember_email();
			
			Map<String, String> paraMap = new HashMap<>();
			paraMap.put("pwd", Sha256.encrypt(pwd));
			paraMap.put("email", email);
			

			int updateCount = service.pwdUpdate(paraMap);
			
			String message = "";
			String loc = "";
			
			try {
				if(updateCount != 0) {
					
					request.setAttribute("userid", email);
					request.setAttribute("pwd", pwd);
					
					message = "비밀번호변경이 성공했습니다.";
					loc = request.getContextPath() + "/mypage.gc";
				} else {
					
					message = "비밀번호변경에 실패했습니다.";
					loc = "javascript:history.back()";
					
				}
				request.setAttribute("message", message);
				request.setAttribute("loc", loc);
				
				mav.setViewName("msg");
			} catch (Exception e) {
				e.printStackTrace();
				
				System.out.println("SQL 에러 // MemberPwdChangeAction");
			}
			
		}
		
		return mav;
	}
	
}
