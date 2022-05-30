package com.lec.ex06_oop;
// Car 라는 클래스를 더 이쁘게 만드는 방법 
// 컬러값 세팅하는 메소드, 스피드 세팅하는 메소드, cc 세팅하는 메소드
// 컬러값 리턴하는 아이 필요하고, 스피드값 리턴하는 메소드..등등
// 이렇게 하다보면 벌써 필요한 메소드가 6개 넘어감. 
// class : 데이터(속성, 인스턴스변수)와 메소드 (기능(내가 쓸 기능), setter(기능을 세팅하기 위한 함수), getter(값을 가지고 오는 메소드))
// 27줄 부터 이해 안됨. 다시 공부하기 
public class Car02 { //private ~~~ 데이터값 쓰는 거 
	private String color; // 색상
	private int    cc;    // 배기량
	private int    speed; // 속도

	public void drive() {
		speed = 60; 
		System.out.println(color + "색 차를 운전한다. 지금 속도 : "+speed);
	}
	public void park() {
		speed = 0;
		System.out.println(color + "색 차를 운전한다. 지금 속도 : "+speed);
	}
	public void race() {
		speed = 120;
		System.out.println(color + "색 차를 운전한다. 지금 속도 : "+speed);
	}
	
	
	// setter & getter (color, cc, speed) / setter랑 getter는 맘대로 치면 안됨 . 정해진 함수가 있음 set+color => setColor 
	// myPorsche.setColor("red") //매개변수에 칼라값 
	public void setColor(String color) {//리턴할 필요 없을때 void 
		this.color = color; 	  //(String a) 라고 쓰고 밑에 color =a ; 변수 넣어줘도 됨.)
	  //this를 쓰면 내 객체의 칼라를 뜻함. 그냥 color를 쓰면 지역변수기 때문에 객체변수인 color랑 충돌이 일어남
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




















