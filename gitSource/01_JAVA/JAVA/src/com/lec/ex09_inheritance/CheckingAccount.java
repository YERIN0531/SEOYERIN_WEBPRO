package com.lec.ex09_inheritance;
//CheckingAccount a2 = new CheckingAccount("11-11","ȫ�浿",2000,"1111-1111-2222-3333"
//a2.pay ("1111-1111-2222-3333",1000);
public class CheckingAccount extends Account{

	private String cardNo;
	
	public CheckingAccount() {}
	public CheckingAccount(String accountNo, String ownerName, String cardNo) {//�ܾ��� 0
		super(accountNo,ownerName);
		this.cardNo = cardNo;
	}
	public CheckingAccount(String accountNo, String ownerName, long balance, String cardNo) {
		super(accountNo,ownerName,balance);
		this.cardNo = cardNo;
	}
	public void pay(String cardNo, int amount) {
		if(this.cardNo.equals(cardNo)) {//�ùٸ� ī�� ��ȣ���� Ȯ�� 
			if(getBalance()>=amount) {
				setBalance(getBalance()-amount); //balance = balance - amount;
				System.out.printf("%s(%s)�� %d�� �����Ͽ� �ܾ� %d�� ���ҽ��ϴ�\n", getOwnerName(),getAccountNo(), amount , getBalance());
			}else {
				System.out.printf("%s(%s)�� �ܾ� %d������ %d�� ���� �Ұ��մϴ�\n", getOwnerName(), getAccountNo(), getBalance(), amount);
			}
		}else {
			System.out.println("�ùٸ� ī�� ��ȣ�� �Է��ϼ���");
		}//if
	}//pay
	public String getCardNo() {
		return cardNo;
	}
	public void setCardNo(String cardNo) {
		this.cardNo = cardNo;
	}
	
	
}//class
