package com.lec.dto;

import java.sql.Date;
import java.sql.Timestamp;

public class MemberDto {
	private String id;
	private String pw;
	private String name;
	private Timestamp birth;
	private Date rdate;
	
	public MemberDto () {}

	public MemberDto(String id, String pw, String name, Timestamp birth, Date rdate) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.birth = birth;
		this.rdate = rdate;
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

	@Override
	public String toString() {
		return "MemberDto [id=" + id + ", pw=" + pw + ", name=" + name + ", birth=" + birth + ", rdate=" + rdate + "]";
	}
	
	
	
}
