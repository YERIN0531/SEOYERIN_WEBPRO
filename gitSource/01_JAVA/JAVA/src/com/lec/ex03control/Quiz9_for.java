package com.lec.ex03control;
//1~10���� ���� �� ¦�� �Ǵ� Ȧ���� ���� ���غ���
public class Quiz9_for {
	public static void main(String[] args) {
		int tot=0;
		int tot1=0;
		for(int i=1 ; i<=10 ; i++) {
		if(i%2==0) {
			tot = tot +i;
		}//if
		}//for
		System.out.println("¦���� ����" + tot);	
		
		for(int i=1 ; i<=10 ; i++) {
			if(i%2 != 0) {
				tot1 = tot1 +i;
			}//if
		}//for
		System.out.println("Ȧ���� ����" + tot1);
	
	}//main
	}//class

