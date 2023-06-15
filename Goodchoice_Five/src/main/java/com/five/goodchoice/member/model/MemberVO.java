package com.five.goodchoice.member.model;

public class MemberVO {	
	
	private String member_id;                  
	private String member_email;        
	private String member_pwd;         
	private String member_nickname;         
	private String member_reg_date;    
	private String point;              
	private String is_deactivate;      
	private int is_dormanant;       
	private String lastpwd_change_date; 
	private String is_admin;
	private String is_kakao_user;
	private String kakao_id;
	
	private int pwdchangegap;          // select 용. 지금으로 부터 마지막으로 암호를 변경한지가 몇개월인지 알려주는 개월수(3개월 동안 암호를 변경 안 했을시 암호를 변경하라는 메시지를 보여주기 위함)  
	private int lastlogingap;          // select 용. 지금으로 부터 마지막으로 로그인한지가 몇개월인지 알려주는 개월수(12개월 동안 로그인을 안 했을 경우 해당 로그인 계정을 비활성화 시키려고 함) 
	
	///////////////////////////////////////////////////////////////////////////////////
	// 로그인 할때 불러오는 select 용도
	private boolean requirePwdChange = false;
	
	
	public MemberVO() {}


	public MemberVO(String member_id, String member_email, String member_pwd, String member_nickname,
			String member_reg_date, String point, String is_deactivate, int is_dormanant, String is_admin, String is_kakao_user, String kakao_id,
			String lastpwd_change_date) {
		super();
		this.member_id = member_id;
		this.member_email = member_email;
		this.member_pwd = member_pwd;
		this.member_nickname = member_nickname;
		this.member_reg_date = member_reg_date;
		this.point = point;
		this.is_deactivate = is_deactivate;
		this.is_dormanant = is_dormanant;
		this.is_admin = is_admin;
		this.is_kakao_user = is_kakao_user;
		this.kakao_id = kakao_id;
		this.lastpwd_change_date = lastpwd_change_date;
	}


	public String getMember_id() {
		return member_id;
	}


	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}


	public String getMember_email() {
		return member_email;
	}


	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}


	public String getMember_pwd() {
		return member_pwd;
	}


	public void setMember_pwd(String member_pwd) {
		this.member_pwd = member_pwd;
	}


	public String getMember_nickname() {
		return member_nickname;
	}


	public void setMember_nickname(String member_nickname) {
		this.member_nickname = member_nickname;
	}


	public String getMember_reg_date() {
		return member_reg_date;
	}


	public void setMember_reg_date(String member_reg_date) {
		this.member_reg_date = member_reg_date;
	}


	public String getPoint() {
		return point;
	}


	public void setPoint(String point) {
		this.point = point;
	}


	public String getIs_deactivate() {
		return is_deactivate;
	}


	public void setIs_deactivate(String is_deactivate) {
		this.is_deactivate = is_deactivate;
	}


	public int getIs_dormanant() {
		return is_dormanant;
	}


	public void setIs_dormanant(int is_dormanant) {
		this.is_dormanant = is_dormanant;
	}


	public String getLastpwd_change_date() {
		return lastpwd_change_date;
	}


	public void setLastpwd_change_date(String lastpwd_change_date) {
		this.lastpwd_change_date = lastpwd_change_date;
	}


	public int getPwdchangegap() {
		return pwdchangegap;
	}


	public void setPwdchangegap(int pwdchangegap) {
		this.pwdchangegap = pwdchangegap;
	}


	public int getLastlogingap() {
		return lastlogingap;
	}


	public void setLastlogingap(int lastlogingap) {
		this.lastlogingap = lastlogingap;
	}


	public boolean isRequirePwdChange() {
		return requirePwdChange;
	}


	public void setRequirePwdChange(boolean requirePwdChange) {
		this.requirePwdChange = requirePwdChange;
	}


	public String getIs_admin() {
		return is_admin;
	}


	public void setIs_admin(String is_admin) {
		this.is_admin = is_admin;
	}


	public String getIs_kakao_user() {
		return is_kakao_user;
	}


	public void setIs_kakao_user(String is_kakao_user) {
		this.is_kakao_user = is_kakao_user;
	}


	public String getKakao_id() {
		return kakao_id;
	}


	public void setKakao_id(String kakao_id) {
		this.kakao_id = kakao_id;
	}

	

	
}
