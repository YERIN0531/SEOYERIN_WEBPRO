package com.lec.ex14_exception;

public interface ILendable {

	public /*static final*/ byte STATE_BORROWED = 1; //���� �� 
	public byte STATE_NORMAL = 0; //���� ����
	
	// ������ �Ϸ��µ� �̹� ����� å? �ݳ��� �Ϸ��µ� �̹� �ݳ��� å? ----> �� �κп� ���� ���� ���� ó�� 
	public void checkOut(String borrower)throws Exception; //����  
	public void checkIn() throws Exception; // �ݳ� [��ü�� ��ü�� �ްԲ� �Ұ���]
	
}
