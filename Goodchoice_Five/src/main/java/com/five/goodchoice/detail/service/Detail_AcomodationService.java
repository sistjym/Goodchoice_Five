package com.five.goodchoice.detail.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.five.goodchoice.detail.model.AcomodationVO;
import com.five.goodchoice.detail.model.InterDetail_AcomodationDAO;
import com.five.goodchoice.detail.model.InterRoomDAO;
import com.five.goodchoice.member.model.HostVO;

@Service
public class Detail_AcomodationService implements InterDetail_AcomodationService {
	
	@Autowired
	private InterDetail_AcomodationDAO dadao;
	
	
	// 숙소번호가 존재하는지 알아오는 메소드
	@Override
	public boolean is_Exist_acom_no(Map<String, String> paraMap) {
			boolean is_Exist_acom_no =	 dadao.is_Exist_acom_no(paraMap);
		return is_Exist_acom_no;
	}

	// acom_no에 해당하는 숙소정보를 가져오기
	@Override
	public AcomodationVO acom_Info(String acom_no) {
		AcomodationVO daVO = dadao.show_acom_Info(acom_no);
		return daVO;
	}
	
	// acom_no에 해당하는 숙소의 추가이미지 파일을 가져오기
	@Override
	public List<AcomodationVO> show_acom_add_imgList(Map<String, String> paraMap) {
		List<AcomodationVO> acom_add_imgList = dadao.show_acom_add_imgList(paraMap);
		return acom_add_imgList;
	}

	// 애초에 기본값을 '없음'이라고 해놓고  if문을 돌려서 잇을경우에만 나오게하자. nvl decode 지금 다 안된다.
	@Override
	public List<AcomodationVO> show_facilitiesList(Map<String, String> paraMap) {
		List<AcomodationVO>facilitiesList = dadao.show_facilitiesList(paraMap);
		return facilitiesList;
	}

	// 호스트, 업주 정보 가져오기.
	@Override
	public HostVO showHostInfo(Map<String, String> paraMap) {
		HostVO hostVO = dadao.showHostInfo(paraMap);
		return hostVO;
	}
	
	// 리뷰 리스트 가져오기
	@Override
	public List<AcomodationVO> show_ReviewList(Map<String, String> paraMap) {
		List<AcomodationVO> reviewList = dadao.show_ReviewList(paraMap);
		return reviewList;
	}
	

		
				


	


	
}
