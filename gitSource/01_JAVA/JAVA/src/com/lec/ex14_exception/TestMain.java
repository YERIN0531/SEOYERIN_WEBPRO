package com.lec.ex14_exception;

import java.util.Date;

public class TestMain {

	public static void main(String[] args) {
//		System.out.println(System.currentTimeMillis());
//		currentTimeMillis 와 getTime 은 0.2초 정도 밖에 차이 안남.. 두 함수중 하나 골라라
		// getTime은 Date 객체에다 타임을 겟 하는 것 
//		Date now = new Date();
//		System.out.println(now.getTime);
		
		BookLib book1 = new BookLib("890ㄱ-01","java","홍길동");
		BookLib book2 = new BookLib("890ㄱ-02","DBMS","이디비");
		System.out.println(book1);
		try {
			book1.checkOut("김빌림");
		} catch (Exception e) {
			System.out.println("예외 메세지 : " +e.getMessage());
		}
		// 대출일 조작 ----> 대출한 다음에 반납하는거 하고 싶은데, 연체료 묻는거 확인해보려고 굳이 조작 하는 것 
		book1.setCheckoutDate(new Date(122, 2, 11)); // 3월 11일에 대출함으로 수정 
		System.out.println(book1);
		try {
			book1.checkIn();
		} catch (Exception e) {
			System.out.println("예외 메세지 : " +e.getMessage());
		}
		System.out.println(book1);
		
		
	}
}
