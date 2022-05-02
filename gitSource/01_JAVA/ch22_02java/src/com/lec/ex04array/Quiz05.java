package com.lec.ex04array;
//인터넷 찾아보고 함. https://blog.naver.com/aaaa4696/222673333503
import java.util.Arrays;

//76,45,34,89,100,50,90,92  8개의 값을 1차원 배열로 초기화 하고
//이들 값들을 크기 순으로 나타내는 프로그램을 작성 하시요
public class Quiz05 {
	public static void main(String[] args) {
		int[] arr = {76,45,34,89,100,50,90,92};
//		for(int idx=0 ; idx<arr.length ; idx++) {
		Arrays.sort(arr);
		
		for (int i : arr) {
			System.out.printf("[%d]", i);
		}
		
			
			
//		if(arr[idx] > idx) {
//			System.out.println(arr[idx]);
//		}
		}//for
	}
