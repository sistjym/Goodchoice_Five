package com.five.goodchoice.member.model;

public class HostVO {

	private int host_no;           /* 업주번호 */
	private int fk_admin_no;       /* 관리자번호 */
	private String host_email;     /* 업주이메일 */
	private String host_pwd;       /* 업주비밀번호 */
	private String host_name;      /* 대표자명 */
	private String host_mobile;    /* 업주전화번호 */
	private String cp_reg_no;      /* 사업자등록번호 */
	private String cp_name;        /* 상호명 */
	public int getHost_no() {
		return host_no;
	}
	public void setHost_no(int host_no) {
		this.host_no = host_no;
	}
	public int getFk_admin_no() {
		return fk_admin_no;
	}
	public void setFk_admin_no(int fk_admin_no) {
		this.fk_admin_no = fk_admin_no;
	}
	public String getHost_email() {
		return host_email;
	}
	public void setHost_email(String host_email) {
		this.host_email = host_email;
	}
	public String getHost_pwd() {
		return host_pwd;
	}
	public void setHost_pwd(String host_pwd) {
		this.host_pwd = host_pwd;
	}
	public String getHost_name() {
		return host_name;
	}
	public void setHost_name(String host_name) {
		this.host_name = host_name;
	}
	public String getHost_mobile() {
		return host_mobile;
	}
	public void setHost_mobile(String host_mobile) {
		this.host_mobile = host_mobile;
	}
	public String getCp_reg_no() {
		return cp_reg_no;
	}
	public void setCp_reg_no(String cp_reg_no) {
		this.cp_reg_no = cp_reg_no;
	}
	public String getCp_name() {
		return cp_name;
	}
	public void setCp_name(String cp_name) {
		this.cp_name = cp_name;
	}
	
	
	
	
	
}
