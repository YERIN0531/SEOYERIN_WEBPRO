package com.lec.ex17_Thread;
//ThreadEx threadA = new ThreadEx("A") ----�Ű����� �ִ� ������ �Լ� ����� ��� ������, �̷��� ������
//ThreadA.setName("A") ������ �Ʒ��� �Ȱ��� 
public class ThreadEx extends Thread{ 
	private int num = 0 ;

	public ThreadEx(String name) {
		super(name);
	}
	@Override
	public void run() {
		for(int i=0 ; i<10 ; i++) {
			if(Thread.currentThread().getName().equals("A")) {
				System.out.println("-----------A������ ������-----------");
				num++;
			}
			System.out.println(Thread.currentThread().getName() + "�� num = " + num);
			try {
				Thread.sleep(500);
			} catch (InterruptedException e) {
			}
		}
	}
	public int getNum() {
		return num;
	}
	
}
