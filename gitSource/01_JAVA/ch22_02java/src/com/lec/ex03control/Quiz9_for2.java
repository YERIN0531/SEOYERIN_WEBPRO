package com.lec.ex03control;
//1~10���� ���� �� ¦�� �Ǵ� Ȧ���� ���� ���غ���
public class Quiz9_for2 {
	public static void main(String[] args) {
		int sum = 0;
//		for(int i=1 ; i<11 ; i+=2) {
//			sum+=3;
//		}
//
		for (int i=1 ; i<11 ; i++) {
			if(i%2 != 0) {
				sum += i;
			}//if
		}//for
		System.out.println("1~10������ Ȧ���� ����" + sum);
	}//main
	}//class

