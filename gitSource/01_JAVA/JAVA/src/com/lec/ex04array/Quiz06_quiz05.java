package com.lec.ex04array;

import java.util.Arrays;

//76,45,34,89,100,50,90,92  8개의 값을 1차원 배열로 초기화 하고
//이들 값들을 크기 순으로 나타내는 프로그램을 작성 하시요
public class Quiz06_quiz05 {
		public static void main(String[] args) {
			int[] arr = {76,45,34,89,100,50,90,92};
			int[] sortArr = new int[arr.length]; //sortArr 라는 이름에 arr과 똑같은 공간 만들어주기
			for(int i=0 ; i<arr.length ; i++) {
				sortArr[i] = arr[i]; // sortArr 안에 arr과 똑같은 숫자 넣어주기
			}
			// 오름차순 정렬 : Arrays.sort(sortArr); 함수 쓰는 방식
			for(int i=0 ; i<sortArr.length ; i++) { //i=0~7까지 
				for(int j=i+1 ; j<sortArr.length ; j++) { //j= i+1~7까지
					// i번째와 j번째 비교해서 i번째가 크면 교환
					if(sortArr[i] > sortArr[j]) { //바꾸려고 주다보면 데이터하나가 날라갈 수 있음. 남은 하나를 임시로 보관해놓을 공간이 필요. 즉 임시변수 만들어야함 
						int temp = sortArr[i]; // 임시공간 temp에 sortArr[i]잠시 보관
						sortArr[i] = sortArr[j]; //sortArr[i]를 임시에 저장했으니 그 자리에 j값이 와도 됨
						sortArr[j] = temp; //j값에 임시 공간에 있던 i가 들어가야됨
					}//if -  교환
				}//for - j
			}//for - i
					System.out.println("원 데이터 : " );
					for(int temp : arr) {
						System.out.print(temp+" ");
					}
					System.out.print("\n오름차순 정렬 데이터 : ");
					for(int temp : sortArr) {
						System.out.print(temp + " ");
					}
		} //main
	}//class








