package com.five.goodchoice.detail.controller;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.five.goodchoice.detail.model.AcomodationVO;
import com.five.goodchoice.detail.service.InterDetail_AcomodationService;
import com.five.goodchoice.detail.service.InterRoomSerivce;


@Controller
public class DetailController {
	
	@Autowired
	private InterDetail_AcomodationService service;
	
	private InterRoomSerivce room_service;
	// 모텔 View	
	
	@RequestMapping(value="/details/detail.gc" , method = {RequestMethod.GET})
	public ModelAndView detail_view(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) throws Exception {
		
			String acom_no = request.getParameter("acom_no").trim();
			
			String category_no = request.getParameter("category_no").trim();
			
			boolean wrong_data_in_url = false; // url 에 잘못된 값을 입력했는지 여부 알아오기

			

			Map<String,String>paraMap = new HashMap<>();
			
			paraMap.put("acom_no", acom_no);
			
			boolean is_Exist_acom_no = service.is_Exist_acom_no(paraMap); 
			
			System.out.println("확인용 : is_Exist_acom_no" + is_Exist_acom_no);
			
			
			///////////////////////////////////////////////////////////////////////////////////////////////////////////////
			// 숙소 번호 acom_no 가 존재한다면

			
			// acom_no에 해당하는 숙소정보를 가져오기
			AcomodationVO daVO = service.acom_Info(paraMap);
			
			System.out.println(daVO.getParking_info());
			
			
			mav.addObject("daVO", daVO);
			
			
			
			// 호텔의 스펙넘버만 가져오기
						
			AcomodationVO specVO = service.show_Specno(paraMap);
			
			System.out.println(specVO.getAcom_name() + specVO.getFk_spec_no() + specVO.getFk_spec_no());
			
			
			
			// acom_no에 해당하는 숙소의 추가이미지 파일을 가져오기			
			List<String>acom_add_imgList = service.show_acom_add_imgList(paraMap);
			
			System.out.println(acom_add_imgList.get(1));
			
			mav.addObject("acom_add_imgList",acom_add_imgList);
			
			// acom_no에 해당하는 시설 가져오기 tbl_inroom_facilities 이용!!
			
			
			
			
			// acom_no에 해당하는 객실의 정보 가져오기 ==> 이거 객실번호에 해당하는 정보 가져올때 객실번호 하나에 해당하는 정보를 다 가져오고 그 다음 객실번호에 해당하는 정보를 가져오고 식으로 해야하는데, room_no를 어떤 식으로 해야할지 모르겠음 물어보기. forEach로 하나씩 다가져와서 뿌려주는거 아닌가? 근데 forEach로 다 가져오게 되면 안되는데. 숙소 acom_no 안에서 객실아이디 마다 나눠서 가져와야 하는데 그게 가능함??
			List<Map<String,String>> roomList = room_service.show_roomList(paraMap);
			
			
			mav.addObject("roomList",roomList);
			
			
			// acom_no에 해당하는 편의시설들 가져오기

			
			
			mav.setViewName("details/detail.tiles5");
//			    /WEB-INF/views/tiles5/details/detail.jsp  페이지를 만들어야 한다.
			
			
			
		    return mav;
			


	}
	
}
