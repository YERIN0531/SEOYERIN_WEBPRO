package com.lec.ex05beforeOOP;
import java.util.Scanner;
//�޼ҵ��� ����� ȣ�� 
//����ڷκ��� ���� �Է¹޾�, �Է¹��� ��  ���丮��(!) ����ϱ� (���丮�� ����ϴ� �޼ҵ� �̿�)
public class Ex06_factorial {
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
	private static long factorial(int su){//result�� �־�� �ϴ� �Ҵ� long �ְ�, �Ű������� su�� �Ȱ��� Ÿ�� ������ �� 
		int result = 1; //���ҰŸ� �������� 1 ����
		for (int i=su ; i>=1 ; i--) {
			result *= i; //result = result * i;
		}
		return result;
	}
}











