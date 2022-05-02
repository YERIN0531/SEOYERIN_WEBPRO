package com.lec.ex03control;
//Switch문 
import java.util.Scanner;

public class Quiz7 {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		System.out.print("현재의 월을 입력하세요 : ");
		int month = scanner.nextInt();
		switch(month) {
			case 12: case 1: case 2:
				System.out.println("겨울이네요");break;
			case 3: case 4: case 5:
				System.out.println("봄이네요");break;
			case 6: case 7: case 8:
				System.out.println("여름이네요");break;
			case 9: case 10: case 11:
				System.out.println("가을이네요");break;
			default:
				System.out.println("떼기");
		}
	}
}
