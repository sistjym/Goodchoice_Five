package com.five.goodchoice.model;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO implements InterMemberDAO {

	@Resource
	private SqlSessionTemplate sqlsession;
	
	@Override
	public MemberVO test_select() {
		MemberVO mvo = sqlsession.selectOne("member.test_select");
		return mvo;
	}

}
