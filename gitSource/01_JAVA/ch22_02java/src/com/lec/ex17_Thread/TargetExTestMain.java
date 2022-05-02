package com.lec.ex17_Thread;
// 스레드는 여러개인데, target이 하나 
public class TargetExTestMain {

	public static void main(String[] args) {
		TargetEx target1 = new TargetEx(); //하나의 오브젝트
		TargetEx target2 = new TargetEx();
		Thread threadA = new Thread(target1,"A");
		Thread threadB = new Thread(target2,"B");
		threadA.start();
		threadB.start();
		try {
			Thread.sleep(7000);
		} catch (InterruptedException e) {
		}
		System.out.println("target1의 num :" + target1.getNum());
		System.out.println("target2의 num : " + target2.getNum());
		System.out.println("main 함수 끝");
	}
}
