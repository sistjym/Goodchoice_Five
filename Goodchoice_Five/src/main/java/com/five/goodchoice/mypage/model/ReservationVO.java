package com.five.goodchoice.mypage.model;

public class ReservationVO {

	private String reserv_id;
	private String fk_room_id;
	private String fk_member_id;
	private String check_out_date;
	private String check_in_date;
	private String price;
	private String reserv_status;
    private String reserv_person;
    
    public ReservationVO(String reserv_id, String fk_room_id, String fk_member_id, String check_out_date,
			String check_in_date, String price, String reserv_status, String reserv_person) {
		super();
		this.reserv_id = reserv_id;
		this.fk_room_id = fk_room_id;
		this.fk_member_id = fk_member_id;
		this.check_out_date = check_out_date;
		this.check_in_date = check_in_date;
		this.price = price;
		this.reserv_status = reserv_status;
		this.reserv_person = reserv_person;
    }

	public String getReserv_id() {
		return reserv_id;
	}

	public void setReserv_id(String reserv_id) {
		this.reserv_id = reserv_id;
	}

	public String getFk_room_id() {
		return fk_room_id;
	}

	public void setFk_room_id(String fk_room_id) {
		this.fk_room_id = fk_room_id;
	}

	public String getFk_member_id() {
		return fk_member_id;
	}

	public void setFk_member_id(String fk_member_id) {
		this.fk_member_id = fk_member_id;
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

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
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

    
	
    
}
