package com.lec.ex05beforeOOP;
import java.util.Scanner;
//����ڷκ��� ���ϴ� �ܼ�(2~9) �������� ����ϴ� ���α׷��� �����Ͻÿ�
//(method(int dansu)�� ����� / do~while���̳� while�� �̿� 
public class Quiz01_method2 {
	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		int su;
		
		do {
			System.out.print("���ϴ� ������ �ܼ��� �Է��Ͻÿ� (2~9) : ");
			su = sc.nextInt();
		}while(su<=1 || su>9); //2~9���� ������ �� �ٽ� ���� 
		
		yerin(su); //���ϰ��� �ʿ䰡 ����.
	}
	private static void yerin(int su) {
		for(int i=1; i<10 ; i++) {
			System.out.println(su + "X" + i + "=" + (su*i));
		}
		
	}
}
