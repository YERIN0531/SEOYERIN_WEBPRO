package com.lec.ex06_oop; //car.java와 같은 패키지기 때문에 import할 필요 없음
public class CarTestMain2 {
	public static void main(String[] args) {
	    // int i =10; 과 같이 변수를 선언하는것과 같다. int는 소문자로 시작하기 때문에 i안에 딱 들어감
		Car02 myPorsche = new Car02(); 
		myPorsche.setColor("red");   
		System.out.println(myPorsche.getColor() +"색 차의 "+
							"배기량 :"+myPorsche.getCc() + " 속도" + myPorsche.getSpeed());
		myPorsche.drive(); 
		myPorsche.park();
		myPorsche.race();
		System.out.println("현재 속도는 "+ myPorsche.getSpeed() +" 입니다.");
		
		Car02 yourPorsche= new Car02(); 
		yourPorsche.setColor("그레이");
		yourPorsche.drive();
		
		
		
	}
}
