package com.lec.ex17_Thread;
//ThreadEx threadA = new ThreadEx("A") ----매개변수 있는 생성자 함수 만들어 줬기 때문에, 이렇게 쓸거임
//ThreadA.setName("A") 위에랑 아래랑 똑같음 
public class ThreadEx extends Thread{ 
	private int num = 0 ;

	public ThreadEx(String name) {
		super(name);
	}
	@Override
	public void run() {
		for(int i=0 ; i<10 ; i++) {
			if(Thread.currentThread().getName().equals("A")) {
				System.out.println("-----------A쓰레드 수행중-----------");
				num++;
			}
			System.out.println(Thread.currentThread().getName() + "의 num = " + num);
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
