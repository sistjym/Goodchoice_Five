package com.five.goodchoice.member.model;

public class MemberVO {

	
	public MemberVO() {}
	public MemberVO(int no, String name) {
		super();
		this.no = no;
		this.name = name;
	}
	private int no;
	private String name;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

	
}
