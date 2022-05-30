package com.lec.ex02operator;
import java.util.Scanner;
//Quiz 4 나이를 입력받아 입력받은 나이가 65세 이상일때, "경로우대" 출력, 아니면 "일반" 출력 

public class Quiz4 {
	public static void main(String[] args) { 
		Scanner scanner = new Scanner(System.in);
		System.out.print("나이를 입력하세요 :  ");
		int su = scanner.nextInt();
		String result;
		result = (su >= 65)  ? "경로우대" : "일반";
		   System.out.println(result);
		   
		
	
				
	}
}
