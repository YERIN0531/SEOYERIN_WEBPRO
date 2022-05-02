package com.lec.test0407_1;

public class Friend {

	private String name;
	private String phone;
	private String address;
	private String birthday;
	
	public Friend(String name, String address, String phone, String birthday) {
		this.name = name;
		this.address = address;
		this.phone = phone;
		this.birthday = birthday;
	}
	
	@Override
	public String toString() {
		return "이 름 : " +name + "\n주소 : " + address + "\n핸드폰 : " + phone + "\n생 일 : " + birthday;
	}

	public String getName() {
		return name;
	}

	public String getPhone() {
		return phone;
	}

	public String getAddress() {
		return address;
	}

	public String getBirthday() {
		return birthday;
	}
	
	
}
