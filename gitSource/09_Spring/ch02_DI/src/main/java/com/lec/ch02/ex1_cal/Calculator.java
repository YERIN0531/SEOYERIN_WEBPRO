package com.lec.ch02.ex1_cal;

public class Calculator {

	public void additon(int n1, int n2) {
		System.out.println("더하기");
		System.out.println(n1 + " + " + n2 + " = " + (n1+n2));
	}
	public void substraction(int n1, int n2) {
		System.out.println("빼기");
		System.out.println(n1 + " + " + n2 + " = " + (n1-n2));
	}
	public void multiplication(int n1, int n2) {
		System.out.println("곱하기");
		System.out.println(n1 + " + " + n2 + " = " + (n1*n2));
	}
	public void division(int n1, int n2) {
		System.out.println("나누기");
		System.out.println(n1 + " + " + n2 + " = " + (n1/n2));
	}
}
