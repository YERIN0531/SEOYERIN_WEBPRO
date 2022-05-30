package com.lec.ex03control;
//10.9.8.7.6.~2.1. 
//while은 내가 얼마나 돌릴지 모를때 
public class Ex06_while {
	public static void main(String[] args) {
		
		
//		for(int i=10 ; i>=1 ; i--) {
//			System.out.println(i+ ".");
//		}
		
		int i = 10;
		while(i>=1) {
			System.out.print(i + ".");
			--i;
		}
	}
}
