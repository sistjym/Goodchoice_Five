package com.five.goodchoice.member.model;

public class HostVO {

	private int host_no;           /* 업주번호 */
	private String host_email;     /* 업주이메일 */
	private String host_pwd;       /* 업주비밀번호 */
	private String host_name;      /* 대표자명 */
	private String cp_reg_no;      /* 사업자등록번호 */
	private String cp_name;        /* 상호명 */
	private String is_host_permission;
	
	
	public HostVO() {}
	
	
	public HostVO(int host_no, String host_email, String host_pwd, String host_name,
			String is_host_permission, String cp_reg_no, String cp_name) {
		super();
		this.host_no = host_no;
		this.host_email = host_email;
		this.host_pwd = host_pwd;
		this.host_name = host_name;
		this.is_host_permission = is_host_permission;
		this.cp_reg_no = cp_reg_no;
		this.cp_name = cp_name;
	}


	public int getHost_no() {
		return host_no;
	}
	public void setHost_no(int host_no) {
		this.host_no = host_no;
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

	public String getIs_host_permission() {
		return is_host_permission;
	}

	public void setIs_host_permission(String is_host_permission) {
		this.is_host_permission = is_host_permission;
	}
	
	
	
	
	
}
