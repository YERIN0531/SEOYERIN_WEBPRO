package com.lec.ex03control;
//선생님이랑 같이 하는 것.
//1~10까지의 곱을 구해보자 (누적곱의 변수에 1로 초기화)
public class Quiz8_for2 {
	public static void main(String[] args) {
		int tot = 1;
		for(int i=1 ; i<=10 ; i++) {
			tot *= i;// tot = tot*1
		}
		System.out.println("1~10까지의 곱은" + tot);
	}
}