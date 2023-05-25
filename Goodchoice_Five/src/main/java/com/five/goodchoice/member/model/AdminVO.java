package com.five.goodchoice.member.model;

public class AdminVO {
	 private int admin_no;           /* 관리자번호 */
	 private String admin_email;     /* 관리자이메일 */
	 private String admin_pwd;       /* 관리자비밀번호 */
	 private String admin_name;     /* 관리자이름 */
	 private String admin_reg_date; /* 관리자등록일 */
	public int getAdmin_no() {
		return admin_no;
	}
	public void setAdmin_no(int admin_no) {
		this.admin_no = admin_no;
	}
	public String getAdmin_email() {
		return admin_email;
	}
	public void setAdmin_email(String admin_email) {
		this.admin_email = admin_email;
	}
	public String getAdmin_pwd() {
		return admin_pwd;
	}
	public void setAdmin_pwd(String admin_pwd) {
		this.admin_pwd = admin_pwd;
	}
	public String getAdmin_name() {
		return admin_name;
	}
	public void setAdmin_name(String admin_name) {
		this.admin_name = admin_name;
	}
	public String getAdmin_reg_date() {
		return admin_reg_date;
	}
	public void setAdmin_reg_date(String admin_reg_date) {
		this.admin_reg_date = admin_reg_date;
	}

	 
}
