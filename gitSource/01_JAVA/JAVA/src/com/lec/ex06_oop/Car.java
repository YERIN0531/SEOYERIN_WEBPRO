package com.lec.ex06_oop;
// class : �� �ȿ��� ������(�Ӽ�, �ν��Ͻ�����)�� �޼ҵ�� �̷���� ����.
// Car c = new Car() // c��� ���� �ȿ� �ּ� ���ǵ� ��ũ ����� �־� ���� �۾�
// c.park() //������ �ϱ� ����  // c�� �ִ� ��ũ�� ã�ư��� 
//�� Ŭ������ ��ü ���赵��� �����ϸ� ��. 
public class Car { 
	//�����Ͷ� �޼ҵ带 �� ���� �÷�����.
	String color; // ����
	int    cc;    // ��ⷮ
	int    speed; // �ӵ�
	
	// �޼ҵ� �ø���
	public void drive() {
		speed = 60; //speed��� ���� �ȿ� 60�� �־��
		System.out.println(color + "�� ���� �����Ѵ�. ���� �ӵ� : "+speed);
	}
	public void park() {
		speed = 0;
		System.out.println(color + "�� ���� �����Ѵ�. ���� �ӵ� : "+speed);
	}
	public void race() {
		speed = 120;
		System.out.println(color + "�� ���� �����Ѵ�. ���� �ӵ� : "+speed);
	}
}
