package com.lec.ex05beforeOOP;
import java.util.Scanner;
////����ڷκ��� ���� �Է¹޾� ���밪�� ����ϴ� ������ �����Ͻÿ�
//��, �Ű������� �޾� ���밪�� �����ϴ� �Լ��� �̿��մϴ�.
//�����ϴ� �Լ� = �޼ҵ带 �̿��մϴ�
//���� ���� ���� ��.
public class Quiz02_metohd2 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.print("���� �Է��Ͻÿ� : ");
		int su = sc.nextInt();
		num(su); // sysout �������� num(su)�� ��µǰ� �ϰ� ������ �̷��� ���. 
		
	}
	private static int num(int su) {
		if (su>=0) {
			System.out.println("�� ���� ���밪�� " + su + "�Դϴ�.");
		}else {
			System.out.println("�� ���� ���밪�� " + su*-1 + "�Դϴ�.");
		}
		return su;
	}
}
