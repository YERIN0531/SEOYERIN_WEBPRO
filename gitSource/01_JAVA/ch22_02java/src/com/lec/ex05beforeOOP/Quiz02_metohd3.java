package com.lec.ex05beforeOOP;
import java.util.Scanner;
////����ڷκ��� ���� �Է¹޾� ���밪�� ����ϴ� ������ �����Ͻÿ�
//��, �Ű������� �޾� ���밪�� �����ϴ� �Լ��� �̿��մϴ�.
//�����ϴ� �Լ� = �޼ҵ带 �̿��մϴ�
//������ �� �ٽ� Ȯ���ϱ� �ؿ��ִ°� �޾����� �� (todayll class)
public class Quiz02_metohd3 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.print("���� �Է��Ͻÿ� : ");
		int su = sc.nextInt();
		int result = abs(su);
		System.out.println("�� ���� ���밪�� " + result + "�Դϴ�.");
		
	}
	private static int abs(int su) {
		if (su>=0) {
			return su;
		}else {
			return -su;
		}
	}
}
