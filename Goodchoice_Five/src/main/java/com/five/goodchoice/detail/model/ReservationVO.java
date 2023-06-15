package com.five.goodchoice.detail.model;

public class ReservationVO {
	
	private String resv_check_in_date;
	private String resv_check_out_date;
	private String resv_room_id;
	private String resv_room_type;
	private String reserv_status;
	
	public ReservationVO() {}
	
	public ReservationVO(String resv_check_in_date, String resv_check_out_date, String resv_room_id , String resv_room_type, String reserv_status)
	
	{
		 super();
		 this.resv_check_in_date = resv_check_in_date;
		 this.resv_check_out_date = resv_check_out_date;
		 this.resv_room_id = resv_room_id;
	     this.resv_room_type = resv_room_type;
	     this.reserv_status = reserv_status;
		}

	public String getReserv_status() {
		return reserv_status;
	}

	public void setReserv_status(String reserv_status) {
		this.reserv_status = reserv_status;
	}

	public String getResv_check_in_date() {
		return resv_check_in_date;
	}

	public void setResv_check_in_date(String resv_check_in_date) {
		this.resv_check_in_date = resv_check_in_date;
	}

	public String getResv_check_out_date() {
		return resv_check_out_date;
	}

	public void setResv_check_out_date(String resv_check_out_date) {
		this.resv_check_out_date = resv_check_out_date;
	}

	public String getResv_room_id() {
		return resv_room_id;
	}

	public void setResv_room_id(String resv_room_id) {
		this.resv_room_id = resv_room_id;
	}

	public String getResv_room_type() {
		return resv_room_type;
	}

	public void setResv_room_type(String resv_room_type) {
		this.resv_room_type = resv_room_type;
	}

}
