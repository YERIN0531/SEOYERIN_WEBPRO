package com.lec.ex08_class2;

public class StudentTestMain {
	
	public static void main(String[] args) {
		Student j = new Student("���켺", 90, 90, 90);
		Student k = new Student("���ϴ�", 90, 90, 91);
		Student h = new Student("Ȳ����", 80, 80, 80);
		Student d = new Student("������", 80, 80, 81);
		Student u = new Student("������", 70, 70, 70);
		
		
		System.out.println("����������������������������������������������������\n" + "                                                ����ǥ  ");
		System.out.println("      -------------------------------------");
		System.out.println("                    �� ��        �� ��    �� ��    �� ��      �� ��       ��� ");
		System.out.println("      -------------------------------------");
		System.out.println(j.acc());
		System.out.println(k.acc());
		System.out.println(h.acc());
		System.out.println(d.acc());
		System.out.println(u.acc());
		
		
		
		System.out.println("\n����������������������������������������������������\n");
		
		
		
	}
}
