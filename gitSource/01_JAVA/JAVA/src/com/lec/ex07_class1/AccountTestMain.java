package com.lec.ex07_class1;

public class AccountTestMain {

	public static void main(String[] args) {
		Account hong = new Account("100-1","홍길동",2200000000L); //생성자는 sysout 안하고, 생성자 부분에서 출력이 됨.홍길동(100-1)님 2200000000입금 계좌 개설 감사합니다 
		Account shin = new Account("100-1","신길동");//신길동(100-1)님 계좌 개설 감사합니다. 돈은 왜 안 갖고 오셨어요
		Account acc = new Account();
		acc.setAccountNo("101-2");
		acc.setOwnerName("유길동");
		System.out.println(hong.infoPrint());//홍길동(100-1)님 잔액 : 2200000000원
		System.out.println(shin.infoPrint()); //신길동(100-1)님 잔액 : 0원
		System.out.println(acc.infoPrint());//유길동(101-2)님 잔액 : 0원
		shin.deposit(2000);
		shin.withdraw(3000); //신길동님 잔액이 부족하여 인출이 불가합니다 출력
		hong.withdraw(20000);
		acc.withdraw(10); //유길동님 잔액이 부족하여 인출이 불가합니다. 
		System.out.println(hong.infoPrint());//홍길동(100-1)님 잔액 : 2199980000원
		System.out.println(shin.infoPrint());//신길동(100-1)님 잔액 : 2000원
		System.out.println(acc.infoPrint());//유길동(101-2)님 잔액 : 0원
		//acc. setAcountNo ~~ 매개 변수 없는 애 때문에 ? 
		//shin.withdraw 때문에 잔액이 부족하여~~ 나오는 거? 
		//return 쓸때 안쓸때 
	}
}
