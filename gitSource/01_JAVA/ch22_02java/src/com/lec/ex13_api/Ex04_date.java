package com.lec.ex13_api;

import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

public class Ex04_date {

	public static void main(String[] args) {
		Date date = new Date();//데이트 객체 생성 
		System.out.println(date);//가독성저하
		int year = date.getYear(); //Calendar 에서 YEAR만 빼오겠다는 뜻 //년도
		int month = date.getMonth(); // 월 (Calendar.MONTH) 시스템은 0부터 ~11월까지  
		int day = date.getDate(); //며칠 
		System.out.printf("%d년 %d월 %d일\n",year,month,day);
		
				
		//%d(정수) %f(실수) %s(문자열) %c(문자)
		// %tY(년) %tm(월) %td(일) %a(요일) %tH(24시) %tp(오전/오후) %tl(12시) %tM(분) %tS(초)
		System.out.printf("%tY년 %tm월 %td일 %ta요일 %tp %tl시 %tM분 %tS초\n", date,date,date,date,date,date,date,date);
		System.out.printf("%1$tY년 %1$tm월 %1$td일 %1$ta요일 %1$tp %1$tl시 %1$tM분 %1$tS초",date);
	}
}
