package com.lec.ex13_api;
//SimpleDateFormat ��¥�� ������ -> ���ϴ� format���� ����ϴ� �� 
//DecimalFormat ������ ������ -> ���ϴ� format���� ����ϴ� �� 
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

public class Ex05_SimpleDateFormat {

	public static void main(String[] args) {
		Date 				now1 = new Date();
		Calendar 			now2 = Calendar.getInstance();
		GregorianCalendar 	now3 = new GregorianCalendar();
//		System.out.println(now1); // Mon Mar 28 17:35:33 KST 2022 �̷��� ��µ�
		System.out.println(now2); //java.util.GregorianCalendar[time=1648456533807,areFieldsSet=true,areAllFieldsSet=true,.......] �̷��� ��µ�
		System.out.println(now3); //java.util.GregorianCalendar[time=1648456533823,areFieldsSet=true,areAllFieldsSet=true,.......] �̷��� ��µ� 
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy�� MM�� dd�� E���� a hh�� mm�� ss��");
		/*yyyy(�⵵4�ڸ�) yy(�⵵ 2�ڸ�) M(3) MM(03) d(9) dd(09)
		 * E(����) a(����/����) H(24�ð�) h(12�ð�) m(��) s(��)
		 * w(�̹��⵵�� ����� ������) D(���� ���° ������) */
		System.out.println(sdf.format(now1));
		System.out.println(sdf.format(now2.getTime()));
		System.out.println(sdf.format(now3.getTime()));
	}
}
