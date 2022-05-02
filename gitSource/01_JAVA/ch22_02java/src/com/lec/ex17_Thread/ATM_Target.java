package com.lec.ex17_Thread;
// ATM card = new ATM(20000)
// ATM_Target target = new ATM_TAarget(card)
public class ATM_Target implements Runnable{//���߿� ������ ���鶧 ���⿡(target) �ִ� run�� �����Ͽ��� 

	private boolean flag; //�����ϸ� flag false / ����ϸ� flag true;
	private ATM card;
	
	public ATM_Target(ATM card) {
		this.card = card;
	}
	
	@Override
	public void run() {//���� �ߴٰ� ����ߴٰ� 
		for(int i=0; i<10 ; i++) { 
			if(flag) { //���
				card.withdraw(1000, Thread.currentThread().getName());
				flag = false;//�ѹ� ����ϸ� flag�� �ٲ��� 
			}else {//����
				card.deposit(1000, Thread.currentThread().getName());
				flag = true;
			
			}//if
		}//for
	}//run
}//class
