package com.lec.ex03control;
import java.util.Scanner;
//사용자로부터 점수를 입력받아 학점을 출력.
public class Ex01_hakjum03_practice {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.print("점수를 입력하세요 : ");
		int su = sc.nextInt();
		
		if(su>=85) {
			System.out.println("A학점");
		}else if(su>=70) {
			System.out.println("B학점");
		}else if(su>=60) {
			System.out.println("C학점");
		}else if(su>=45) {
			System.out.println("D학점");
		}else if(su<45){
			System.out.println("F학점");
		}else {
			System.out.println("수를 잘못 입력하셨습니다.");
		}
		
		
		
}
}

