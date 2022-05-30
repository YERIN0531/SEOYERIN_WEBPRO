package com.lec.ex05beforeOOP;
//1~10까지 정수의 합을 출력하고 / 그 합이 짝수인지 홀수인지 출력
public class Ex02 {
	public static void main(String[] args) {
		int tot = sum(1, 10);//1~10까지 알아서 누적한 결과를 tot라는 공간에 담아라.
		int tot2 = sum(10);
		System.out.println("1~10까지 누적합은 " + tot); //sum 변수 값 설정한 후 return 하고, sysout 해라 
		System.out.println(evenOdd(tot));//짝홀수 판별 로직 불러 sysout
		System.out.println(tot2);
		tot = sum(10,100);
		System.out.println("10~100까지 누적합은 " + tot);
		System.out.println(evenOdd(tot)); //짝홀수 판별 로직 불러 sysout 그러나 evenOdd속에 있는 tot를 불러 와야 하기 때문에 evenOdd(tot)
		
	}//main
	public static String evenOdd(int value) {
		return value%2==0 ? "짝수입니다" : "홀수입니다";
//		String result = null;
//		if(value%2 ==0) {
//			result = "짝수입니다";
//		}else {
//			result = "홀수입니다";
//		}
//		return result;
		
	}
	private static int sum(int to) {//함수의 오버로딩 //tot2를 위한 값
		int result = 0;
		for(int i=1 ; i<=to ; i++) {
			result += 1;
		}
		return result;
	}
	
	private static int sum(int from, int to) { //private 이 화일에서만 호출 가능하다는 뜻(public도 사용 가능하긴함). int 는 가지고 오다 라는 의미 
						//from~to까지 누적한 결과 return
		int result = 0;
		for(int i=from ; i<=to ; i++) {
			result = result + i; //result += i;
			//result를 main함수 안에 다시 돌려줘야함 그럴땐.. return을 쓰자 
		}//for
		return result;
	}//sum
}//class

















