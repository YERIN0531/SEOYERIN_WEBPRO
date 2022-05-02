package com.lec.ex07_class1;

public class Personinfo {

	private String name;
	private int age;
	private char gender;
	
	public Personinfo() {}
	public Personinfo(String name, int age, char gender) {
		this.name = name;
		this.age = age;
		this.gender = gender;
	}
	public void print() {
		System.out.println("이름=" + name +", 나이 ="+ age + ", 성별 =" + gender);
	}
	
	
	
	
	public void setName(String name) {
		this.name = name;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public void setGender(char gender) {
		this.gender = gender;
	}
	public String getName() {
		return name;
	}
	public int getAge() {
		return age;
	}
	public char getGender() {
		return gender;
	}
	
}
