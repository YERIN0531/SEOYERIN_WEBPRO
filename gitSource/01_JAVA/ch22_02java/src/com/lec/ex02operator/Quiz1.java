package com.lec.ex02operator;
//����ڷκ��� �Է¹��� ���� 3�� ������� ���� ���
import java.util.Scanner; // inport = ~�޸𸮿� �÷��� ��� ���� ��ɹ�

public class Quiz1 {
	public static void main(String[] args) { 
		Scanner scanner = new Scanner(System.in); //API�� �Ҷ� �Ұ���
		System.out.print("���� �Է��ϼ��� : ");
		int su = scanner.nextInt(); // ����ڷκ��� ���� �Է� �ޱ� 
		String result = su%3 == 0 ? "�Է��Ͻ� ���� 3�� ����Դϴ�." : "�Է��Ͻ� ���� 3�� ����� �ƴմϴ�.";
		System.out.println(result);
		result = su%2 ==0 ? "�Է��Ͻ� ���� ¦���Դϴ�." : "�Է��Ͻ� ���� Ȧ�� �Դϴ�.";
		System.out.println(result);
		//scanner�� ��� ���� �ִ� �� ������ scanner.close();
	}
}
