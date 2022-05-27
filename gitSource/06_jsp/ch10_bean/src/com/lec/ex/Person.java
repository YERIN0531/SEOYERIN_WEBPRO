package com.lec.ex;
// 빈태그 사용하려면 : 매개변수 없는 생성자(필수)
// 오늘은 데이터 베이스 넣기 전에 딱 DTO 만드는 과정까지만
public class Person {
	//insert 하기 위해 받는 변수들
	private String 	name;	 //"홍길동"
	private int 	age;
	private char 	gender;  //'f'||'m'
	private String 	address;
	
	//매개변수 없는 생성자 함수
	public Person() {}
	
	//매개변수 있는 생성자 함수
	public Person(String name, int age, char gender, String address) {
		super();
		this.name = name;
		this.age = age;
		this.gender = gender;
		this.address = address;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public char getGender() {
		return gender;
	}

	public void setGender(char gender) {
		this.gender = gender;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	
	
}
