package com.lec.friend;

public class FriendDto {

	private int    num;
	private String name;
	private String tel;
	
	public FriendDto() {}

	public FriendDto(int num, String name, String tel) {
		super();
		this.num = num;
		this.name = name;
		this.tel = tel;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	@Override
	public String toString() {
		return "FriendDto [num=" + num + ", name=" + name + ", tel=" + tel + "]";
	}


}
