package com.five.goodchoice.detail.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.security.GeneralSecurityException;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.five.goodchoice.detail.model.AcomodationVO;
import com.five.goodchoice.detail.model.ReservationVO;
import com.five.goodchoice.detail.model.RoomVO;
import com.five.goodchoice.detail.service.InterDetail_AcomodationService;
import com.five.goodchoice.detail.service.InterResrvSerivce;
import com.five.goodchoice.detail.service.InterRoomSerivce;
import com.five.goodchoice.member.model.HostVO;
import com.five.goodchoice.common.AES256;



@Controller
public class DetailController {
	
	@Autowired
	private InterDetail_AcomodationService service;
	
	@Autowired
	private InterRoomSerivce room_service;
	
	@Autowired
	private InterResrvSerivce resrv_service;
	
	@Autowired
    private AES256 aes;

	
	// 모텔 View	
	
	@ResponseBody
	@RequestMapping(value="/details/detail.gc" , method = {RequestMethod.GET} , produces="text/plain;charset=UTF-8")
	public ModelAndView detail_view(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) throws Exception {
		
			String method = request.getMethod();
		
			String acom_no = request.getParameter("acom_no").trim();
						
			String category_no = request.getParameter("category_no").trim();
			
			String check_in_date = request.getParameter("check_in_date").trim();
			
			String check_out_date = request.getParameter("check_out_date").trim();
			
			String message ="";
			String loc = "";
			
			Map<String,String>paraMap = new HashMap<>();
			
			paraMap.put("acom_no", acom_no);
			
			paraMap.put("category_no",category_no);
			
			paraMap.put("check_in_date",check_in_date);
			
			paraMap.put("check_out_date",check_out_date);
			
			boolean wrong_data_in_url = false; // url 에 잘못된 값을 입력했는지 여부 알아오기

			if(!"POST".equalsIgnoreCase(method) ) { // "get" 
				
				
				
				if(acom_no != null && category_no!=null && check_in_date != null && check_out_date != null) {
					

					
			
		
				
					
					
						try {
							
							
							if(acom_no.trim().isEmpty() || category_no.trim().isEmpty() || check_in_date.trim().isEmpty() || check_out_date.trim().isEmpty()) {
								//System.out.println("공백입니다.");
								message = "item_no는 공백이 될 수 없습니다.";		
								wrong_data_in_url = true;
								
								loc = "javascript:history.back()";
								mav.addObject("message", message);
								mav.addObject("loc", loc);
								
								mav.setViewName("details/msg.tiles5");
								
								return mav;
							}// end of if(itemno.trim().isEmpty())-----------------------------------
							
							
							
							
							
						
							// acom_no 에 음수가 오는지 검사하는 여부
							else if(Integer.parseInt(acom_no.trim()) < 0 || Integer.parseInt(category_no.trim()) < 0) {
								
							//	System.out.println("음수입니다.");
								message = "acom_no 혹은 category_no 는 음수가 될 수 없습니다.";
								wrong_data_in_url = true;
								
								loc = "javascript:history.back()";
								mav.addObject("message", message);
								mav.addObject("loc", loc);
								
								mav.setViewName("details/msg.tiles5");
								
								return mav;
							}// end of else if(Integer.parseInt(itemno.trim()) < 0) -----------------------------
							 
							
							
							
							boolean is_Exist_acom_no = service.is_Exist_acom_no(paraMap); 
							
							boolean is_Exist_category_no = service.is_Exist_category_no(paraMap);
							
							if(!is_Exist_acom_no || ! is_Exist_category_no) {
								message = "acom_no 혹은 category_no 가 DB에 존재하지 않습니다.";
								
								wrong_data_in_url = true;
								
								loc = "javascript:history.back()";
								mav.addObject("message", message);
								mav.addObject("loc", loc);
								
								mav.setViewName("details/msg.tiles5");
								
								return mav;
								
							}// end of if(!is_Exist_item_no)----------------------
							
							
							
							
							
						}// end of try -------------------------------------
						
						
						catch(NumberFormatException e) { // 유효하지 않은 문자를 acom_no 와 category_no 로 입력하는 경우   
				            
				               	   boolean isDigit = true;
				               
					               char charArr[] = acom_no.trim().toCharArray();
					               for(int i=0;i<charArr.length; i++) {
					                  
					                  if(charArr[i] != '-' && !Character.isDigit(charArr[i]) ) {
					                	  
					                     isDigit = false;
					                     				                     
					                     break;
					                  }
					                  
					                  
					                  
					               }
					               
					               if(isDigit) {
					                  
					                  message = "acom_no 의 범위가 int 를 벗어났습니다.";
					                  wrong_data_in_url = true;
					                  
					               }
					               else {
					                  
					                  message = "acom_no는 문자형태가 올 수 없습니다.";
					                  wrong_data_in_url = true;
					                  
					               }
					               
					               boolean isDigit_category = true;
					               
					               char charArr_category[] = category_no.trim().toCharArray();
					               for(int i=0;i<charArr_category.length; i++) {
					                  
					                  if(charArr_category[i] != '-' && !Character.isDigit(charArr_category[i]) ) {
					                	  
					                	  isDigit_category = false;
					                     				                     
					                     break;
					                  }
					                  
					                  
					                  
					               }
					               
					               if(isDigit_category) {
					                  
					                  message = "category_no 의 범위가 int 를 벗어났습니다.";
					                  wrong_data_in_url = true;
					                  
					               }
					               else {
					                  
					                  message = "category_no는 문자형태가 올 수 없습니다.";
					                  wrong_data_in_url = true;
					                  
					               }
					               
					               

				            }

		
								if(!wrong_data_in_url) { // 맞다면, 정상적으로 실행합니다.
									
//									System.out.println("확인용 : is_Exist_acom_no : " + is_Exist_acom_no);
									// true false
									
									///////////////////////////////////////////////////////////////////////////////////////////////////////////////
									// 숙소 번호 acom_no 가 존재한다면

									
									// acom_no에 해당하는 숙소정보를 가져오기+ 스펙넘버도 가져오기(Fk_spec_no)
									AcomodationVO daVO = service.acom_Info(paraMap);
									
//									System.out.println(daVO.getParking_info() + daVO.getAcom_image() + daVO.getAcom_name()  + daVO.getAcom_no() + daVO.getFk_spec_no() );
									// 1객실당 1대의 차만 주차가 가능합니다(주차타워이용가능할경우 무료주차)/페라리, 람보르기니, 맥라렌 등 슈퍼카는 주차가 불가하오니 양해바랍니다./총 45대 주차시설 보유서초라바.jpg서초 라바28
									
									
									daVO.setCheck_in_date(paraMap.get("check_in_date")); 
									daVO.setCheck_out_date(paraMap.get("check_out_date"));
									
//									System.out.println("선택날짜는" + daVO.getCheck_in_date() + daVO.getCheck_out_date() );
									
									if(!daVO.getFk_spec_no().equals("1") || !daVO.getFk_spec_no().equals("2") || !daVO.getFk_spec_no().equals("3") || !daVO.getFk_spec_no().equals("4")) {
										
//										System.out.println("호텔아닙니다...");
										
									}
									
									else {
										
//										System.out.println("호텔의 스펙은 " + daVO.getFk_spec_no());
										
									}
									
									mav.addObject("daVO", daVO);
									
									
									//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////	
									
											
									
									
									
									
									// acom_no에 해당하는 숙소의 추가이미지 파일을 가져오기			

									
									List<AcomodationVO>show_acom_add_imgList = service.show_acom_add_imgList(paraMap);
									
//									System.out.println("숙소추가이미지 리스트");
									
									for(int i = 0; i<show_acom_add_imgList.size(); i++) {
										
//										System.out.println(" 이건 추가이미지들리스트들인 show_acom_add_imgList" + show_acom_add_imgList.get(i));
										
									}
									
									mav.addObject("show_acom_add_imgList",show_acom_add_imgList);
									
									//////////////////////////////////////////////////////////////////////////////////////////////////////////////
									
									
									// acom_no에 해당하는 시설 가져오기 tbl_inroom_facilities 이용!!
									
									
									
									
									List<AcomodationVO>show_facilitiesList = service.show_facilitiesList(paraMap);
									
									
										
//										System.out.println("편의시설" + daVO.getCategory_fac_name() + show_facilitiesList.size());
										
										mav.addObject("show_facilitiesList",show_facilitiesList);
										
									
									
									////////////////////////////////////////////////////////////////////////////////////////////////////////////
									
									
									
									// 호스트, 업주 정보 가져오기... 엑스트라 주소와 그냥 주소는 acomodationVO에서 찍어서 가져오기.
									
									HostVO hostVO = service.showHostInfo(paraMap);
									
//									System.out.println("호스트 정보:" + hostVO.getCp_name() + hostVO.getCp_reg_no() + hostVO.getHost_email() + hostVO.getHost_name() + daVO.getAddress() + daVO.getExtra_address());
									
									String email = hostVO.getHost_email();  // 이메일 받아오기
									
//									String decodeText = URLDecoder.decode(email, "UTF-8"); // 한번 디코드 한것
									
									try {
										email = aes.decrypt(email);  // 이메일 복호화
										
										
										
									} catch (UnsupportedEncodingException | GeneralSecurityException e) {
										
										// System.out.println("히히 안됨");
										
									}
									
									hostVO.setHost_email(email);
									
									System.out.println("호스트 정보:" + hostVO.getCp_name() + hostVO.getCp_reg_no() + hostVO.getHost_email() + hostVO.getHost_name() + daVO.getAddress() + daVO.getExtra_address());
									
									
									
									mav.addObject("hostVO",hostVO);
									
									
									// 리뷰 리스트 가져오기
									
									List<AcomodationVO> show_ReviewList = service.show_ReviewList(paraMap);
									
									
										
//									 System.out.println(show_ReviewList.size());
										
									mav.addObject("show_ReviewList",show_ReviewList);
										

									// acom_no에 해당하는 객실의 정보 가져오기 
									List<RoomVO> getRoomList = room_service.getRoomList(paraMap);
												
									

									
									mav.addObject("getRoomList",getRoomList);
									
									///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
									
									
							/*
									ReservationVO rsvVO = resrv_service.getReservcount(paraMap);
									
								*/	
									
									
									List<RoomVO> getRoom_addImageList = room_service.getRoom_addImageList(paraMap);

									
									
									mav.addObject("getRoom_addImageList",getRoom_addImageList);
									

									
									mav.setViewName("details/detail.tiles5");
//									    /WEB-INF/views/tiles5/details/detail.jsp  페이지를 만들어야 한다.
									
									
									
								    return mav;
									


							
									
								}// end of if(!wrong_data_in_url)
								
								else {
									
									loc = "javascript:history.back()";
									mav.addObject("message", message);
									mav.addObject("loc", loc);
									
									mav.setViewName("details/msg.tiles5");
									
									return mav;
								}// end of else-------

				}
			
								else { // itemno 가 null 이라면
									
									message = "acom_no나 category_no 는 null 이 될 수 없습니다.";
									loc = "javascript:history.back()";
									mav.addObject("message", message);
									mav.addObject("loc", loc);
									
									mav.setViewName("details/msg.tiles5");
									
									return mav;
								}// end of else--------------

					}

			
					else {
						// "post" 방식이므로 사용자가 웹브라우저 주소 창에서 장난쳐서 존재하지 않는 제품번호를 입력한 경우
					
				
						
						 message = "검색하신 숙소는 존재하지 않습니다.";
						 loc = "javascript:history.back()";
							mav.addObject("message", message);
							mav.addObject("loc", loc);
							
							mav.setViewName("details/msg.tiles5");
							
							return mav;
					}
			
			

			

	
}

	
	
	
}
