package com.lec.ex03control;
//1~10까지 숫자 중 짝수 또는 홀수의 합을 구해보자
public class Quiz9_for {
	public static void main(String[] args) {
		int tot=0;
		int tot1=0;
		for(int i=1 ; i<=10 ; i++) {
		if(i%2==0) {
			tot = tot +i;
		}//if
		}//for
		System.out.println("짝수의 합은" + tot);	
		
		for(int i=1 ; i<=10 ; i++) {
			if(i%2 != 0) {
				tot1 = tot1 +i;
			}//if
		}//for
		System.out.println("홀수의 합은" + tot1);
	
	}//main
	}//class

