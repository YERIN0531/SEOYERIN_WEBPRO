package com.lec.ex06_oop; //car.java와 같은 패키지기 때문에 import할 필요 없음
public class CarTestMain {
	public static void main(String[] args) {
	    // int i =10; 과 같이 변수를 선언하는것과 같다. int는 소문자로 시작하기 때문에 i안에 딱 들어감
		Car myPorsche = new Car(); // myporsche라는 변수가 있고, n번째에 가면 컬러, cc, 스피드, 레이스 등이 있음
		myPorsche.color = "빨강";   // myporsche라는 메모리 공간에 color를 찾는 것. calor가 레드로 바뀜
							       // youtPorsche의 color는 red로 안바뀜 
		System.out.println(myPorsche.color +"색 차의 "+
							"배기량 :"+myPorsche.cc + " 속도" + myPorsche.speed);
		myPorsche.drive();// 메소드 실행하기 
		myPorsche.park();
		myPorsche.race();
		System.out.println("현재 속도는 "+ myPorsche.speed +" 입니다."); //위에서 레이스를 달린 후기 때문에 속도는 120이 출력됨 
		
		Car yourPorsche= new Car(); //변수 두개 설정하는 거 (변수는 100개 1000개도 더 만들수 있음)
		yourPorsche.color = "그레이";
		System.out.println(yourPorsche.color + "색 차");
		yourPorsche.drive();
		
		
		
	}
}
