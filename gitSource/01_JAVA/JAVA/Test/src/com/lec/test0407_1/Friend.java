package com.lec.test0407_1;

import java.text.SimpleDateFormat;

public class Friend {

	private String name;
	private String phone;
	private String address;
	private String birthday;
	
	public Friend(String name, String address, String phone, String birthday) {
		this.name = name;
		this.phone = phone;
		this.address = address;
		this.birthday = birthday;
	}
	
	@Override
	public String toString() {
		return "이 름 : " +name + "\n주소 : " + address + "\n핸드폰 : " + phone + "\n생 일 : " + birthday;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	
	
}
