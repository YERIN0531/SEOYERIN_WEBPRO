package com.lec.ex05beforeOOP;

public class Arithmetic { //main 함수가 없기 때문에 메모리에 올려놓기만함
	public int abs(int value) {
		int result = value>=0 ? value : -value;
		return result;
	}
	
	public static int sum(int to) { // 함수의 오버로딩
		int result = 0;
		for(int i=1 ; i<=to ; i++) {
			result += i; //result = result + i; 
		}
		return result;
	}
	public static int sum(int from, int to) { // from ~ to까지 누적한 결과 return
		int result = 0;
		for(int i=from ; i<=to ; i++) {
			result += i; //result = result + i; 
		}
		return result;
	}
	public static String evenOdd(int value) {
		return value%2==0 ? "짝수입니다" : "홀수입니다";

	}
}
