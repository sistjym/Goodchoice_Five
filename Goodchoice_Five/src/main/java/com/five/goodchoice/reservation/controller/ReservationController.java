package com.five.goodchoice.reservation.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.five.goodchoice.common.GoogleMail;
import com.five.goodchoice.reservation.service.InterReservationService;




@Controller
public class ReservationController {
	
	@Autowired
	private InterReservationService service;
	
	
	@RequestMapping(value="/reservation/reservation.gc")
	public String requiredLogin_showReservationPage(HttpServletRequest request, HttpServletResponse response){
		
		return "reservation/reservation.tiles1";
		
	}
	

	// 로그인 여부 확인 + 결제정보를 paymentGateWay에 보내기 
	  @RequestMapping(value="/reservation/paymentGateway.gc") 
	  public String goReservation(HttpServletRequest request){
		  
		  HttpSession session = request.getSession();
		 
		  String userName = request.getParameter("userName"); 
		  String email = request.getParameter("email"); 
		  
		  String acommName = request.getParameter("acommName"); 
		  String roomName = request.getParameter("roomName"); 
		  String checkIn = request.getParameter("checkIn"); 
		  String checkOut = request.getParameter("checkOut"); 
		  String totalPrice = request.getParameter("totalPrice"); 
		
		  request.setAttribute("userName", userName);
		  request.setAttribute("email", email);
		  request.setAttribute("acommName", acommName);
		  request.setAttribute("roomName", roomName);
		  request.setAttribute("checkIn", checkIn);
		  request.setAttribute("checkOut", checkOut);
		  request.setAttribute("totalPrice", totalPrice);
	 
		  return "reservation/paymentGateway.tiles1";
	
	  
	  }
	  
	  // 결제 완료 페이지 + 이메일 보내기 
	  
	  @RequestMapping(value="/reservation/reservationEnd.gc") 
	  public String reservationEnd(HttpServletRequest request){
	 
		  //예약테이블에 예약정보를 insert 
		  String userName = request.getParameter("userName"); 
		  String email = request.getParameter("email"); 
		  String member_id = request.getParameter("member_id"); 
		  
		  String user_point = request.getParameter("user_point");
		  String acommName = request.getParameter("acommName"); 
		  String roomName = request.getParameter("roomName"); 
		  String checkIn = request.getParameter("checkIn"); 
		  String checkOut = request.getParameter("checkOut"); 
		  String totalPrice = request.getParameter("totalPrice"); 
		
		  Date now = new Date();
		  
		  String reserve_id =  "reserve"+now.hashCode();
		  Map<String, String> paraMap = new HashMap<>();
			paraMap.put("userName",userName);
			paraMap.put("email",email);
			paraMap.put("member_id",member_id);
			paraMap.put("user_point",user_point);
			paraMap.put("acommName",acommName);
			paraMap.put("roomName",roomName);
			paraMap.put("checkIn",checkIn);
			paraMap.put("checkOut",checkOut);
			paraMap.put("totalPrice",totalPrice);
			paraMap.put("reserve_id",reserve_id);
	
			
			//예약테이블에 예약정보를 insert 
			int n = service.insertReservationInfo(paraMap);
			
			System.out.println("테이블 인서트" + n);
			
			// insert에 성공하면 예약 확정 이메일 보내기 
			if(n == 1) {
	
				
			 service.updatePoint(paraMap);
			
			// **** 주문이 완료되었을시 세션에 저장되어져 있는 loginuser 정보를 갱신하고
		    //      이어서 주문이 완료되었다라는 email 보내주기  **** //
			
				//// == 주문이 완료되었다는 mail 보내기 시작 == ////
				GoogleMail mail = new GoogleMail();

				StringBuilder sb = new StringBuilder();
				
				
				String html = "<div style='width:80%; margin: 0 auto; text-align:center; '>	"
		        				+ "<img src='https://framerusercontent.com/images/LeYluL6Fq0VX6IpJ4gMARoxOALU.png' style='height: 19px; width:90px;'/>"
		        				+ "<h2>예약 확정 안내 메일</h2>"
		        				+ "<p>안녕하세요.</p>"
		        				+ "<p>"+ userName+"님의 예약 일정을 안내해드립니다 </p>"
		        				+ "<p><strong>예약번호 :</strong> "+reserve_id+"</p>"
		        				+ "<p><strong>속소이름 :</strong> "+acommName+"</p>"
		        				+ "<p><strong>예약하신 룸 타입:</strong> "+roomName+"</p>"
		        				+ "<p><strong>예약하신 룸 타입:</strong> "+roomName+"</p>"
		        				+ "<p><strong>CHECK-IN:</strong> "+checkIn+"15:00</p>"
		        				+ "<p><strong>CHECK-OUT:</strong> "+checkOut+"11:00</p>"
		        				+ "<p><strong>총 결제 가격 :</strong> "+totalPrice+"</p>"
		        				+ "<p>이용해 주셔서 감사합니다. 즐거운 시간 보내세요</p>"
		        			    + "</div>" ;
				
				sb.append(html);
				
				String emailContents = sb.toString();
				
				
				try {
					mail.sendmail_OrderFinish(email, userName, emailContents);
				} catch (MessagingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				//// == 주문이 완료되었다는 mail 보내기 끝 == ////
				
			}

		  return "reservation/reservationEnd.tiles1";

	  }
	  
	 
}
