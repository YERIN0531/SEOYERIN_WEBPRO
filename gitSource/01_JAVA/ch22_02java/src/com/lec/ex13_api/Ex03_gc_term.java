package com.lec.ex13_api;

import java.util.GregorianCalendar;

public class Ex03_gc_term {

	public static void main(String[] args) {
		GregorianCalendar gcNow = new GregorianCalendar(); // 지금 현재의 날짜와 시간 
		GregorianCalendar gcThat = new GregorianCalendar(2022, 2, 11, 9, 30);//컴퓨터 입장에선 2월이 3월임 
																			// 개강 시점의 날짜와 시간 
		long start = gcThat.getTimeInMillis(); //개강 시점 (1970년~개강시점 사이의 밀리세컨)
		long end   = gcNow.getTimeInMillis();// 1970~현재 사이의 밀리세컨
		int day = (int)(end-start)/(1000*60*60*24);//형변환 해줘야됨 
				// 			1000 으로 나누면 몇초 지났는지, 60곱하면 몇분 지났지?, 60곱하면 몇시간 지났지? 24 곱하면 몇주지났지
		System.out.println("개강일부터 현재까지 몇일 지났는지 " + day + "일");
		
	}
}
