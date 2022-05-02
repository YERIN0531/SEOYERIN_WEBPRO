package com.lec.ex08_class2;

public class Product {

	private int serialNo; //객체 고유의 번호 101, 102, 103......
	public static int count=100;
	public Product() {
		 serialNo = ++count;
	}
	public void infoPrint() {
		System.out.println("serialNo = " + serialNo +"\t공유변수 count =" + count);
	}
	public int getSerialNo() {
		return serialNo;
	
	}
	public void setSerialNo(int serialNo) {
		this.serialNo = serialNo;
	}
	
}
