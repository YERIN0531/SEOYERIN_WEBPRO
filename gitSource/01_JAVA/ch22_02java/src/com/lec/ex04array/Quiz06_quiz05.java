package com.lec.ex04array;

import java.util.Arrays;

//76,45,34,89,100,50,90,92  8���� ���� 1���� �迭�� �ʱ�ȭ �ϰ�
//�̵� ������ ũ�� ������ ��Ÿ���� ���α׷��� �ۼ� �Ͻÿ�
public class Quiz06_quiz05 {
		public static void main(String[] args) {
			int[] arr = {76,45,34,89,100,50,90,92};
			int[] sortArr = new int[arr.length]; //sortArr ��� �̸��� arr�� �Ȱ��� ���� ������ֱ�
			for(int i=0 ; i<arr.length ; i++) {
				sortArr[i] = arr[i]; // sortArr �ȿ� arr�� �Ȱ��� ���� �־��ֱ�
			}
			// �������� ���� : Arrays.sort(sortArr); �Լ� ���� ���
			for(int i=0 ; i<sortArr.length ; i++) { //i=0~7���� 
				for(int j=i+1 ; j<sortArr.length ; j++) { //j= i+1~7����
					// i��°�� j��° ���ؼ� i��°�� ũ�� ��ȯ
					if(sortArr[i] > sortArr[j]) { //�ٲٷ��� �ִٺ��� �������ϳ��� ���� �� ����. ���� �ϳ��� �ӽ÷� �����س��� ������ �ʿ�. �� �ӽú��� �������� 
						int temp = sortArr[i]; // �ӽð��� temp�� sortArr[i]��� ����
						sortArr[i] = sortArr[j]; //sortArr[i]�� �ӽÿ� ���������� �� �ڸ��� j���� �͵� ��
						sortArr[j] = temp; //j���� �ӽ� ������ �ִ� i�� ���ߵ�
					}//if -  ��ȯ
				}//for - j
			}//for - i
					System.out.println("�� ������ : " );
					for(int temp : arr) {
						System.out.print(temp+" ");
					}
					System.out.print("\n�������� ���� ������ : ");
					for(int temp : sortArr) {
						System.out.print(temp + " ");
					}
		} //main
	}//class








