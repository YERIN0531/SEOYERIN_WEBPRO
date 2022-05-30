package com.lec.ex05beforeOOP;
import java.util.Scanner;
////사용자로부터 수를 입력받아 절대값을 출력하는 로직을 구현하시오
//단, 매개변수를 받아 절대값을 리턴하는 함수를 이용합니다.
//리턴하는 함수 = 메소드를 이용합니다
//내가 직점 만든 것.
public class Quiz02_metohd2 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.print("수를 입력하시오 : ");
		int su = sc.nextInt();
		num(su); // sysout 하지말고 num(su)만 출력되게 하고 싶으니 이렇게 써라. 
		
	}
	private static int num(int su) {
		if (su>=0) {
			System.out.println("이 수의 절대값은 " + su + "입니다.");
		}else {
			System.out.println("이 수의 절대값은 " + su*-1 + "입니다.");
		}
		return su;
	}
}
