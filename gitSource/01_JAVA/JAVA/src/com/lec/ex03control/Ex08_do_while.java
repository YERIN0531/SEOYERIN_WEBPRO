package com.lec.ex03control;
import java.util.Scanner;
// ¦���� �Է¹޴� ���α׷� ���� 
public class Ex08_do_while {
	
	public static void main(String[] args) {
		int num;
		Scanner scanner = new Scanner(System.in);
		do {
			System.out.print("¦���� �Է��ϼ��� : ");
			num = scanner.nextInt();
		}while(num%2 != 0);
		System.out.print("�Է��Ͻ� ���� ¦�� " + num + "�Դϴ�");
		scanner.close();
	}
}
