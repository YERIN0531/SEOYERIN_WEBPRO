package com.lec.member;

import java.sql.Date;
import java.sql.Timestamp;

public class MemberDto {

	private String id;
	private String pw;
	private String name;
	private String phone1;
	private String phone2;
	private String phone3;
	private String gender;
	private String email;
	private Timestamp   birth; //입력 받는 곳은 편하려면 date형 하지만 우린 timestamp 써볼것 
	private Date   rdate; //rdate는 사용자에게 받는 아이가 아니기 때문에 timestamp로 하던, string으로 하던 date로 하던 상관 없음
	private String address;
	
	public MemberDto() {} //빈태그를 써야 하니 매개변수 없는 생성자함수 만들어주기 

	public MemberDto(String id, String pw, String name, String phone1, String phone2, String phone3, String gender,
			String email, Timestamp birth, Date rdate, String address) {
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.phone1 = phone1;
		this.phone2 = phone2;
		this.phone3 = phone3;
		this.gender = gender;
		this.email = email;
		this.birth = birth;
		this.rdate = rdate;
		this.address = address;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone1() {
		return phone1;
	}

	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}

	public String getPhone2() {
		return phone2;
	}

	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}

	public String getPhone3() {
		return phone3;
	}

	public void setPhone3(String phone3) {
		this.phone3 = phone3;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Timestamp getBirth() {
		return birth;
	}

	public void setBirth(Timestamp birth) {
		this.birth = birth;
	}

	public Date getRdate() {
		return rdate;
	}

	public void setRdate(Date rdate) {
		this.rdate = rdate;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Override
	public String toString() {
		return "MemberDto [id=" + id + ", pw=" + pw + ", name=" + name + ", phone1=" + phone1 + ", phone2=" + phone2
				+ ", phone3=" + phone3 + ", gender=" + gender + ", email=" + email + ", birth=" + birth + ", rdate="
				+ rdate + ", address=" + address + "]";
	}

	
	
}
