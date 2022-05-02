package com.lec.ex06_oop;
// class : 이 안에는 데이터(속성, 인스턴스변수)와 메소드로 이루어져 있음.
// Car c = new Car() // c라는 공간 안에 주소 스피드 파크 등등을 넣어 놓는 작업
// c.park() //주차를 하기 위함  // c에 있는 파크를 찾아가라 
//이 클래스는 객체 설계도라고 생각하면 됨. 
public class Car { 
	//데이터랑 메소드를 쭉 먼저 올려보자.
	String color; // 색상
	int    cc;    // 배기량
	int    speed; // 속도
	
	// 메소드 올리기
	public void drive() {
		speed = 60; //speed라는 변수 안에 60을 넣어라
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
}
