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
		return "�� �� : " +name + "\n�ּ� : " + address + "\n�ڵ��� : " + phone + "\n�� �� : " + birthday;
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
