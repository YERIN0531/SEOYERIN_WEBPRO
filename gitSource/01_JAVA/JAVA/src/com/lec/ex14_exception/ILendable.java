package com.lec.ex14_exception;

public interface ILendable {

	public /*static final*/ byte STATE_BORROWED = 1; //대출 중 
	public byte STATE_NORMAL = 0; //대출 가능
	
	// 대출을 하려는데 이미 대출된 책? 반납을 하려는데 이미 반납한 책? ----> 그 부분에 대해 각각 예외 처리 
	public void checkOut(String borrower)throws Exception; //대출  
	public void checkIn() throws Exception; // 반납 [연체시 연체비 받게끔 할거임]
	
}
