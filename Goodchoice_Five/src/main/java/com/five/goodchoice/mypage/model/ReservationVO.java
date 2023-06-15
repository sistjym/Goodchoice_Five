package com.five.goodchoice.mypage.model;

public class ReservationVO {

	private String room_id;
	private String acom_no;
	private String room_no;
	private String room_type;
	private String price;
	private String reserv_id;
	private String fk_member_id;
	private String acom_name;
	private String check_out_date;
	private String check_in_date;
	private String reserv_status;
	private String reserv_person;
	private String acom_image;
	
	public ReservationVO(String room_id, String acom_no, String room_no, String room_type, String price,
			String reserv_id, String fk_member_id, String acom_name, String check_out_date, String check_in_date,
			String reserv_status, String reserv_person, String acom_image) {
		super();
		this.room_id = room_id;
		this.acom_no = acom_no;
		this.room_no = room_no;
		this.room_type = room_type;
		this.price = price;
		this.reserv_id = reserv_id;
		this.fk_member_id = fk_member_id;
		this.acom_name = acom_name;
		this.check_out_date = check_out_date;
		this.check_in_date = check_in_date;
		this.reserv_status = reserv_status;
		this.reserv_person = reserv_person;
		this.acom_image = acom_image;
	}

	public String getRoom_id() {
		return room_id;
	}

	public void setRoom_id(String room_id) {
		this.room_id = room_id;
	}

	public String getAcom_no() {
		return acom_no;
	}

	public void setAcom_no(String acom_no) {
		this.acom_no = acom_no;
	}

	public String getRoom_no() {
		return room_no;
	}

	public void setRoom_no(String room_no) {
		this.room_no = room_no;
	}

	public String getRoom_type() {
		return room_type;
	}

	public void setRoom_type(String room_type) {
		this.room_type = room_type;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getReserv_id() {
		return reserv_id;
	}

	public void setReserv_id(String reserv_id) {
		this.reserv_id = reserv_id;
	}

	public String getFk_member_id() {
		return fk_member_id;
	}

	public void setFk_member_id(String fk_member_id) {
		this.fk_member_id = fk_member_id;
	}

	public String getAcom_name() {
		return acom_name;
	}

	public void setAcom_name(String acom_name) {
		this.acom_name = acom_name;
	}

	public String getCheck_out_date() {
		return check_out_date;
	}

	public void setCheck_out_date(String check_out_date) {
		this.check_out_date = check_out_date;
	}

	public String getCheck_in_date() {
		return check_in_date;
	}

	public void setCheck_in_date(String check_in_date) {
		this.check_in_date = check_in_date;
	}

	public String getReserv_status() {
		return reserv_status;
	}

	public void setReserv_status(String reserv_status) {
		this.reserv_status = reserv_status;
	}

	public String getReserv_person() {
		return reserv_person;
	}

	public void setReserv_person(String reserv_person) {
		this.reserv_person = reserv_person;
	}

	public String getAcom_image() {
		return acom_image;
	}

	public void setAcom_image(String acom_image) {
		this.acom_image = acom_image;
	}
    
	
    
}
