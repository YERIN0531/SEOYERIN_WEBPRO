package com.lec.ex17_Thread;
// ATM card = new ATM(20000)
// ATM_Target target = new ATM_TAarget(card)
public class ATM_Target implements Runnable{//나중에 스레드 만들때 여기에(target) 있는 run을 수행하여라 

	private boolean flag; //저금하면 flag false / 출금하면 flag true;
	private ATM card;
	
	public ATM_Target(ATM card) {
		this.card = card;
	}
	
	@Override
	public void run() {//저금 했다가 출금했다가 
		for(int i=0; i<10 ; i++) { 
			if(flag) { //출금
				card.withdraw(1000, Thread.currentThread().getName());
				flag = false;//한번 출금하면 flag값 바꿔줌 
			}else {//저금
				card.deposit(1000, Thread.currentThread().getName());
				flag = true;
			
			}//if
		}//for
	}//run
}//class
