package com.lec.ex12_pattern;

public class TestMain2 {
	public static void main(String[] args) {
		//���������� �̷��� �� �� . �̱��� ������ Ȱ�������� new�� �� �� 
//		SingletonClass obj1 = new SingletonClass();
//		SingletonClass obj2 = new SingletonClass();
//		obj1.setI(99);
//		System.out.println("obj1�� i : " + obj1.getI());
//		System.out.println("obj2�� i : " + obj2.getI());
		
		SingletonClass obj1 = SingletonClass.getInstance();
		SingletonClass obj2 = SingletonClass.getInstance();
		//obj1�� obj2�� ����Ű�°� ������.(�ݴ뵵 ��������) obj1�� �ٲ�� obj2�� �ٲ� 
		//��? instance���� ����Ű�� ��ü�� �ּҸ� ����Ű�� �Ǿ� ����. 
		// instance���� ����� ���� new SingletonClass ��� ��ü�� ����Ű�� �ּҰ�. 
		obj1.setI(99);
		System.out.println("obj1�� i : " + obj1.getI());
		System.out.println("obj2�� i : " + obj2.getI());
		obj2.setI(10);
		System.out.println("obj1�� i : " + obj1.getI());
		System.out.println("obj2�� i : " + obj2.getI());
	}
}
