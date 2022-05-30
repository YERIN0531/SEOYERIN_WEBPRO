package com.lec.ex02operator;
import java.util.Scanner;
//Quiz2 입력하신 수가 짝수인지 홀수인지 출력

public class Quiz2 {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		System.out.print("수를 입력하세요 : ");
		int su = scanner.nextInt();
		String result = su%2 == 0 ? "입력하신 수가 짝수 입니다." : "입력하신 수가 홀수 입니다.";
		System.out.println(result);
		scanner.close();
		
	}
}
