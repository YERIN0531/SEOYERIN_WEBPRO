package com.lec.ex02operator;

import java.util.Scanner;

//Quiz 5 ����, ����, ���� ������ ������ �Ҵ��ϰ� �� ������ ����ϰ� ����, ���(�Ҽ���2�ڸ�����) ����ϴ� ���α׷��� ���� �Ͻÿ� (����ڷκ��� �ޱ�, nextint ���� �ޱ�)
public class Quiz5 {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		System.out.print("����: ");
		int kor = scanner.nextInt();
		System.out.print("����: ");
		int eng = scanner.nextInt();
		System.out.print("����: ");
		int mat = scanner.nextInt();
		
		int sum = kor + eng + mat;
		double avg = (double)sum/3.0;
		System.out.printf("���� : %d��, ��� : %.2f��", sum, avg);
				
		
		
	}
}
