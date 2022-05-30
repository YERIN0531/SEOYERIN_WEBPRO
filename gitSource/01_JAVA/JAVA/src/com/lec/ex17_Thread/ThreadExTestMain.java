package com.lec.ex17_Thread;

public class ThreadExTestMain {

	public static void main(String[] args) {
		ThreadEx threadA = new ThreadEx("A"); 
		ThreadEx threadB = new ThreadEx("B");
		threadA.start();
		threadB.start();
		try {
			Thread.sleep(7000);
		} catch (InterruptedException e) {
		}
		System.out.println("AÀÇ num : " + threadA.getNum());
		System.out.println("BÀÇ num : " + threadB.getNum());
	}
}
