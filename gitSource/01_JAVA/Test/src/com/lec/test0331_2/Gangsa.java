package com.lec.test0331_2;

public class Gangsa extends Person {

	private String subject;
	
	public Gangsa(String id, String name, String subject) {
		super(id, name);
		this.subject = subject;
	}

	
	@Override
	public String print() {
		return super.print() + "(°ú¸ñ)" + subject;
	}
	
}
