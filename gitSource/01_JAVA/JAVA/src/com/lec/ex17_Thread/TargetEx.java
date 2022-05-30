package com.lec.ex17_Thread;
//데이터 있는 애 만들어보기 
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
			System.out.println("-----------A쓰레드 수행중-----------");
			num++;
		}
		System.out.println(Thread.currentThread().getName() + "의 num = " + num);
	}
	public int getNum() { //A스레드와 B스레드에 있는 아이가 정말 다른지 비교하기 위해 추가한 get
		return num;
	}
}
