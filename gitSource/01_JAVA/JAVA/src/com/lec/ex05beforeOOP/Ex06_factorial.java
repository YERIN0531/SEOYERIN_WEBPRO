package com.lec.ex05beforeOOP;
import java.util.Scanner;
//메소드의 재귀적 호출 
//사용자로부터 수를 입력받아, 입력받은 수  팩토리얼(!) 계산하기 (팩토리얼 계산하는 메소드 이용)
public class Ex06_factorial {
	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		int su;
		
		do {
			System.out.print("양수를 입력하세요 : ");
			su = sc.nextInt();
		}while(su<=0);
		
		long result = factorial(su); //팩토리얼 계산하는 함수를 쓰자
		System.out.println("입력하신" + su + "! = " + result);
		System.out.printf("입력하신 %d != %d", su, result);
			//factorial 함수 아직 안만들었으니 아래에 함수 만들자! but 사용자가 양수를 입력 안할수도 있으니 
		//한번은 더 기회를 줘야 하니 do~while문 사용하자 . 
	}
	private static long factorial(int su){//result에 넣어야 하니 할당 long 넣고, 매개변수는 su랑 똑같은 타임 넣으면 됨 
		int result = 1; //곱할거면 누적변수 1 설정
		for (int i=su ; i>=1 ; i--) {
			result *= i; //result = result * i;
		}
		return result;
	}
}











