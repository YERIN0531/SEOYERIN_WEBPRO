package com.lec.ex03control;
import java.util.Scanner;
//����ڷκ��� ������ �Է¹޾� ������ ���.
public class Ex01_hakjum {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.print("���� : ");
		int score = sc.nextInt();
		
		//if ���� ���, if ���ǹ� ���� 2������ ������� , &&�� Ȱ���غ���
		if(90 <= score && score <= 100) {
			System.out.println("A����");
		}else if(80 <= score && score <90) {
			System.out.println("B����");
		}else if(70 <= score && score <60) {
			System.out.println("C����");
		}else if(60 <= score && score <70) {
			System.out.println("D����");
		}else if(0 <= score && score <60) {
			System.out.println("F����");
		}else {
			System.out.println("��ȿ�� ������ �ƴմϴ�");
		}
		sc.close();
	}
}
