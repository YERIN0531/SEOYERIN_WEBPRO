package com.lec.ex17_Thread;
// ������� �������ε�, target�� �ϳ� 
public class TargetExTestMain {

	public static void main(String[] args) {
		TargetEx target1 = new TargetEx(); //�ϳ��� ������Ʈ
		TargetEx target2 = new TargetEx();
		Thread threadA = new Thread(target1,"A");
		Thread threadB = new Thread(target2,"B");
		threadA.start();
		threadB.start();
		try {
			Thread.sleep(7000);
		} catch (InterruptedException e) {
		}
		System.out.println("target1�� num :" + target1.getNum());
		System.out.println("target2�� num : " + target2.getNum());
		System.out.println("main �Լ� ��");
	}
}
