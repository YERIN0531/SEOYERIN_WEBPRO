package com.lec.ex03control;
import java.util.Scanner;
//사용자로부터 국어, 영어, 수학 점수를 입력받아 각 과목별 점수가 평균 이상인지 이하인지 출력해보자
public class Quiz3 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int kor, eng, mat;
		System.out.print("국어 점수 : ");
		kor = sc.nextInt();
		System.out.print("영어 점수 : ");
		eng = sc.nextInt();
		System.out.print("수학 점수 : ");
		mat = sc.nextInt();
		
		int sum = (kor + eng + mat);
		double avg =(double)sum/3.0;
		System.out.println("각 과목의 평균 점수는 " + avg);
		
		if (kor >= avg) {
			System.out.println("국어 점수는 평균 이상입니다");
		}else {
			System.out.println("국어 점수는 평균 이하입니다");
		}
		
		if (eng >= avg) {
			System.out.println("영어 점수는 평균 이상입니다");
		}else {
			System.out.println("영어 점수는 평균 이하입니다");
		}
		
		if (mat >= avg) {
			System.out.println("수학점수는 평균 이상입니다");
		}else {
			System.out.println("수학 점수는 평균 이하입니다");
		}
	}
}


