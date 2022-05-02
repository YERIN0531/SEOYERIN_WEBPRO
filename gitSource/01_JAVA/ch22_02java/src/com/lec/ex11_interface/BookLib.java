package com.lec.ex11_interface;

public class BookLib extends Bookinfo implements ILendable {

	private String borrower;
	private String checkoutDate;
	private byte state;
	
	public BookLib(String bookNo, String bookTitle, String writer) {
		super(bookNo, bookTitle, writer);
	}

	@Override
	public void checkOut(String borrower, String checkoutDate) { //�����ϰ������ 
		if(state == STATE_BORROWED) {//���°� �������̶��. �� ���°� 1�̶�� 
			System.out.println(getBookTitle() + " ������ �������Դϴ�.");
		}else {//���°� ���� ���� . �� 1�̶�� 
			this.borrower = borrower;
			this.checkoutDate = checkoutDate;
			state = STATE_BORROWED; // ������ ���·� ��ȯ 
			System.out.println(getBookTitle() + "������ ���� ó�� �Ǿ����ϴ�.");
			System.out.println("������ : " + borrower + "������ : " + checkoutDate);
			
		}
	}

	@Override
	public void checkIn() { //�ݳ��ϰ� ���� �� 
		if(state == STATE_NORMAL) {//������ �ȵ� ��Ȳ�̶��.. �� ���°� 0�̶�� �ݳ��� �ʿ䰡 ���� �� 
			System.out.println(getBookTitle()+" ������ �̹� �ݳ� ó���� �����Դϴ�. �ٽ� Ȯ�����ּ���  ");
			return;
		}// state �� 1�� ���·� ������ . 
		state = STATE_NORMAL; // ���� ������ ���·� �ٲ���� �ݳ�ó�� �Ϸ� �� �� 
		System.out.println(getBookTitle() + " ������ �ݳ� �Ϸ�Ǿ����ϴ�. ");
	}

	@Override
	public void printState() {
		if(state == STATE_NORMAL) {//���Ⱑ���� ���¸� 
			System.out.println(getBookNo() + "\t" + getBookTitle() + "(" + getWriter() + "����) ���Ⱑ��");
		}else if(state ==STATE_BORROWED) {//�������� ���¸�
			System.out.println(getBookNo() + "\t" + getBookTitle() + "(" + getWriter() + "����) ������");
		}else {
			System.out.println(getBookNo() + "\t" + getBookTitle() + "(" + getWriter() + "����) �߸� �� �����Դϴ�.");
		}
		
	}

	public String getBorrower() {
		return borrower;
	}

	public String getCheckoutDate() {
		return checkoutDate;
	}

	public byte getState() {
		return state;
	}

}

	
	
	
	
	
	
	
	
	