package com.lec.ex13_api;

import java.util.GregorianCalendar;

public class Ex03_gc_term {

	public static void main(String[] args) {
		GregorianCalendar gcNow = new GregorianCalendar(); // ���� ������ ��¥�� �ð� 
		GregorianCalendar gcThat = new GregorianCalendar(2022, 2, 11, 9, 30);//��ǻ�� ���忡�� 2���� 3���� 
																			// ���� ������ ��¥�� �ð� 
		long start = gcThat.getTimeInMillis(); //���� ���� (1970��~�������� ������ �и�����)
		long end   = gcNow.getTimeInMillis();// 1970~���� ������ �и�����
		int day = (int)(end-start)/(1000*60*60*24);//����ȯ ����ߵ� 
				// 			1000 ���� ������ ���� ��������, 60���ϸ� ��� ������?, 60���ϸ� ��ð� ������? 24 ���ϸ� ����������
		System.out.println("�����Ϻ��� ������� ���� �������� " + day + "��");
		
	}
}
