package com.lec.ex08_class2;

public class Product {

	private int serialNo; //��ü ������ ��ȣ 101, 102, 103......
	public static int count=100;
	public Product() {
		 serialNo = ++count;
	}
	public void infoPrint() {
		System.out.println("serialNo = " + serialNo +"\t�������� count =" + count);
	}
	public int getSerialNo() {
		return serialNo;
	
	}
	public void setSerialNo(int serialNo) {
		this.serialNo = serialNo;
	}
	
}
