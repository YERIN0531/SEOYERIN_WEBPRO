package com.lec.ex01variable;
//실수일때 변수 선언하기 
public class VarEX05 {
	public static void main(String[] args) {
		float f1, f2;
		f1 = 10.1f; // 큰값을 작은 주머니에 넣으려고 하니 에러 나는 것. 10.1은 큰 물건 f는 작은 주머니, double은 큰 주머니
		//넣고 싶으면 숫자뒤에 대문자 혹은 소문자 f 를 붙여 더블이 아님을 보여주면 가능 
		System.out.println("f1="+f1);
		f1 = 10.0000017f;
		double d = 10.0000017;
		System.out.println("f1="+f1);//소숫점이 길어지면 에러가 나기 시작함.. 
		System.out.println("d="+d); //소숫점이 길어지면 double d 써줘야됨.
		//[밑에 예시는 월욜날 할 부분 그냥 이런게 있다 라는 거 정도만 기억하기]
		f1= 10.1f;
		d = 10.1;
		if (f1==d) 
			System.out.println("두 변수는 같다");
		else
			System.out.println("두 변수는 다르다");
	}
}
