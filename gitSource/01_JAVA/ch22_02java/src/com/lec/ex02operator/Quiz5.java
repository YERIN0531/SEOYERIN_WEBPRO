package com.lec.ex02operator;

import java.util.Scanner;

//Quiz 5 국어, 영어, 수학 점수를 변수에 할당하고 각 점수를 출력하고 총점, 평균(소수점2자리까지) 출력하는 프로그램을 구현 하시오 (사용자로부터 받기, nextint 정수 받기)
public class Quiz5 {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		System.out.print("국어: ");
		int kor = scanner.nextInt();
		System.out.print("영어: ");
		int eng = scanner.nextInt();
		System.out.print("수학: ");
		int mat = scanner.nextInt();
		
		int sum = kor + eng + mat;
		double avg = (double)sum/3.0;
		System.out.printf("총점 : %d점, 평균 : %.2f점", sum, avg);
				
		
		
	}
}
