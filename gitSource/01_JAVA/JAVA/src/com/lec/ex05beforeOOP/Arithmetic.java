package com.lec.ex05beforeOOP;

public class Arithmetic { //main �Լ��� ���� ������ �޸𸮿� �÷����⸸��
	public int abs(int value) {
		int result = value>=0 ? value : -value;
		return result;
	}
	
	public static int sum(int to) { // �Լ��� �����ε�
		int result = 0;
		for(int i=1 ; i<=to ; i++) {
			result += i; //result = result + i; 
		}
		return result;
	}
	public static int sum(int from, int to) { // from ~ to���� ������ ��� return
		int result = 0;
		for(int i=from ; i<=to ; i++) {
			result += i; //result = result + i; 
		}
		return result;
	}
	public static String evenOdd(int value) {
		return value%2==0 ? "¦���Դϴ�" : "Ȧ���Դϴ�";

	}
}
