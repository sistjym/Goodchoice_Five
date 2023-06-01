package com.five.goodchoice.member.model;

import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO implements InterMemberDAO {

	@Resource
	private SqlSessionTemplate sqlsession;

	
	// 이메일이 존재하는 이메일인지 확인하기
	@Override
	public boolean checkDuplicateEmail(String email) {
		
		int result = sqlsession.selectOne("member.checkDuplicateEmail", email);
		return (result == 1);
	}


	@Override
	public boolean registerMember(Map<String, String> paraMap) {
		int result = sqlsession.insert("member.registerMember", paraMap);
		return (result == 1);
	}

}
