package com.lec.ex16_io;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Member {

	private String name;
	private String phone;
	private String birth;
	private String address;
	public Member(String name, String phone, String birth, String address) {
		this.name = name;
		this.phone = phone;
		this.birth = birth;
		this.address = address;
		
	}
	
	@Override
	public String toString() {
		
		return name + "\t" + phone + "\t" + birth + "»ý\t" + address;
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

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	
	
	
	
}
