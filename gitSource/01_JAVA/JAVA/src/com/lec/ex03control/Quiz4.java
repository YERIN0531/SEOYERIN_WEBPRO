package com.lec.ex03control;

import java.util.Scanner;

//가위(0) 바위(1) 보(2) 중 하나를 내고 낸 것을 출력하세요. 
public class Quiz4 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int a = 0;
		System.out.print("가위(0), 바위(1), 보(2) 중 하나를 선택하세요 : ");
		a = sc.nextInt();
		if (a == 0) {
			System.out.print("가위");
		}else if (a == 1) {
			System.out.print("바위");
	}	else {
		System.out.print("보");
	}
}
}