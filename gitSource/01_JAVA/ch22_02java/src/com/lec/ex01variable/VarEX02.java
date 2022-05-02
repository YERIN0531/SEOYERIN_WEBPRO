package com.lec.ex01variable;
// ptintln() ; 콘솔창에 출력(개행포함)
// print() ; 콘솔창에 출력(개행 미포함)
// printf() ; 콘솔창에 특정 포맷으로 출력 (개행 미포함)
public class VarEX02 {
	public static void main(String[] args) {
		//데이터타입 변수명 = 초기값
		int i = 10; // 4byte짜리 i라는 메모리 공간에 10을 할당
		byte j = 10; // 2byte짜리 j라는 메모리 공간에 10을 할당
		double h = 10.15; 
		i = 5;
		System.out.println("i="+i+"\t j="+j+"\t h="+h);
		char c1 = 'A';
		char c2 = 'B';
		System.out.print("c1="+c1+"\t c2="+c2+"\n"); // "\n" : 개행
		System.out.printf("c1=%c \t c2=%c\n", c1, c2); 
		// %c-문자 %d-정수, %f-실수 %s-문자열
		System.out.printf("i=%d, j=%d, h=%5.1f \n", i, j, h); //h=%f 에서 소숫점 포함 4자리중 소숫점1까지 나
		//오길 바랄땐, h=%4.1f 넉넉하게 5자리중 소숫점1로 표현. h=%5.1f
		System.out.println("끝");
		
	}
}
