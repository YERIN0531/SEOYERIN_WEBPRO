package com.lec.ex13_api;

import java.text.DecimalFormat;

public class Ex01 {

	public static void main(String[] args) {
		double num = 12300000000000L; //0.123 * 10�� 13�� -> 1.23E13
		DecimalFormat df0 = new DecimalFormat("00000000"); //0�� 8��. 8�ڸ��� ����϶�� ��
		System.out.println(df0.format(num));
		DecimalFormat df1 = new DecimalFormat("########");// #�� 8�� : 8�ڸ��� ��� 
		System.out.println(df1.format(num)); //0���� ���� �տ� 0�� �پ ���� 
		DecimalFormat df2 = new DecimalFormat("0,000.000"); // 3�ڸ� ���� �޸� ���, �Ҽ��� 3�ڸ� ��� 3�ڸ��� ������ 0�� ��� 
		System.out.println(df2.format(num));
		DecimalFormat df3 = new DecimalFormat("#,###.##%");
		System.out.println(df3.format(num));
		DecimalFormat df4 = new DecimalFormat("#.##E00");
		System.out.println(df4.format(num));
	}
}
