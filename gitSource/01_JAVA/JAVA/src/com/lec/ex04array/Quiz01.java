package com.lec.ex04array;
//배열에 담긴 값을 더하는 프로그램을 작성
public class Quiz01 {
	public static void main(String[] args) {
		int[] arr = {10,20,30,40,50};
		int tot = 0;
//		for(int idx=0 ; idx<arr.length ; idx++) {
//			tot = tot + arr[idx]; 
//		} //for
//		System.out.println("모두 더한 값은" + tot);
//		
		
//---------------------------------------------------
//				선생님버전
		
		for(int temp : arr) {
			tot += temp;
		}
		System.out.println("모두 더한 값은" + tot);
	}
}
