package com.lec.ex03control;
// 1~100���� 3�� ����� �ո� ������ �����?
public class Ex07_while {
	public static void main(String[] args) {
		int sum = 0;
		int i=1;
		while(i<101) {
			if(i%3==0) {
				sum += i;
			}
			++i;
		}
		System.out.println("��������" + sum);
	}
}
		
		 
		
		
		
		
//		int sum = 0;
//		for(int i=1 ; i<101 ; i++) {
//			if(i%3 == 0) {
//			sum = sum + i;
//		}//if - 3�� ������� ����
//	 }//for
//		System.out.println("��������" + sum);
//	}//main
//}//class
