package com.lec.ex13_api;

import java.util.Calendar;
import java.util.GregorianCalendar;

public class Ex01_calendar {

	public static void main(String[] args) {
		Calendar cal = Calendar.getInstance(); // 날짜와 시com.lec.ex02_date간을 표현할때 많이 쓰이는 클래스.. 싱글톤클래스 
//		GregorianCalendar cal = new GregorianCalendar();
		System.out.println(cal);//가독성저하
		int year = cal.get(Calendar.YEAR); //Calendar 에서 YEAR만 빼오겠다는 뜻 //년도
		int month = cal.get(Calendar.MONTH)+1; // 월 (Calendar.MONTH) 시스템은 0부터 ~11월까지  
		int day = cal.get(Calendar.DAY_OF_MONTH); //며칠 
		int week = cal.get(Calendar.DAY_OF_WEEK); //요일 / 일1, 월2, 화3, 수4, 목5, 금6, 토7 //스위치문에서 출력되기 때문에 printf에 안넣는것
		int hour24 = cal.get(Calendar.HOUR_OF_DAY);//현 날짜로 부터 몇시간 지났니 (24시간단위)
		int ampm = cal.get(Calendar.AM_PM); // 0(오전), 1(오후)
		int hour = cal.get(Calendar.HOUR);//12시간 단위
		int minute = cal.get(Calendar.MINUTE);//분
		int second = cal.get(Calendar.SECOND);//초
		int millisec = cal.get(Calendar.MILLISECOND); //밀리세컨 단위
		
		
		
		
		System.out.printf("%d년%d월%d일",year,month,day);
		switch(week) {
		case 1: System.out.print("일요일");break;
		case 2: System.out.print("월요일");break;
		case 3: System.out.print("화요일");break;
		case 4: System.out.print("수요일");break;
		case 5: System.out.print("목요일");break;
		case 6: System.out.print("금요일");break;
		case 7: System.out.print("토요일");break;
		}
		System.out.print(ampm== 0 ? "오전" : "오후");
		System.out.printf("%d시%d분%d초%d\n",hour, minute, second, millisec);
		System.out.printf("%d시%d분%d초%d\n",hour24, minute, second, millisec);
	
		//%d(정수) %f(실수) %s(문자열) %c(문자)
		// %tY(년) %tm(월) %td(일) %a(요일) %tH(24시) %tp(오전/오후) %tl(12시) %tM(분) %tS(초)
		System.out.printf("%tY년 %tm월 %td일 %ta요일 %tp %tl시 %tM분 %tS초\n", cal,cal,cal,cal,cal,cal,cal,cal);
		System.out.printf("%1$tY년 %1$tm월 %1$td일 %1$ta요일 %1$tp %1$tl시 %1$tM분 %1$tS초",cal);
	}
}
