package com.five.goodchoice.member.model;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class MypageDAO implements InterMypageDAO {

	@Resource
	private SqlSessionTemplate sqlsession;
	
	@Override
	public boolean checkLogin(HttpServletRequest request) {
		
		
		
		return false;
	}

}
