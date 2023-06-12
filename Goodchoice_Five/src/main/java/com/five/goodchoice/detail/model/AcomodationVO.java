package com.five.goodchoice.detail.model;

public class AcomodationVO {
	// tbl_acomodation 숙소 테이블  VO
	private String acom_no;
	private String fk_spec_no;
	private String fk_district_no;
	private String fk_host_no;
	private String acom_name;
	private String acom_image;
	private String address;
	private String extra_address;
	private String sur_info;
	
	private String parking_info;
	private String acom_latitude;
	private String acom_longitude;
	private String acom_image_add_name;
	private String spec_name;
	private String fk_category_no;
	
	
	public AcomodationVO() {}
	
	public AcomodationVO(String acom_no,String fk_spec_no,String fk_district_no,String fk_host_no,String acom_name,String acom_image,String address,String extra_address,String sur_info,
								String parking_info,String acom_latitude,String acom_longitude, String acom_image_add_name, String spec_name , String fk_category_no) {
		 super();
		 this.acom_no = acom_no;
		 this.fk_spec_no = fk_spec_no;
		 this.fk_district_no = fk_district_no;
		 this.fk_host_no = fk_host_no;
		 this.acom_name = acom_name;
		 this.acom_image = acom_image;
		 this.address = address;
		 this.extra_address = extra_address;
		 this.sur_info = sur_info;
		 this.parking_info = parking_info;
		 this.acom_latitude = acom_latitude;
		 this.acom_longitude = acom_longitude;
		 this.acom_image_add_name = acom_image_add_name;
		 this.spec_name = spec_name;
		 this.fk_category_no = fk_category_no;
	}

	public String getSpec_name() {
		return spec_name;
	}

	public void setSpec_name(String spec_name) {
		this.spec_name = spec_name;
	}

	public String getFk_category_no() {
		return fk_category_no;
	}

	public void setFk_category_no(String fk_category_no) {
		this.fk_category_no = fk_category_no;
	}

	public String getAcom_image_add_name() {
		return acom_image_add_name;
	}

	public void setAcom_image_add_name(String acom_image_add_name) {
		this.acom_image_add_name = acom_image_add_name;
	}

	public String getAcom_no() {
		return acom_no;
	}

	public void setAcom_no(String acom_no) {
		this.acom_no = acom_no;
	}

	public String getFk_spec_no() {
		return fk_spec_no;
	}

	public void setFk_spec_no(String fk_spec_no) {
		this.fk_spec_no = fk_spec_no;
	}

	public String getFk_district_no() {
		return fk_district_no;
	}

	public void setFk_district_no(String fk_district_no) {
		this.fk_district_no = fk_district_no;
	}

	public String getFk_host_no() {
		return fk_host_no;
	}

	public void setFk_host_no(String fk_host_no) {
		this.fk_host_no = fk_host_no;
	}

	public String getAcom_name() {
		return acom_name;
	}

	public void setAcom_name(String acom_name) {
		this.acom_name = acom_name;
	}

	public String getAcom_image() {
		return acom_image;
	}

	public void setAcom_image(String acom_image) {
		this.acom_image = acom_image;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getExtra_address() {
		return extra_address;
	}

	public void setExtra_address(String extra_address) {
		this.extra_address = extra_address;
	}

	public String getSur_info() {
		return sur_info;
	}

	public void setSur_info(String sur_info) {
		this.sur_info = sur_info;
	}

	public String getParking_info() {
		return parking_info;
	}

	public void setParking_info(String parking_info) {
		this.parking_info = parking_info;
	}

	public String getAcom_latitude() {
		return acom_latitude;
	}

	public void setAcom_latitude(String acom_latitude) {
		this.acom_latitude = acom_latitude;
	}

	public String getAcom_longitude() {
		return acom_longitude;
	}

	public void setAcom_longitude(String acom_longitude) {
		this.acom_longitude = acom_longitude;
	};

	
}
