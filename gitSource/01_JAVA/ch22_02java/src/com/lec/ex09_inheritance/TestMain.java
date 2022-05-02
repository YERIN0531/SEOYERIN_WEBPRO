package com.lec.ex09_inheritance;

public class TestMain {

	public static void main(String[] args) {
		Account a1 = new Account("111-1111","홍길동");
		a1.deposit(3000);
		a1.deposit(6000);
		a1.withdraw(10000);
		a1.withdraw(4000);
		System.out.println(a1.infoPrint());
		System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
		CheckingAccount a2 = new CheckingAccount("222-2222","신길동",1000,"1111-2222-3333-4444");
		a2.deposit(9000);
		a2.withdraw(20000);
		a2.pay("1111-2222-3333-1111", 1000);
		a2.pay("1111-2222-3333-4444", 20000);
		a2.pay("1111-2222-3333-4444", 10000);
		CreditLineAccount a3 = new CreditLineAccount("333-3333","김길동","1111-1111-1111",10000);
		CreditLineAccount a4 = new CreditLineAccount("444-4444", "서길동",10000,"2222-2222-2222",10000);
		
		a3.deposit(10000);
		a3.withdraw(1000);
		a3.pay("1111-1111-1111", 2000);
		a4.deposit(10000);
		a4.pay("2222-2222-2222", 11000);
		a4.pay("2222-2222-2222", 4000);
	}
	
}
