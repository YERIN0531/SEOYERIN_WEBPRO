package com.lec.ex05beforeOOP;
import java.util.Scanner;
////����ڷκ��� ���� �Է¹޾� ���밪�� ����ϴ� ������ �����Ͻÿ�
//��, �Ű������� �޾� ���밪�� �����ϴ� �Լ��� �̿��մϴ�.
//�����ϴ� �Լ� = �޼ҵ带 �̿��մϴ�
//�������� �������ֽŰ�.. 
public class Quiz02_metohd {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.print("���� �Է��Ͻÿ� : ");
		int su = sc.nextInt();
		System.out.println("�� ���� ���밪�� " + num(su) + "�Դϴ�.");
		
	}
	private static int num(int su) {
		if (su>=0) {
			return su;
		}else {
			return -su;
		}
	}
}
