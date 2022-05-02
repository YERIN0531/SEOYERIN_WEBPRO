package com.lec.test0331_2;

public class Student extends Person {

	private String ban;

	public Student(String id, String name, String ban) {
		super(id, name);
		this.ban = ban;
	}

	@Override
	public String print() {
		return super.print() + "(¹Ý)" + ban;
	}
	
	
	
}
