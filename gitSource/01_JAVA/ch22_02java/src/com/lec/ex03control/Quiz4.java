package com.lec.ex03control;

import java.util.Scanner;

//����(0) ����(1) ��(2) �� �ϳ��� ���� �� ���� ����ϼ���. 
public class Quiz4 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int a = 0;
		System.out.print("����(0), ����(1), ��(2) �� �ϳ��� �����ϼ��� : ");
		a = sc.nextInt();
		if (a == 0) {
			System.out.print("����");
		}else if (a == 1) {
			System.out.print("����");
	}	else {
		System.out.print("��");
	}
}
}