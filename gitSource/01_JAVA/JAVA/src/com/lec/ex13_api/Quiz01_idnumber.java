package com.lec.ex13_api;

import java.util.Scanner;

public class Quiz01_idnumber {

	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		String num; 
		System.out.println("주민 번호를 입력하시오 : ");
		num = scanner.next();
		if(num.indexOf("1",6)==7) {
			System.out.println("남자입니다");
		}else if(num.indexOf("2",6)==7){
			System.out.println("여자입니다");
		}
		
		
		
//		do {
//		System.out.print("주민번호를 입력하시오 : ");
//		num = scanner.next();
//		switch(num){
//		case "	
//		}
//		
//		
//		}while();
	
	
	}//main
}//class
