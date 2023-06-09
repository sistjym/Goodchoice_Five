package com.five.goodchoice.detail.model;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class Detail_AcomodationDAO implements InterDetail_AcomodationDAO {

	@Resource
	private SqlSessionTemplate sqlsession; // 로컬 DB remote_FinalProject_5  에 연결
	// Type 에 따라 Spring 컨테이너가 알아서 root-context.xml 에 생성된 org.mybatis.spring.SqlSessionTemplate 의  sqlsession bean 을  sqlsession 에 주입시켜준다. 
    // 그러므로 sqlsession 는 null 이 아니다.
		
	
	
	// 숙소번호가 존재하는지 알아오는 메소드
	@Override
	public boolean is_Exist_acom_no(Map<String, String> paraMap) {
		
		boolean is_Exist_acom_no = false; 
		
		int n = sqlsession.selectOne("detail.is_Exist_acom_no", paraMap);
		
		if(n > 0) { // category_no exist
			is_Exist_acom_no = true;
		}
		
		return is_Exist_acom_no;
	}

	
	// acom_no에 해당하는 숙소정보를 가져오기
	@Override
	public AcomodationVO show_acom_Info(Map<String, String> paraMap) {

		AcomodationVO daVO = sqlsession.selectOne("detail.show_acom_Info", paraMap);
		
		return daVO;
	}


	// acom_no에 해당하는 숙소의 추가이미지 파일을 가져오기			
	@Override
	public List<String> show_acom_add_imgList(Map<String, String> paraMap) {
		
		List<String> acom_add_imgList = sqlsession.selectList("detail.show_acom_add_imgList");
				
		return acom_add_imgList;
	}

	
	// 호텔의 스펙넘버만 가져오기
	@Override
	public AcomodationVO show_Specno(Map<String, String> paraMap) {
		AcomodationVO specVO = sqlsession.selectOne("detail.show_Specno");
		return specVO;
	}

}
