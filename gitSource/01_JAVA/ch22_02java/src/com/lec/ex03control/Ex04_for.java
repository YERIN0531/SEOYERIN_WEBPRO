package com.lec.ex03control;
//1~40까지 한줄에 4개씩 출력 1 2 3 4
//                   5 6 7 8 ....
public class Ex04_for {
	public static void main(String[] args) {
		for(int i=1 ; i<=40 ; i++) {
			System.out.print(i+"\t");
			if(i%4 ==0) {
				System.out.println(); //i가 4의 배수이면 개행추가
			}//if
		}//for
		
		
		
// 동일한 결과값을 중첩for문을 활용해서 쓸때 		
//		for(int i=1 ; i<=10 ; i++) {
//			for(int j=4*i+1 ; j<=4*i+4 ; j++) {
//				System.out.print(j+"\t");
//			}
//			System.out.println();
//		}
	}//main
}
