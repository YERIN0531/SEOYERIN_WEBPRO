package com.lec.ex05beforeOOP;
//1~10까지 정수의 합을 출력하고 / 그 합이 짝수인지 홀수인지 출력
public class Ex01 {
	public static void main(String[] args) {
		int sum = 0;
		for(int i=1 ; i<11 ; i++) {//문제에서 1부터라고 했으니 i=1부터
			sum = sum+i; //sum += i;
		}
		System.out.println("1부터 10까지의 정수의 합은 " + sum + "입니다");
//		System.out.println((sum%2==0)? "짝수입니다." : "홀수입니다.");
		String msg;
		if(sum%2==0) {
			msg = "짝수입니다.";
		}else {
			msg = "홀수입니다.";
		}
		System.out.println(msg);
	}
}
