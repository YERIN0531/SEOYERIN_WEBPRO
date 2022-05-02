package com.lec.test0331_2;

public class Person {

	private String id;
	private String name;
	
//	public Person() {};
	public Person(String id, String name) {
		this.id = id;
		this.name = name;
	}
	
	public String print() {
		return "(ID)" + id + "(¿Ã∏ß)" + name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	
	
}
