package com.lec.ex14_exception;

import java.util.Date;

public class TestMain {

	public static void main(String[] args) {
//		System.out.println(System.currentTimeMillis());
//		currentTimeMillis �� getTime �� 0.2�� ���� �ۿ� ���� �ȳ�.. �� �Լ��� �ϳ� ����
		// getTime�� Date ��ü���� Ÿ���� �� �ϴ� �� 
//		Date now = new Date();
//		System.out.println(now.getTime);
		
		BookLib book1 = new BookLib("890��-01","java","ȫ�浿");
		BookLib book2 = new BookLib("890��-02","DBMS","�̵��");
		System.out.println(book1);
		try {
			book1.checkOut("�����");
		} catch (Exception e) {
			System.out.println("���� �޼��� : " +e.getMessage());
		}
		// ������ ���� ----> ������ ������ �ݳ��ϴ°� �ϰ� ������, ��ü�� ���°� Ȯ���غ����� ���� ���� �ϴ� �� 
		book1.setCheckoutDate(new Date(122, 2, 11)); // 3�� 11�Ͽ� ���������� ���� 
		System.out.println(book1);
		try {
			book1.checkIn();
		} catch (Exception e) {
			System.out.println("���� �޼��� : " +e.getMessage());
		}
		System.out.println(book1);
		
		
	}
}
