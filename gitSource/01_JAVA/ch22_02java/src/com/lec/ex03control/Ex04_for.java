package com.lec.ex03control;
//1~40���� ���ٿ� 4���� ��� 1 2 3 4
//                   5 6 7 8 ....
public class Ex04_for {
	public static void main(String[] args) {
		for(int i=1 ; i<=40 ; i++) {
			System.out.print(i+"\t");
			if(i%4 ==0) {
				System.out.println(); //i�� 4�� ����̸� �����߰�
			}//if
		}//for
		
		
		
// ������ ������� ��øfor���� Ȱ���ؼ� ���� 		
//		for(int i=1 ; i<=10 ; i++) {
//			for(int j=4*i+1 ; j<=4*i+4 ; j++) {
//				System.out.print(j+"\t");
//			}
//			System.out.println();
//		}
	}//main
}
