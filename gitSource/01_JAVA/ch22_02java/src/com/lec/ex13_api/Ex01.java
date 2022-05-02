package com.lec.ex13_api;

import java.text.DecimalFormat;

public class Ex01 {

	public static void main(String[] args) {
		double num = 12300000000000L; //0.123 * 10의 13승 -> 1.23E13
		DecimalFormat df0 = new DecimalFormat("00000000"); //0이 8개. 8자리를 출력하라는 뜻
		System.out.println(df0.format(num));
		DecimalFormat df1 = new DecimalFormat("########");// #이 8개 : 8자리를 출력 
		System.out.println(df1.format(num)); //0으로 쓰면 앞에 0이 붙어서 나옴 
		DecimalFormat df2 = new DecimalFormat("0,000.000"); // 3자리 마다 콤마 찍고, 소숫점 3자리 출력 3자리가 없으면 0을 출력 
		System.out.println(df2.format(num));
		DecimalFormat df3 = new DecimalFormat("#,###.##%");
		System.out.println(df3.format(num));
		DecimalFormat df4 = new DecimalFormat("#.##E00");
		System.out.println(df4.format(num));
	}
}
