package com.five.goodchoice.detail.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.five.goodchoice.detail.model.AcomodationVO;
import com.five.goodchoice.detail.model.InterDetail_AcomodationDAO;
import com.five.goodchoice.detail.model.InterRoomDAO;

@Service
public class Detail_AcomodationService implements InterDetail_AcomodationService {

	private InterDetail_AcomodationDAO dadao;
	
	
	// 숙소번호가 존재하는지 알아오는 메소드
	@Override
	public boolean is_Exist_acom_no(Map<String, String> paraMap) {
			boolean is_Exist_acom_no =	 dadao.is_Exist_acom_no(paraMap);
		return is_Exist_acom_no;
	}

	// acom_no에 해당하는 숙소정보를 가져오기
	@Override
	public AcomodationVO acom_Info(Map<String, String> paraMap) {
		AcomodationVO daVO = dadao.show_acom_Info(paraMap);
		return daVO;
	}

	
	// acom_no에 해당하는 숙소의 추가이미지 파일을 가져오기			
	@Override
	public List<String> show_acom_add_imgList(Map<String, String> paraMap) {
		
		List<String> acom_add_imgList = dadao.show_acom_add_imgList(paraMap);
				
		return acom_add_imgList;
	}

	// 호텔의 스펙넘버만 가져오기
	@Override
	public AcomodationVO show_Specno(Map<String, String> paraMap) {
		AcomodationVO specVO = dadao.show_Specno(paraMap);
		return specVO;
	}


	
}
