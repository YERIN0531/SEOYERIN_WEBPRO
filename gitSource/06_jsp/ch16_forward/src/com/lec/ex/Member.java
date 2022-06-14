package com.lec.ex;

import java.sql.Date;

public class Member {

	private String id;
	private String pw;
	private Date   rdate;
	
	public Member() {} //빈태그 안만들거니깐 사실 안만들어줘도 됨 

	public Member(String id, String pw) {
		super();
		this.id = id;
		this.pw = pw;
		rdate = new Date(System.currentTimeMillis());
		//rdate는 생성할때 자동으로 만들어줬으면 좋겠을땐, 매개변수에 rdate를 받지 말고, 안에다가 system.currentimemillis() 해주면
		//생성자가 호출되는 시점에 자동으로 입력됨 
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

	public Date getRdate() {
		return rdate;
	}

	public void setRdate(Date rdate) {
		this.rdate = rdate;
	}
	
	



}
