package com.lec.ex;

public class Member {
	//el 표기법 함께 쓰려면 꼭 변수 이름 소문자로 지정해주자 
	private String name;
	private String id;
	private String pw;

	// 빈태그 만드는 목적이기 때문에 매개변수 없는 생성자 함수 써주고, setter는 꼭 받아주기 하지만 dto에서 불러올거기 때문에 getter도 걍 받아주자 

	public Member() {}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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
	
}
