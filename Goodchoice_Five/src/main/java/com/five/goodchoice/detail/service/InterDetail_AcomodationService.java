package com.five.goodchoice.detail.service;

import java.util.List;
import java.util.Map;

import com.five.goodchoice.detail.model.AcomodationVO;
import com.five.goodchoice.member.model.HostVO;

public interface InterDetail_AcomodationService {

	// 숙소번호가 존재하는지 알아오는 메소드
	boolean is_Exist_acom_no(Map<String, String> paraMap);

	// acom_no에 해당하는 숙소정보를 가져오기
	AcomodationVO acom_Info(Map<String, String> paraMap);
	
	// acom_no에 해당하는 숙소의 추가이미지 파일을 가져오기
	List<AcomodationVO> show_acom_add_imgList(Map<String, String> paraMap);

	// 애초에 기본값을 '없음'이라고 해놓고  if문을 돌려서 잇을경우에만 나오게하자. nvl decode 지금 다 안된다.
	List<AcomodationVO> show_facilitiesList(Map<String, String> paraMap);

	// 호스트, 업주 정보 가져오기.
	HostVO showHostInfo(Map<String, String> paraMap);
	
	// 리뷰 리스트 가져오기
	List<AcomodationVO> show_ReviewList(Map<String, String> paraMap);
	
	

	
	
				


	


}
