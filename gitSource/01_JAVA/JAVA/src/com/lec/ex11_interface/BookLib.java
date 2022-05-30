package com.lec.ex11_interface;

public class BookLib extends Bookinfo implements ILendable {

	private String borrower;
	private String checkoutDate;
	private byte state;
	
	public BookLib(String bookNo, String bookTitle, String writer) {
		super(bookNo, bookTitle, writer);
	}

	@Override
	public void checkOut(String borrower, String checkoutDate) { //대출하고싶을때 
		if(state == STATE_BORROWED) {//상태가 대출중이라면. 즉 상태가 1이라면 
			System.out.println(getBookTitle() + " 도서는 대출중입니다.");
		}else {//상태가 대출 가능 . 즉 1이라면 
			this.borrower = borrower;
			this.checkoutDate = checkoutDate;
			state = STATE_BORROWED; // 대출중 상태로 전환 
			System.out.println(getBookTitle() + "도서가 대출 처리 되었습니다.");
			System.out.println("대출인 : " + borrower + "대출일 : " + checkoutDate);
			
		}
	}

	@Override
	public void checkIn() { //반납하고 싶을 때 
		if(state == STATE_NORMAL) {//대출이 안된 상황이라면.. 즉 상태가 0이라면 반납할 필요가 없는 것 
			System.out.println(getBookTitle()+" 도서는 이미 반납 처리된 도서입니다. 다시 확인해주세요  ");
			return;
		}// state 가 1인 상태로 떨어짐 . 
		state = STATE_NORMAL; // 대출 가능한 상태로 바꿔줘야 반납처리 완료 된 것 
		System.out.println(getBookTitle() + " 도서가 반납 완료되었습니다. ");
	}

	@Override
	public void printState() {
		if(state == STATE_NORMAL) {//대출가능한 상태면 
			System.out.println(getBookNo() + "\t" + getBookTitle() + "(" + getWriter() + "지음) 대출가능");
		}else if(state ==STATE_BORROWED) {//대출중인 상태면
			System.out.println(getBookNo() + "\t" + getBookTitle() + "(" + getWriter() + "지음) 대출중");
		}else {
			System.out.println(getBookNo() + "\t" + getBookTitle() + "(" + getWriter() + "지음) 잘못 된 상태입니다.");
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

	
	
	
	
	
	
	
	
	