package com.lec.ex05beforeOOP;
// Arithmetic.sum / evenOdd (static) vs. abs(�Ϲ�)
public class Ex03 {
	public static void main(String[] args) {
		int tot = Arithmetic.sum(10); //Arithmetic�� �ִ� sum �� ���ڴ�.
		System.out.println("1~10���� ���� " + tot);
		System.out.println(Arithmetic.evenOdd(tot));
		//static�� ������� ���� ���. class�� static�� ������ �÷������� = ��üȭ ��Ų��.
		Arithmetic ar = new Arithmetic();
		//( Ŭ�����̸� )(�����̸��������) = (���赵���� �޸� ������ �ø���� new�� �ʿ� )(Ŭ�����̸�)();
		System.out.println(ar.abs(-8)); // ar�� abs�� ����ֱ� ������ �ҷ� ������ ar.abs(�Ű�����) ��� �����
	}
}
