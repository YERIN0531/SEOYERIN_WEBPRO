package com.lec.ex01variable;
//�Ǽ��϶� ���� �����ϱ� 
public class VarEX05 {
	public static void main(String[] args) {
		float f1, f2;
		f1 = 10.1f; // ū���� ���� �ָӴϿ� �������� �ϴ� ���� ���� ��. 10.1�� ū ���� f�� ���� �ָӴ�, double�� ū �ָӴ�
		//�ְ� ������ ���ڵڿ� �빮�� Ȥ�� �ҹ��� f �� �ٿ� ������ �ƴ��� �����ָ� ���� 
		System.out.println("f1="+f1);
		f1 = 10.0000017f;
		double d = 10.0000017;
		System.out.println("f1="+f1);//�Ҽ����� ������� ������ ���� ������.. 
		System.out.println("d="+d); //�Ҽ����� ������� double d ����ߵ�.
		//[�ؿ� ���ô� ���糯 �� �κ� �׳� �̷��� �ִ� ��� �� ������ ����ϱ�]
		f1= 10.1f;
		d = 10.1;
		if (f1==d) 
			System.out.println("�� ������ ����");
		else
			System.out.println("�� ������ �ٸ���");
	}
}
