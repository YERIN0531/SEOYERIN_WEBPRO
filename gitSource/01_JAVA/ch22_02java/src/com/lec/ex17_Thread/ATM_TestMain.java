package com.lec.ex17_Thread;

public class ATM_TestMain {

	public static void main(String[] args) {
		ATM card = new ATM(20000);
		Runnable target = new ATM_Target(card);
		Thread th1 = new Thread(target, "MOM");
		Thread th2 = new Thread(target, "DAD");
		th1.start();
		th2.start();
	}
}
