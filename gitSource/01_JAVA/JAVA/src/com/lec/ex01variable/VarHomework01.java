package com.lec.ex01variable;

public class VarHomework01 {
	public static void main(String[] args) {
		int k1 = 100;
		int e1 = 90;
		int m1 = 90;
		
		System.out.println("국어점수" + k1);
		System.out.println("영어점수" + e1);
		System.out.println("수학점수" + m1);
		System.out.println("총점" +(k1+e1+m1));
		System.out.println("평균" +((k1+e1+m1)/3.0)); //(다시해보기)
		
		k1 = 100;
		e1 = 90;
		m1 = 90;
		
		System.out.println("국어점수" + k1);
		System.out.println("영어점수" + e1);
		System.out.println("수학점수" + m1);
		
		int t1 = k1+e1+m1;
		double a1 = t1 / 3.0;
		System.out.println("총점"+t1);
		System.out.println("평균"+a1);
		
		//선생님풀이
		int kor = 99;
		int mat = 100;
		int eng = 99; //int kor =90;, int mat = 100;, int eng = 95; 해도 되지만 가독성 좋게)
		int sum = kor + mat + eng;
		double avg = sum/3.0;
		System.out.printf("국어는 %d점, 수학은%d점, 영어는%d점입니다.\n", kor, mat, eng);
		System.out.printf("총점은 %d점. 평균은%.1f", sum, avg);
		
	}
}
