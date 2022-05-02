package com.lec.ex17_Thread;
//������ �ִ� �� ������ 
public class TargetEx implements Runnable{

	private int num = 0 ; 
	@Override
	public void run() {
		for(int i=0 ; i<10 ; i++) {
			out();
			try {
				Thread.sleep(500);
			} catch (InterruptedException e) {
			}
		}
	}
	private synchronized void out() {
		if(Thread.currentThread().getName().equals("A")) {
			System.out.println("-----------A������ ������-----------");
			num++;
		}
		System.out.println(Thread.currentThread().getName() + "�� num = " + num);
	}
	public int getNum() { //A������� B�����忡 �ִ� ���̰� ���� �ٸ��� ���ϱ� ���� �߰��� get
		return num;
	}
}
