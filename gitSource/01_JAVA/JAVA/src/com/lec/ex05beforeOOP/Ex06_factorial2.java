package com.lec.ex05beforeOOP;
import java.util.Scanner;
//�޼ҵ��� ����� ȣ�� 
//����ڷκ��� ���� �Է¹޾�, �Է¹��� ��  ���丮��(!) ����ϱ� (���丮�� ����ϴ� �޼ҵ� �̿�)
public class Ex06_factorial2 {
	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		int su;
		
		do {
			System.out.print("����� �Է��ϼ��� : ");
			su = sc.nextInt();
		}while(su<=0);
		
		long result = factorial(su); //���丮�� ����ϴ� �Լ��� ����
		System.out.println("�Է��Ͻ�" + su + "! = " + result);
		System.out.printf("�Է��Ͻ� %d != %d", su, result);
			//factorial �Լ� ���� �ȸ�������� �Ʒ��� �Լ� ������! but ����ڰ� ����� �Է� ���Ҽ��� ������ 
		//�ѹ��� �� ��ȸ�� ��� �ϴ� do~while�� ������� . 
	}
	private static long factorial(int su) { //su�� 1�ʰ��� ��� - su*factorial(su-1)
		if (su==1) { //���� 1�̸� 1*���丮�� 0�̱� ������ ���� �ȵ�. �׳� 1�ϰ�츦 if���� ���� �� �ٷ� return
			return 1;
		}else {
			return su * factorial(su-1); //����� �Լ� ȣ�� 
		}
	
	}
}











