package com.lec.ex06_oop; //car.java�� ���� ��Ű���� ������ import�� �ʿ� ����
public class CarTestMain {
	public static void main(String[] args) {
	    // int i =10; �� ���� ������ �����ϴ°Ͱ� ����. int�� �ҹ��ڷ� �����ϱ� ������ i�ȿ� �� ��
		Car myPorsche = new Car(); // myporsche��� ������ �ְ�, n��°�� ���� �÷�, cc, ���ǵ�, ���̽� ���� ����
		myPorsche.color = "����";   // myporsche��� �޸� ������ color�� ã�� ��. calor�� ����� �ٲ�
							       // youtPorsche�� color�� red�� �ȹٲ� 
		System.out.println(myPorsche.color +"�� ���� "+
							"��ⷮ :"+myPorsche.cc + " �ӵ�" + myPorsche.speed);
		myPorsche.drive();// �޼ҵ� �����ϱ� 
		myPorsche.park();
		myPorsche.race();
		System.out.println("���� �ӵ��� "+ myPorsche.speed +" �Դϴ�."); //������ ���̽��� �޸� �ı� ������ �ӵ��� 120�� ��µ� 
		
		Car yourPorsche= new Car(); //���� �ΰ� �����ϴ� �� (������ 100�� 1000���� �� ����� ����)
		yourPorsche.color = "�׷���";
		System.out.println(yourPorsche.color + "�� ��");
		yourPorsche.drive();
		
		
		
	}
}
