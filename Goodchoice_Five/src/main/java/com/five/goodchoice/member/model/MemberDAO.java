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

	// 회원으로 가입하기
	@Override
	public boolean registerMember(Map<String, String> paraMap) {
		int result = sqlsession.insert("member.registerMember", paraMap);
		return (result == 1);
	}

	// 멤버로 로그인하기
	@Override
	public MemberVO loginMember(Map<String, String> paraMap) {
		
	//	System.out.println("Email : " +paraMap.get("Email"));
	//	System.out.println("passwd : " +paraMap.get("passwd"));
		
		MemberVO loginuser = sqlsession.selectOne("member.loginMember", paraMap);
		return loginuser;
	}

	// tbl_member 테이블의 is_dormanant 컬럼의 값을 1로 변경하기 
	@Override
	public int is_dormanant(String Email) {
		int n = sqlsession.update("member.updateis_dormanant", Email);
		return n;
	}
	
	// tbl_loginhitory 테이블에 insert하기
	@Override
	public int insertloginhistory(Map<String, String> paraMap) {
		int result = sqlsession.insert("member.insertloginhistory", paraMap);
		return result;
	}
	
	// 업주로 로그인
	@Override
	public HostVO loginHost(Map<String, String> paraMap) {
		HostVO loginuser = sqlsession.selectOne("member.loginHost", paraMap);
		return loginuser;
	}

}
