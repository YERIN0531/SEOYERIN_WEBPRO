package com.lec.ex03control;
import java.util.Scanner;
//����ڷκ��� ����, ����, ���� ������ �Է¹޾� �� ���� ������ ��� �̻����� �������� ����غ���
public class Quiz3 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int kor, eng, mat;
		System.out.print("���� ���� : ");
		kor = sc.nextInt();
		System.out.print("���� ���� : ");
		eng = sc.nextInt();
		System.out.print("���� ���� : ");
		mat = sc.nextInt();
		
		int sum = (kor + eng + mat);
		double avg =(double)sum/3.0;
		System.out.println("�� ������ ��� ������ " + avg);
		
		if (kor >= avg) {
			System.out.println("���� ������ ��� �̻��Դϴ�");
		}else {
			System.out.println("���� ������ ��� �����Դϴ�");
		}
		
		if (eng >= avg) {
			System.out.println("���� ������ ��� �̻��Դϴ�");
		}else {
			System.out.println("���� ������ ��� �����Դϴ�");
		}
		
		if (mat >= avg) {
			System.out.println("���������� ��� �̻��Դϴ�");
		}else {
			System.out.println("���� ������ ��� �����Դϴ�");
		}
	}
}


