package com.lec.ex04array;
//76,45,34,89,100,50,90,92  8개의 값을 1차원 배열로 초기화 하고 
//값에 합계와  평균 그리고 최대값과 최소값을 구하는 프로그램을 작성 하시요. 
public class Quiz03 {
	public static void main(String[] args) {
		int[] arr = {76,45,34,89,100,50,90,92};
		int sum = 0; //누적할거니 0을 써줘야해
		for(int i=0 ; i<arr.length ; i++) {
			sum = sum+arr[i];
		}	
		System.out.print("합     계  = " + sum + "\t");
		System.out.println("평   균 = " +sum/8);
	
	//최대값과 최소값을 구하기
		
		int minarr = 999, minIdx=0; //max값과 min값을 설정해야 하기 때문
		int maxarr = 0, maxIdx=0;
		for(int i1=0 ; i1<arr.length ; i1++) {
			if(arr[i1]<minarr) {
				minarr = arr[i1];
				minIdx = i1;
			}//if 최소값
			if(arr[i1]>maxarr) {
				maxarr = arr[i1];
				maxIdx = i1;
			}//if 최대값
		}//for
		System.out.print("최대값은 = " + arr[maxIdx] + "\t");
		System.out.println("최소값은 = " + arr[minIdx]);
	}
}