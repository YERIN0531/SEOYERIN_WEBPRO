package com.lec.ex04array;
//���ͳ� ã�ƺ��� ��. https://blog.naver.com/aaaa4696/222673333503
import java.util.Arrays;

//76,45,34,89,100,50,90,92  8���� ���� 1���� �迭�� �ʱ�ȭ �ϰ�
//�̵� ������ ũ�� ������ ��Ÿ���� ���α׷��� �ۼ� �Ͻÿ�
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
