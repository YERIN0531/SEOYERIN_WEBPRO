package com.lec.ex03control;
//1~10까지의 곱을 구해보자 (누적곱의 변수에 1로 초기화)
public class Quiz8_for {
	public static void main(String[] args) {
		int tot = 1;
		for(int i=1 ; i<=10 ; i++ ) {
			tot = tot * i;
		}
		System.out.println("1~10까지의 누적곱은" + tot);
	}
}
