package com.lec.ex06_oop;
// Car ��� Ŭ������ �� �̻ڰ� ����� ��� 
// �÷��� �����ϴ� �޼ҵ�, ���ǵ� �����ϴ� �޼ҵ�, cc �����ϴ� �޼ҵ�
// �÷��� �����ϴ� ���� �ʿ��ϰ�, ���ǵ尪 �����ϴ� �޼ҵ�..���
// �̷��� �ϴٺ��� ���� �ʿ��� �޼ҵ尡 6�� �Ѿ. 
// class : ������(�Ӽ�, �ν��Ͻ�����)�� �޼ҵ� (���(���� �� ���), setter(����� �����ϱ� ���� �Լ�), getter(���� ������ ���� �޼ҵ�))
// 27�� ���� ���� �ȵ�. �ٽ� �����ϱ� 
public class Car02 { //private ~~~ �����Ͱ� ���� �� 
	private String color; // ����
	private int    cc;    // ��ⷮ
	private int    speed; // �ӵ�

	public void drive() {
		speed = 60; 
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
	
	
	// setter & getter (color, cc, speed) / setter�� getter�� ����� ġ�� �ȵ� . ������ �Լ��� ���� set+color => setColor 
	// myPorsche.setColor("red") //�Ű������� Į�� 
	public void setColor(String color) {//������ �ʿ� ������ void 
		this.color = color; 	  //(String a) ��� ���� �ؿ� color =a ; ���� �־��൵ ��.)
	  //this�� ���� �� ��ü�� Į�� ����. �׳� color�� ���� ���������� ������ ��ü������ color�� �浹�� �Ͼ
	}
	public void setCc(int cc) { // myPorsche.setCc(1500)
		this.cc = cc;
	}
	public void setSpeed(int speed) {
		this.speed = speed;
	}
	//myPorsche.getColor()
	public String getColor() {
		return color;
	}
	public int getCc() {
		return cc;
	}
	public int getSpeed() {
		return speed;
	}
}




















