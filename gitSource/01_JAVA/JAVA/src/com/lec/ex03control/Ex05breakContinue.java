package com.lec.ex03control;
// break : ���� ������ ���� ����
// continue : ���� ������ ���߰� �����κ����� ��
public class Ex05breakContinue {
	public static void main(String[] args) {
		for(int i=0; i<=5 ; i++) {
			if(i==3) {
//				break; // �ݺ��� ���� ���� ����
				continue; // 3�϶� ���� ������ ���߱� ������ ����ϸ� 3�� �ȳ���.
			}
			System.out.println(i+ ". �ȳ�");
		}
	}
}
