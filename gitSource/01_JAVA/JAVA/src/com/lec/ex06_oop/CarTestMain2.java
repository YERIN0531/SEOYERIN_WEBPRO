package com.lec.ex06_oop; //car.java�� ���� ��Ű���� ������ import�� �ʿ� ����
public class CarTestMain2 {
	public static void main(String[] args) {
	    // int i =10; �� ���� ������ �����ϴ°Ͱ� ����. int�� �ҹ��ڷ� �����ϱ� ������ i�ȿ� �� ��
		Car02 myPorsche = new Car02(); 
		myPorsche.setColor("red");   
		System.out.println(myPorsche.getColor() +"�� ���� "+
							"��ⷮ :"+myPorsche.getCc() + " �ӵ�" + myPorsche.getSpeed());
		myPorsche.drive(); 
		myPorsche.park();
		myPorsche.race();
		System.out.println("���� �ӵ��� "+ myPorsche.getSpeed() +" �Դϴ�.");
		
		Car02 yourPorsche= new Car02(); 
		yourPorsche.setColor("�׷���");
		yourPorsche.drive();
		
		
		
	}
}
