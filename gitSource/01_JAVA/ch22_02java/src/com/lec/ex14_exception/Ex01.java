package com.lec.ex14_exception;
//����ó���� ���� ���� ���� 
import java.util.Scanner;

public class Ex01 {

	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		System.out.print("��Ģ������ �� ù��° �� : ");
		int i = scanner.nextInt(); //******************** ����ڰ� ������ �ƴ� ���� Ȥ�� 0�� �������� ���� 
		System.out.print("��Ģ������ �� �ι�° �� : ");
		int j = scanner.nextInt(); //******************** ����ڰ� ������ �ƴ� ���� Ȥ�� 0�� �������� ����
		System.out.println("i = " + i + "  j = " + j);
		System.out.println("i X j = " + (i*j));
		System.out.println("i / j = " + (i/j)); //******* ���ܰ� �߻��� �� �ִ� �κ� 
		System.out.println("i + j = " + (i+j));
		System.out.println("i - j = " + (i-j));
		System.out.println("DONE");
		scanner.close();
	}
}
