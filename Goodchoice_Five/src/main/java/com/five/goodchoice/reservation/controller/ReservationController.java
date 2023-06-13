package com.five.goodchoice.reservation.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
		  
		  String acommName = request.getParameter("acommName"); 
		  String roomName = request.getParameter("roomName"); 
		  String checkIn = request.getParameter("checkIn"); 
		  String checkOut = request.getParameter("checkOut"); 
		  String totalPrice = request.getParameter("totalPrice"); 
		
		  Date now = new Date();
		  
		  String reserve_id =  "reserv1"+now;
		  Map<String, String> paraMap = new HashMap<>();
			paraMap.put("userName",userName);
			paraMap.put("email",email);
			paraMap.put("member_id",member_id);
			
			paraMap.put("acommName",acommName);
			paraMap.put("roomName",roomName);
			paraMap.put("checkIn",checkIn);
			paraMap.put("checkOut",checkOut);
			paraMap.put("totalPrice",totalPrice);
			paraMap.put("reserve_id",reserve_id);
		  
			
			
			
			//예약테이블에 예약정보를 insert 
			int n = service.insertReservationInfo(paraMap);
			
			System.out.println("테이ㅏ블 인서트 " + n);
			// insert에 성공하면 예약 확정 이메일 보내기 
			
			
			
		  
		  return "reservation/reservationEnd.tiles1";

	  }
	  
	 
}
