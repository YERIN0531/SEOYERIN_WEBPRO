package com.lec.ex04array;
//2���� �迭�� ����� ���� �հ踦 ���Ͻÿ�
//int[][] arr = { {5,5,5,5,5}, {10,10,10,10,10}, {20,20,20,20,20}, {30,30,30,30,30}};
public class Quiz02 {
	public static void main(String[] args) {
		int[][] arr = { {5,5,5,5,5}, {10,10,10,10,10}, {20,20,20,20,20}, {30,30,30,30,30}};
		int sum = 0;
		for(int i=0 ; i<arr.length ; i++) {
			for(int j=0 ;j<arr[i].length  ; j++){
				sum = sum + arr[i][j];
			}
		}
		System.out.println("�迭�� ����� ������ �հ�� " + sum);
	}
}