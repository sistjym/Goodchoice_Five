package com.five.goodchoice.detail.model;

public class RoomVO {

	private String room_id;
	private String fk_acom_no;
	private String room_no;
	private String room_type;
	private String room_image;
	private String price;
	private String room_image_add_no;
	private String room_addimgcnt;
	
	public RoomVO(String room_id, String fk_acom_no,String room_no,String room_type , String room_image , String price , String room_image_add_no, String room_addimgcnt) {
		super();
		this.room_id = room_id;
		this.fk_acom_no =fk_acom_no;
		this.room_no = room_no;
		this.room_type = room_type;
		this.room_image = room_image;
		this.price = price;
		this.room_image_add_no = room_image_add_no;
		this.room_addimgcnt = room_addimgcnt;
	}
	
	public String getRoom_addimgcnt() {
		return room_addimgcnt;
	}

	public void setRoom_addimgcnt(String room_addimgcnt) {
		this.room_addimgcnt = room_addimgcnt;
	}

	public RoomVO() {}

	public String getRoom_id() {
		return room_id;
	}

	public void setRoom_id(String room_id) {
		this.room_id = room_id;
	}

	public String getFk_acom_no() {
		return fk_acom_no;
	}

	public void setFk_acom_no(String fk_acom_no) {
		this.fk_acom_no = fk_acom_no;
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

	public String getRoom_image() {
		return room_image;
	}

	public void setRoom_image(String room_image) {
		this.room_image = room_image;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getRoom_image_add_no() {
		return room_image_add_no;
	}

	public void setRoom_image_add_no(String room_image_add_no) {
		this.room_image_add_no = room_image_add_no;
	}
	
}
