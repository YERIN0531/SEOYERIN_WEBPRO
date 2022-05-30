package com.lec.test0428;

public class CustomerDto {

	private int cno;
	private String ctel;
	private String cname;
	private int point;
	
	public CustomerDto(int cno, String ctel, String cname, int point) {
		this.cno = cno;
		this.ctel = ctel;
		this.cname = cname;
		this.point = point;
	}

	@Override
	public String toString() {
		return cno + "\t" + ctel + "\t" + cname + "\t" + point + "\n";
	}

	public int getCno() {
		return cno;
	}

	public String getCtel() {
		return ctel;
	}

	public String getCname() {
		return cname;
	}

	public int getPoint() {
		return point;
	}
	
	
	
	
}
