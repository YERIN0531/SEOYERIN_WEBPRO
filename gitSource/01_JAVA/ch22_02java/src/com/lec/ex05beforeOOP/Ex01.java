package com.lec.ex05beforeOOP;
//1~10���� ������ ���� ����ϰ� / �� ���� ¦������ Ȧ������ ���
public class Ex01 {
	public static void main(String[] args) {
		int sum = 0;
		for(int i=1 ; i<11 ; i++) {//�������� 1���Ͷ�� ������ i=1����
			sum = sum+i; //sum += i;
		}
		System.out.println("1���� 10������ ������ ���� " + sum + "�Դϴ�");
//		System.out.println((sum%2==0)? "¦���Դϴ�." : "Ȧ���Դϴ�.");
		String msg;
		if(sum%2==0) {
			msg = "¦���Դϴ�.";
		}else {
			msg = "Ȧ���Դϴ�.";
		}
		System.out.println(msg);
	}
}
