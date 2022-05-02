package com.lec.ex02operator;
//사용자로부터 입력받은 수가 3의 배수인지 여부 출력
import java.util.Scanner; // inport = ~메모리에 올려라 라는 뜻의 명령문

public class Quiz1 {
	public static void main(String[] args) { 
		Scanner scanner = new Scanner(System.in); //API장 할때 할거임
		System.out.print("수를 입력하세요 : ");
		int su = scanner.nextInt(); // 사용자로부터 정수 입력 받기 
		String result = su%3 == 0 ? "입력하신 수는 3의 배수입니다." : "입력하신 수는 3의 배수가 아닙니다.";
		System.out.println(result);
		result = su%2 ==0 ? "입력하신 수는 짝수입니다." : "입력하신 수는 홀수 입니다.";
		System.out.println(result);
		//scanner에 노란 밑줄 있는 거 싫으면 scanner.close();
	}
}
