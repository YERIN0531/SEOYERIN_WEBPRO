package com.lec.ex02operator;
import java.util.Scanner;
//Quiz2 �Է��Ͻ� ���� ¦������ Ȧ������ ���

public class Quiz2 {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		System.out.print("���� �Է��ϼ��� : ");
		int su = scanner.nextInt();
		String result = su%2 == 0 ? "�Է��Ͻ� ���� ¦�� �Դϴ�." : "�Է��Ͻ� ���� Ȧ�� �Դϴ�.";
		System.out.println(result);
		scanner.close();
		
	}
}
