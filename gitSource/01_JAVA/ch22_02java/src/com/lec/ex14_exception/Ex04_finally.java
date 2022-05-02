package com.lec.ex14_exception;
//예외가 있던 없던 finally 부분은 출력이 무조건 됨. 왜쓸까..? (쓸데가 있음) 
public class Ex04_finally {

	public static void main(String[] args) {
		int[]arr = {0,1,2};
		for(int i = 0 ; i<=arr.length ; i++) {// i<arr.length; 해야 하는데 실수로 i<=arr.length 했을 경우 
			try {
			System.out.println("arr[" + i + "] = " + arr[i]);
			}catch(ArrayIndexOutOfBoundsException e) {
				System.out.println("예외 메세지 : " + e.getMessage());
			}finally {
				System.out.println("try절 실행 후에도 catch절 실행 후에도 여기는 결국 반드시 실행되는 부분");
			}//try-catch-finally
		}//for
		System.out.println("프로그램 끝");
	}
}
