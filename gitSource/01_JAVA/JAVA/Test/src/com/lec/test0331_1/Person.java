package com.lec.test0331_1;
//�̸� ȫ�浿, ��ȭ��ȣ 010-9999-9999
// ������ ���� ��°���� �������� �̸�(name)�� ��ȭ��ȣ(tel) �����͸� ����,
//������ �Լ��� ���� Ŭ������ �����ϰ� ���� ����� ����� ����ϵ��� �ڹ����α׷����� �����Ͻÿ�
public class Person {

	private String name;
	private String phoneNo;
	
//	public Person() {};
	public Person(String name, String phoneNo) {
		this.name = name;
		this.phoneNo = phoneNo;
	}

	@Override
	public String toString() {
		return "�̸�  " + name + ", ��ȭ��ȣ  " + phoneNo;
	}
	
	
	
	
	
}
