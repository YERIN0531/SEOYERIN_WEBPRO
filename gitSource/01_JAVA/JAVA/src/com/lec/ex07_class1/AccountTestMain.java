package com.lec.ex07_class1;

public class AccountTestMain {

	public static void main(String[] args) {
		Account hong = new Account("100-1","ȫ�浿",2200000000L); //�����ڴ� sysout ���ϰ�, ������ �κп��� ����� ��.ȫ�浿(100-1)�� 2200000000�Ա� ���� ���� �����մϴ� 
		Account shin = new Account("100-1","�ű浿");//�ű浿(100-1)�� ���� ���� �����մϴ�. ���� �� �� ���� ���̾��
		Account acc = new Account();
		acc.setAccountNo("101-2");
		acc.setOwnerName("���浿");
		System.out.println(hong.infoPrint());//ȫ�浿(100-1)�� �ܾ� : 2200000000��
		System.out.println(shin.infoPrint()); //�ű浿(100-1)�� �ܾ� : 0��
		System.out.println(acc.infoPrint());//���浿(101-2)�� �ܾ� : 0��
		shin.deposit(2000);
		shin.withdraw(3000); //�ű浿�� �ܾ��� �����Ͽ� ������ �Ұ��մϴ� ���
		hong.withdraw(20000);
		acc.withdraw(10); //���浿�� �ܾ��� �����Ͽ� ������ �Ұ��մϴ�. 
		System.out.println(hong.infoPrint());//ȫ�浿(100-1)�� �ܾ� : 2199980000��
		System.out.println(shin.infoPrint());//�ű浿(100-1)�� �ܾ� : 2000��
		System.out.println(acc.infoPrint());//���浿(101-2)�� �ܾ� : 0��
		//acc. setAcountNo ~~ �Ű� ���� ���� �� ������ ? 
		//shin.withdraw ������ �ܾ��� �����Ͽ�~~ ������ ��? 
		//return ���� �Ⱦ��� 
	}
}
