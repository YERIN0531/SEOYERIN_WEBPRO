package com.lec.ex03control;
import java.util.Scanner;
//����ڷκ��� ������ �Է¹޾� ������ ���.
public class Ex01_hakjum03_practice {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.print("������ �Է��ϼ��� : ");
		int su = sc.nextInt();
		
		if(su>=85) {
			System.out.println("A����");
		}else if(su>=70) {
			System.out.println("B����");
		}else if(su>=60) {
			System.out.println("C����");
		}else if(su>=45) {
			System.out.println("D����");
		}else if(su<45){
			System.out.println("F����");
		}else {
			System.out.println("���� �߸� �Է��ϼ̽��ϴ�.");
		}
		
		
		
}
}

