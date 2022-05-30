package com.lec.ex03control;
import java.util.Scanner;
//Ex04_hakjum.java는 if문 .. 이건 스위치문으로 ..
public class Ex01_hakjum02 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.print("점수 : ");
		int score = sc.nextInt();
//		int temp = score==100 ? score-1 : score;
//		temp = (-9<=temp && temp<0) ? -10 : temp;
//		101점도 문제.. -1~-9도 10으로 나누면 0이 되기때문에 
//		문제가 될 수 있음
//		switch(temp /10){ //다시 공부하기
		
		int temp = score==100 ? score-1 : score;
		temp = (-9<=temp && temp<0) ? -10 : temp;
		switch(temp /10){
		
		case 9: System.out.println("A학점");break;
		case 8: System.out.println("B학점");break;
		case 7: System.out.println("C학점");break;
		case 6: System.out.println("D학점");break;
		case 5: case 4: case 3: case 2: case 0: 
			System.out.println("F학점");break;
		default:
			System.out.println("유효하지 않은 점수입니다.");
		
		}
		
}
}

