package com.lec.ex02operator;
import java.util.Scanner;
//Quiz 4 ���̸� �Է¹޾� �Է¹��� ���̰� 65�� �̻��϶�, "��ο��" ���, �ƴϸ� "�Ϲ�" ��� 

public class Quiz4 {
	public static void main(String[] args) { 
		Scanner scanner = new Scanner(System.in);
		System.out.print("���̸� �Է��ϼ��� :  ");
		int su = scanner.nextInt();
		String result;
		result = (su >= 65)  ? "��ο��" : "�Ϲ�";
		   System.out.println(result);
		   
		
	
				
	}
}
