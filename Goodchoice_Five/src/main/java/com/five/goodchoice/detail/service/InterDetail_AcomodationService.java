package com.five.goodchoice.detail.service;

import java.util.List;
import java.util.Map;

import com.five.goodchoice.detail.model.AcomodationVO;

public interface InterDetail_AcomodationService {

	// 숙소번호가 존재하는지 알아오는 메소드
	boolean is_Exist_acom_no(Map<String, String> paraMap);

	// acom_no에 해당하는 숙소정보를 가져오기
	AcomodationVO acom_Info(Map<String, String> paraMap);

	// acom_no에 해당하는 숙소의 추가이미지 파일을 가져오기			
	List<String> show_acom_add_imgList(Map<String, String> paraMap);

	// 호텔의 스펙넘버만 가져오기
	AcomodationVO show_Specno(Map<String, String> paraMap);


}
