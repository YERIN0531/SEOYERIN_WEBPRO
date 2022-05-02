package com.lec.ex01variable;
// 변수 선언 다양한 방법들
public class VarEX04 {
	public static void main(String[] args) {
		//1. 자료형 변수명; - 변수선언과 할당을 분리 [기존은 선언과 할당을 같이함 int i= 10; 2번 케이스임] 이 케이스는 값을 반드시 밑에선언해야함 
		int num1;
		num1 = 10;
		System.out.println("num1="+num1);
		//2. 자료형 변수명 = 초기값; - 변수 선언과 할당을 동시에 (초기화 한다 라고 부름)
		int num2 = 20;
		System.out.println("num2="+20); // 혼자 다시 쳐보기 
		//3. 자료형 변수명1, 변수명2, .. 변수명n; - 동일 자료형 변수 다수 선언 ( 이 케이스도 값을 반드시 선언해야함)
		int num3, num4;
		num3 = 30; num4=40;
		System.out.printf("num3=%d, num4=%d\n", num3, num4);
		//4. 자료형 변수명1=값1, 변수명2=값2...변수명n=값n; 동일자료형 변수를 다수 선언과 초기화를 같이 하는 것
		int num5=50, num6=60, num7;
		num7=70; //실행한번해보기 
	}
}
