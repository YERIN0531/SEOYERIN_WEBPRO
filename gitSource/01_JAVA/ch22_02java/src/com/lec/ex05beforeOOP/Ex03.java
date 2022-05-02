package com.lec.ex05beforeOOP;
// Arithmetic.sum / evenOdd (static) vs. abs(일반)
public class Ex03 {
	public static void main(String[] args) {
		int tot = Arithmetic.sum(10); //Arithmetic에 있는 sum 을 쓰겠다.
		System.out.println("1~10까지 합은 " + tot);
		System.out.println(Arithmetic.evenOdd(tot));
		//static을 사용하지 않은 경우. class를 static한 공간에 올려놔야함 = 객체화 시킨다.
		Arithmetic ar = new Arithmetic();
		//( 클래식이름 )(변수이름내맘대로) = (설계도면을 메모리 공간에 올릴라면 new가 필요 )(클래스이름)();
		System.out.println(ar.abs(-8)); // ar에 abs가 들어있기 때문에 불러 오려면 ar.abs(매개변수) 라고 써야함
	}
}
