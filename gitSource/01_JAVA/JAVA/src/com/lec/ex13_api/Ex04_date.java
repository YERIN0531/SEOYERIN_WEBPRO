package com.lec.ex13_api;

import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

public class Ex04_date {

	public static void main(String[] args) {
		Date date = new Date();//����Ʈ ��ü ���� 
		System.out.println(date);//����������
		int year = date.getYear(); //Calendar ���� YEAR�� �����ڴٴ� �� //�⵵
		int month = date.getMonth(); // �� (Calendar.MONTH) �ý����� 0���� ~11������  
		int day = date.getDate(); //��ĥ 
		System.out.printf("%d�� %d�� %d��\n",year,month,day);
		
				
		//%d(����) %f(�Ǽ�) %s(���ڿ�) %c(����)
		// %tY(��) %tm(��) %td(��) %a(����) %tH(24��) %tp(����/����) %tl(12��) %tM(��) %tS(��)
		System.out.printf("%tY�� %tm�� %td�� %ta���� %tp %tl�� %tM�� %tS��\n", date,date,date,date,date,date,date,date);
		System.out.printf("%1$tY�� %1$tm�� %1$td�� %1$ta���� %1$tp %1$tl�� %1$tM�� %1$tS��",date);
	}
}
