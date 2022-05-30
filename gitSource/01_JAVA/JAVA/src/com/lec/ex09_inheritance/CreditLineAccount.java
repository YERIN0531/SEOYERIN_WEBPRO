package com.lec.ex09_inheritance;
//creditcard는 잔액이랑 비교하는게 아니라 한도랑 비교하는 것
//CreditLineAccount c2 = new CreditLineAccount("11-11","홍", "1111-2222-3333-4444",한도)
//CreditLineAccount c2 = new CreditLineAccount("11-11","홍", "1000","1111-2222-3333-4444","한도")
public class CreditLineAccount extends CheckingAccount {

	private int creditLine;//카드 한도 

	
	public CreditLineAccount() {}
	public CreditLineAccount(String accountNo, String ownerName, String cardNo, int creditLine) {//잔액은 0
		super(accountNo,ownerName, cardNo);
		this.creditLine = creditLine;
	}
	public CreditLineAccount(String accountNo, String ownerName, long balance, String cardNo, int creditLine) {
		super(accountNo,ownerName,balance,cardNo);
		this.creditLine = creditLine;
	}
	@Override
	public void pay(String cardNo, int amount) {
		if(this.getCardNo().equals(cardNo)) {//올바른 카드 번호인지 확인 
			if(creditLine>=amount) {
				creditLine=(creditLine-amount); 
				System.out.printf("%s(%s)님 %d원 지불하여 한도 %d원 남았습니다\n", getOwnerName(),getAccountNo(), amount , creditLine);
			}else {
				System.out.printf("%s(%s)님 한도 %d원으로 %d원 지불 불가합니다\n", getOwnerName(), getAccountNo(), creditLine, amount);
			}
		}else {
			System.out.println("올바른 카드 번호를 입력하세요");
		}//if
	}
	
}

