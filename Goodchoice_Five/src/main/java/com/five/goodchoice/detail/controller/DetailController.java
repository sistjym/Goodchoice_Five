package com.five.goodchoice.detail.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
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
import com.five.goodchoice.detail.model.RoomVO;
import com.five.goodchoice.detail.service.InterDetail_AcomodationService;
import com.five.goodchoice.detail.service.InterRoomSerivce;
import com.five.goodchoice.member.model.HostVO;


@Controller
public class DetailController {
	
	@Autowired
	private InterDetail_AcomodationService service;
	
	@Autowired
	private InterRoomSerivce room_service;
	// 모텔 View	
	
	@RequestMapping(value="/details/detail.gc" , method = {RequestMethod.GET} , produces="text/plain;charset=UTF-8")
	public ModelAndView detail_view(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) throws Exception {
		
			String acom_no = request.getParameter("acom_no");
						
			String category_no = request.getParameter("category_no");
			
			String check_in_date = request.getParameter("check_in_date");
			
			String check_out_date = request.getParameter("check_out_date");
			
			boolean wrong_data_in_url = false; // url 에 잘못된 값을 입력했는지 여부 알아오기

			

			Map<String,String>paraMap = new HashMap<>();
			
			paraMap.put("acom_no", acom_no);
			
			paraMap.put("category_no",category_no);
			
			paraMap.put("check_in_date",check_in_date);
			
			paraMap.put("check_out_date",check_out_date);
			
			
			boolean is_Exist_acom_no = service.is_Exist_acom_no(paraMap); 
			
//			System.out.println("확인용 : is_Exist_acom_no : " + is_Exist_acom_no);
			// true false
			
			///////////////////////////////////////////////////////////////////////////////////////////////////////////////
			// 숙소 번호 acom_no 가 존재한다면

			
			// acom_no에 해당하는 숙소정보를 가져오기+ 스펙넘버도 가져오기(Fk_spec_no)
			AcomodationVO daVO = service.acom_Info(paraMap);
			
//			System.out.println(daVO.getParking_info() + daVO.getAcom_image() + daVO.getAcom_name()  + daVO.getAcom_no() + daVO.getFk_spec_no() );
			// 1객실당 1대의 차만 주차가 가능합니다(주차타워이용가능할경우 무료주차)/페라리, 람보르기니, 맥라렌 등 슈퍼카는 주차가 불가하오니 양해바랍니다./총 45대 주차시설 보유서초라바.jpg서초 라바28
			
			daVO.setCheck_in_date(paraMap.get("check_in_date")); 
			daVO.setCheck_out_date(paraMap.get("check_out_date"));
			
//			System.out.println("선택날짜는" + daVO.getCheck_in_date() + daVO.getCheck_out_date() );
			
			if(!daVO.getFk_spec_no().equals("1") || !daVO.getFk_spec_no().equals("2") || !daVO.getFk_spec_no().equals("3") || !daVO.getFk_spec_no().equals("4")) {
				
//				System.out.println("호텔아닙니다...");
				
			}
			
			else {
				
//				System.out.println("호텔의 스펙은 " + daVO.getFk_spec_no());
				
			}
			
			mav.addObject("daVO", daVO);
			
			
			//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////	
			
					
			
			
			
			
			// acom_no에 해당하는 숙소의 추가이미지 파일을 가져오기			

			
			List<AcomodationVO>show_acom_add_imgList = service.show_acom_add_imgList(paraMap);
			
//			System.out.println("숙소추가이미지 리스트");
			
			for(int i = 0; i<show_acom_add_imgList.size(); i++) {
				
//				System.out.println(" 이건 추가이미지들리스트들인 show_acom_add_imgList" + show_acom_add_imgList.get(i));
				
			}
			
			mav.addObject("show_acom_add_imgList",show_acom_add_imgList);
			
			//////////////////////////////////////////////////////////////////////////////////////////////////////////////
			
			
			// acom_no에 해당하는 시설 가져오기 tbl_inroom_facilities 이용!!
			
			
			
			
			List<AcomodationVO>show_facilitiesList = service.show_facilitiesList(paraMap);
			
			
				
//				System.out.println("편의시설" + daVO.getCategory_fac_name() + show_facilitiesList.size());
				
				mav.addObject("show_facilitiesList",show_facilitiesList);
				
			
			
			////////////////////////////////////////////////////////////////////////////////////////////////////////////
			
			
			
			// 호스트, 업주 정보 가져오기... 엑스트라 주소와 그냥 주소는 acomodationVO에서 찍어서 가져오기.
			
			HostVO hostVO = service.showHostInfo(paraMap);
			
//			System.out.println("호스트 정보:" + hostVO.getCp_name() + hostVO.getCp_reg_no() + hostVO.getHost_email() + hostVO.getHost_name() + daVO.getAddress() + daVO.getExtra_address());
			
			mav.addObject("hostVO",hostVO);
			
			
			// 리뷰 리스트 가져오기
			
			List<AcomodationVO> show_ReviewList = service.show_ReviewList(paraMap);
			
			
				
//			 System.out.println(show_ReviewList.size());
				
			mav.addObject("show_ReviewList",show_ReviewList);
				

			// acom_no에 해당하는 객실의 정보 가져오기 
			List<RoomVO> getRoomList = room_service.getRoomList(paraMap);

			
			mav.addObject("getRoomList",getRoomList);
			
			///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
			
	/*		
			String acom_name_Value = request.getParameter("acom_name");
			String room_type_Value =  request.getParameter("room_type");
			String dateDiff_Value =  request.getParameter("dateDiff");




			// 받아온 값이 null이 아니라면 디코딩을 수행합니다.
			if (acom_name_Value != null && room_type_Value != null  && dateDiff_Value != null ) {
			    try {
			        // UTF-8로 인코딩된 값을 디코딩합니다.
			        String acom_name = URLDecoder.decode(acom_name_Value, "UTF-8");
			        
			        // 디코딩된 값 사용
			        System.out.println(acom_name);
			        
			     // UTF-8로 인코딩된 값을 디코딩합니다.
			        String room_type = URLDecoder.decode(room_type_Value, "UTF-8");
			        
			        // 디코딩된 값 사용
			        System.out.println(room_type);
			        			        
			     // UTF-8로 인코딩된 값을 디코딩합니다.
			        String dateDiff = URLDecoder.decode(dateDiff_Value, "UTF-8");
			        
			        // 디코딩된 값 사용
			        System.out.println(dateDiff);
			        
			        // 디코딩된 값으로 추가적인 처리 수행
			        // ...
			        
					paraMap.put("acom_name",acom_name);
					
					paraMap.put("room_type",room_type);
					
					paraMap.put("dateDiff",dateDiff);
			        
			    } catch (UnsupportedEncodingException e) {
			        // 디코딩 실패 시 예외 처리
			        e.printStackTrace();
			    }
			}
			
		*/	
			
			
			
			
			// acom_no에 해당하는 각 객실의 추가이미지 가져오기
			
			// room_id 일치할경우에만 들어가게 코딩
		
	/*
			ArrayList<RoomVO> getRoomOne = room_service.getRoomOne(paraMap);
						
			for(RoomVO room  : getRoomOne ){
				   
				   List<String> room_Add_ImageList = room_service.getRoom_addImageList(room.getRoom_id());       

				   room.setRoom_Add_ImageList(room_Add_ImageList);

			}
			
			mav.addObject("getRoomOne",getRoomOne);
		
		*/	
						

			
			
			mav.setViewName("details/detail.tiles5");
//			    /WEB-INF/views/tiles5/details/detail.jsp  페이지를 만들어야 한다.
			
			
			
		    return mav;
			


	}
	
	/*
	// 객실 리스트 불러오기
	@ResponseBody
	@RequestMapping(value="/getRoomList.gc",method = {RequestMethod.GET}, produces="text/plain;charset=UTF-8")
	public String getRoomList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String acom_no = request.getParameter("acom_no");
		
		Map<String,String>paraMap = new HashMap<>();
		
		paraMap.put("acom_no", acom_no);
		
		List<RoomVO> roomList = room_service.getRoomList(paraMap);
		
		JSONArray jsonArr = new JSONArray();
		
		if(roomList != null) {// DB 에서 넘어온값 roomList 이 잇다면
			for( RoomVO roomvo : roomList ) {
				JSONObject jsonobj = new JSONObject();
				jsonobj.put("room_id", roomvo.getRoom_id());
				jsonobj.put("room_no", roomvo.getRoom_no());
				jsonobj.put("room_type", roomvo.getRoom_type());
				jsonobj.put("room_image", roomvo.getRoom_image());
				jsonobj.put("price", roomvo.getPrice());
				jsonobj.put("room_no", roomvo.getRoom_no());
				jsonArr.put(jsonobj);
				
			}			
		}		
		return 	jsonArr.toString();

	}
	
	*/
	
	
	
}
