package com.lec.ex14_exception;
//예외처리가 되지 않은 예시 
import java.util.Scanner;

public class Ex01 {

	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		System.out.print("사칙연산을 할 첫번째 수 : ");
		int i = scanner.nextInt(); //******************** 사용자가 정수가 아닌 문자 혹은 0을 넣을수도 있음 
		System.out.print("사칙연산을 할 두번째 수 : ");
		int j = scanner.nextInt(); //******************** 사용자가 정수가 아닌 문자 혹은 0을 넣을수도 있음
		System.out.println("i = " + i + "  j = " + j);
		System.out.println("i X j = " + (i*j));
		System.out.println("i / j = " + (i/j)); //******* 예외가 발생할 수 있는 부분 
		System.out.println("i + j = " + (i+j));
		System.out.println("i - j = " + (i-j));
		System.out.println("DONE");
		scanner.close();
	}
}
