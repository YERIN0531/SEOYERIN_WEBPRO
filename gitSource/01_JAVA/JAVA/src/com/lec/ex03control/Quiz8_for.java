package com.lec.ex03control;
//1~10������ ���� ���غ��� (�������� ������ 1�� �ʱ�ȭ)
public class Quiz8_for {
	public static void main(String[] args) {
		int tot = 1;
		for(int i=1 ; i<=10 ; i++ ) {
			tot = tot * i;
		}
		System.out.println("1~10������ ��������" + tot);
	}
}
