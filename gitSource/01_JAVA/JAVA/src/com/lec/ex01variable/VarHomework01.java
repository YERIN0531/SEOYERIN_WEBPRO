package com.lec.ex01variable;

public class VarHomework01 {
	public static void main(String[] args) {
		int k1 = 100;
		int e1 = 90;
		int m1 = 90;
		
		System.out.println("��������" + k1);
		System.out.println("��������" + e1);
		System.out.println("��������" + m1);
		System.out.println("����" +(k1+e1+m1));
		System.out.println("���" +((k1+e1+m1)/3.0)); //(�ٽ��غ���)
		
		k1 = 100;
		e1 = 90;
		m1 = 90;
		
		System.out.println("��������" + k1);
		System.out.println("��������" + e1);
		System.out.println("��������" + m1);
		
		int t1 = k1+e1+m1;
		double a1 = t1 / 3.0;
		System.out.println("����"+t1);
		System.out.println("���"+a1);
		
		//������Ǯ��
		int kor = 99;
		int mat = 100;
		int eng = 99; //int kor =90;, int mat = 100;, int eng = 95; �ص� ������ ������ ����)
		int sum = kor + mat + eng;
		double avg = sum/3.0;
		System.out.printf("����� %d��, ������%d��, �����%d���Դϴ�.\n", kor, mat, eng);
		System.out.printf("������ %d��. �����%.1f", sum, avg);
		
	}
}
