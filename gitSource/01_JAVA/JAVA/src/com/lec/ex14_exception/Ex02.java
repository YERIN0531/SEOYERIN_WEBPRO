package com.lec.ex14_exception;
//16줄이 예외처리가 된 예시  
import java.util.Scanner;

public class Ex02 {

	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		System.out.print("사칙연산을 할 첫번째 수 : ");
		int i = scanner.nextInt(); //******************** 사용자가 정수가 아닌 문자 혹은 0을 넣을수도 있음 
		System.out.print("사칙연산을 할 두번째 수 : ");
		int j = scanner.nextInt(); //******************** 사용자가 정수가 아닌 문자 혹은 0을 넣을수도 있음
		System.out.println("i = " + i + "  j = " + j);
		System.out.println("i X j = " + (i*j));
		try {
		System.out.println("i / j = " + (i/j)); //******* 예외가 발생할 수 있는 부분
		}catch(ArithmeticException e) { //ArithmeticException 은 Exception에서 상속받았기 때문에 Exception e 라고 써도 됨 
			//예외가 발생할 경우 우회적으로 우항할 로직 
			System.out.println("예외 메세지 : " + e.getMessage());
			//예외 사항을 자세하게 보고 싶을 경우
//			e.printStackTrace(); //예외사항을 자세히 출력
		}
		System.out.println("i + j = " + (i+j));
		System.out.println("i - j = " + (i-j));
		System.out.println("DONE");
		scanner.close();
	}
}
