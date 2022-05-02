package com.lec.ex15_collection;

public class Member {

	private String name;
	private String tel;
	private String address;
	public Member(String name, String tel, String address) {
		super();
		this.name = name;
		this.tel = tel;
		this.address = address;
	}
	@Override
	public String toString() {
		return name + " " + tel + " " + address;
	}
	
	
}
