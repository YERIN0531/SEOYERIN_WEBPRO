package com.lec.ex03control;
//�������̶� ���� �ϴ� ��.
//1~10������ ���� ���غ��� (�������� ������ 1�� �ʱ�ȭ)
public class Quiz8_for2 {
	public static void main(String[] args) {
		int tot = 1;
		for(int i=1 ; i<=10 ; i++) {
			tot *= i;// tot = tot*1
		}
		System.out.println("1~10������ ����" + tot);
	}
}