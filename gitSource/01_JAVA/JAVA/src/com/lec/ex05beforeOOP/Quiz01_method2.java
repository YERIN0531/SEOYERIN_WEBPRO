package com.lec.ex05beforeOOP;
import java.util.Scanner;
//사용자로부터 원하는 단수(2~9) 구구단을 출력하는 프로그램을 구현하시오
//(method(int dansu)를 만들고 / do~while문이나 while문 이용 
public class Quiz01_method2 {
	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		int su;
		
		do {
			System.out.print("원하는 구구단 단수를 입력하시오 (2~9) : ");
			su = sc.nextInt();
		}while(su<=1 || su>9); //2~9까지 나오는 거 다시 보기 
		
		yerin(su); //리턴값이 필요가 없음.
	}
	private static void yerin(int su) {
		for(int i=1; i<10 ; i++) {
			System.out.println(su + "X" + i + "=" + (su*i));
		}
		
	}
}
