package com.lec.ex05beforeOOP;
import java.util.Scanner;
////사용자로부터 수를 입력받아 절대값을 출력하는 로직을 구현하시오
//단, 매개변수를 받아 절대값을 리턴하는 함수를 이용합니다.
//리턴하는 함수 = 메소드를 이용합니다
//선생님이 정리해주신거.. 
public class Quiz02_metohd {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.print("수를 입력하시오 : ");
		int su = sc.nextInt();
		System.out.println("이 수의 절대값은 " + num(su) + "입니다.");
		
	}
	private static int num(int su) {
		if (su>=0) {
			return su;
		}else {
			return -su;
		}
	}
}
