package com.lec.ex09_inheritance;
//creditcard�� �ܾ��̶� ���ϴ°� �ƴ϶� �ѵ��� ���ϴ� ��
//CreditLineAccount c2 = new CreditLineAccount("11-11","ȫ", "1111-2222-3333-4444",�ѵ�)
//CreditLineAccount c2 = new CreditLineAccount("11-11","ȫ", "1000","1111-2222-3333-4444","�ѵ�")
public class CreditLineAccount extends CheckingAccount {

	private int creditLine;//ī�� �ѵ� 

	
	public CreditLineAccount() {}
	public CreditLineAccount(String accountNo, String ownerName, String cardNo, int creditLine) {//�ܾ��� 0
		super(accountNo,ownerName, cardNo);
		this.creditLine = creditLine;
	}
	public CreditLineAccount(String accountNo, String ownerName, long balance, String cardNo, int creditLine) {
		super(accountNo,ownerName,balance,cardNo);
		this.creditLine = creditLine;
	}
	@Override
	public void pay(String cardNo, int amount) {
		if(this.getCardNo().equals(cardNo)) {//�ùٸ� ī�� ��ȣ���� Ȯ�� 
			if(creditLine>=amount) {
				creditLine=(creditLine-amount); 
				System.out.printf("%s(%s)�� %d�� �����Ͽ� �ѵ� %d�� ���ҽ��ϴ�\n", getOwnerName(),getAccountNo(), amount , creditLine);
			}else {
				System.out.printf("%s(%s)�� �ѵ� %d������ %d�� ���� �Ұ��մϴ�\n", getOwnerName(), getAccountNo(), creditLine, amount);
			}
		}else {
			System.out.println("�ùٸ� ī�� ��ȣ�� �Է��ϼ���");
		}//if
	}
	
}

