package com.lec.ex03control;
//1~10까지 숫자 중 짝수 또는 홀수의 합을 구해보자
public class Quiz9_for2 {
	public static void main(String[] args) {
		int sum = 0;
//		for(int i=1 ; i<11 ; i+=2) {
//			sum+=3;
//		}
//
		for (int i=1 ; i<11 ; i++) {
			if(i%2 != 0) {
				sum += i;
			}//if
		}//for
		System.out.println("1~10까지의 홀수의 합은" + sum);
	}//main
	}//class

