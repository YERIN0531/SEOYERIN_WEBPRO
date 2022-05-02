package com.lec.ex03control;
import java.util.Scanner;
//수를 입력받아 절대값을 출력하는 프로그램을 구현해라 //다양한 사례로 여러개로 공부하고 출력해보기 
public class Quiz1 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.println("수를 입력 하시오 : ");
		int num1;
		num1 = sc.nextInt();
		if ( num1 > 0) {
			System.out.println("다음 수의 절대값은" + num1 + "입니다. ");
		} else if (num1 ==  0) {
			System.out.println("다음 수의 절대값은" + num1 + "입니다. ");
		} else {
			System.out.println("다음수의 절대값은 " + (num1*(-1)) + "입니다. ");
		}
			
			
		}
		
	}
