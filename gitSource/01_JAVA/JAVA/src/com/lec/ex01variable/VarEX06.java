package com.lec.ex01variable;

public class VarEX06 {
	public static void main(String[] args) {
		int i1 = 10;                             // 4byte 짜리
		long l = 2200000000L;//크기가 커서 L을 붙여줘야함. 8byte짜리
		double d1 = 10; // (왼쪽은) 8byte = (오른쪽은) 4byte 원래 10은 정수였는데, 10.0이 되어 들어가는게 묵시적인 형변환 이라고 불림
 		//(위 예시는 작은 바이트 값을 큰 바이트 값에 넣는 거라 문제가 없음)
		System.out.println("d1="+d1); //묵시적인 형변환을 했기 때문에 10이 10.0으로 출력됨
		double d2 = 10.19;
		//int i2 = d2;
		//d2는 8byte, i2는 4byte 즉 큰걸 작은거에 꾸겨 넣어야됨. 지금 상태는 에러가 남 
		// 이걸 꾸겨 넣는 것을 명시적인 형변환이라고함
		int i2 = (int)d2; // 명시적인 형변환(데이터 손실이 발생할수도 있음)
		System.out.println("i2="+i2);
	}
}
