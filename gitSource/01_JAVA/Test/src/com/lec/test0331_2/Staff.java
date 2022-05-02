package com.lec.test0331_2;

public class Staff extends Person {

	private String department;
	
	
	public Staff(String id, String name, String department) {
		super(id, name);
		this.department = department;
	}

	@Override
	public String print() {
		return super.print() + "(ºÎ¼­)" + department;
	}
	
}
