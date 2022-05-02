package com.lec.ex05beforeOOP;
import java.util.Scanner;
//메소드의 재귀적 호출 
//사용자로부터 수를 입력받아, 입력받은 수  팩토리얼(!) 계산하기 (팩토리얼 계산하는 메소드 이용)
public class Ex06_factorial2 {
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
	private static long factorial(int su) { //su가 1초과일 경우 - su*factorial(su-1)
		if (su==1) { //수가 1이면 1*팩토리얼 0이기 때문에 말이 안됨. 그냥 1일경우를 if통해 지정 후 바로 return
			return 1;
		}else {
			return su * factorial(su-1); //재귀적 함수 호출 
		}
	
	}
}











