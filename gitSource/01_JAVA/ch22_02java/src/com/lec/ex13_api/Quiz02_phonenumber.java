package com.lec.ex13_api;
//번호(031-234-5678)입력 하면 (sc.next())
//	"입력한 전화번호 : 031-234-5678
//	 짝수번째 문자열  : 0 1 2 4 5 7 //문자열 자체 를 나누기 2 
//	문자를 꺼꾸로    : 8765-432-130 // 문자열 자체를 뒤집기 
//	전화번호 맨앞자리는: 031
//	전화번호 뒷자리는: 5678"을 sysout
// x(X)를 입력하면 프로그램 끝
// 전화번호 받아, 입력받은 전화번호, 짝수번째 문자, 거꾸로, 
import java.util.Scanner;

public class Quiz02_phonenumber {
	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		do{
		System.out.print("전화번호를 입력하시오(010-9898-1234형식) : ");
		String tel = sc.next(); //스트링 입력
		if(tel.equalsIgnoreCase("x"))break; // while 때문에 마지막에 넣은 애임 
		System.out.println("입력한 전화번호 : " + tel);
		//특정한 번째의 함수를 가져오는 함수 charAt(); + 언제까지 뿌릴지 모르니 끝까지 뿌려야함. 글자의 길이를 가져오는 함수 length();
		System.out.print("짝수번째 문자열 : ");
		for(int i = 0; i<tel.length() ; i++) {
			if(i%2==0) {
				System.out.print(tel.charAt(i)); //짝수번째 문자 출력
			}else {
				System.out.print(' '); // 홀수번째 문자열 대신 ' ' 출력 
			}
		}
		System.out.println(); //개행
		System.out.print("문자를 거꾸로 : ");
		for(int i =tel.length()-1 ; i>=0 ; i--) {
			System.out.print(tel.charAt(i));
		}
		System.out.println();
		int first = tel.indexOf('-'); //첫번째 나오는 빼기 
		int last = tel.lastIndexOf('-');//마지막 나오는 빼기
		String pre = tel.substring(0, first);
		String post = tel.substring(last+1);// +1은 바로 다음부터라는 뜻
		String mid = tel.substring(first+1, last);
		System.out.println("전화번호 앞자리 : " + pre);
		System.out.println("전화번호 뒷자리 : " + post);
		System.out.println("전화번호 중ㅇ간자리 : " + mid);
		}while(true); // 내가 이미 do-while 안에 tel을 넣었기 때문에 while밖에다가 tel 못씀. 
		
		
//		if(tel.indexOf("-")==3) {
//			System.out.println("전화번호 앞자리 : " + tel.substring(4,8));
//		}else if(tel.indexOf("-")==2){
//			System.out.println("전화번호 앞자리 : " + tel.substring(3,7));
//		}
//		
//		if(tel.indexOf("-")==8) {
//			System.out.println("전화번호 뒷자리 : " + tel.substring(9));
//		}else if(tel.indexOf("-")==7) {
//			System.out.println("전화번호 뒷자리 : " + tel.substring(8));
//		}
		
		
//		do {
//			System.out.println("번호를 입력하시오 : ");
//			num = scanner.next();
//			System.out.println("");
//		}while
	
	
	
	
		
		
		
		
		
		
		
		
		
	
	
	
	}
	
	}


