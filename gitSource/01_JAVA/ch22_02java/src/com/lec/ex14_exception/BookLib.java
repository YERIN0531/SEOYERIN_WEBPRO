package com.lec.ex14_exception;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Scanner;

public class BookLib implements ILendable {

	private String bookNo;			//å��ȣ
	private String bookTitle;		//å�̸�
	private String writer;			//����
	private String borrower;		//������
	private Date checkoutDate;		//������
	private byte state;				//������(1) or ���Ⱑ��(0)
		
	public BookLib(String bookNo, String bookTitle, String writer) {
		this.bookNo = bookNo;
		this.bookTitle = bookTitle;
		this.writer = writer;
	}
	// BookLib book = new BookLin("89a-01","java","ȫ�浿");
	// book.checkOut("�ű浿") : �������� Ȯ�� -> ������� -> ����������� 
	@Override
	public void checkOut(String borrower) throws Exception { //�긦 ȣ���� �ִ� ������ try catch ������ .. ���⼱ �ϴ� ���� 
		if(state == STATE_BORROWED) { //�������� ���̶�� 
			throw new Exception(bookTitle + "������ �ڴ����ߡ� �Դϴ�");//���ܸ� ������ �߻� ��Ű�� //�ѹ� ������ �ű� ������ throws�ƴϰ� throw 
		}
		// ������� ----- ������ ������ ���� 
		this.borrower = borrower; // �Ű������� �� borrower�� �� ��ü�� borrower�� �ְ�
		checkoutDate = new Date();
		state = STATE_BORROWED;
		// java ������ ����Ǿ����ϴ�. ������ : �ű浿 ������ : 2022-4-4(��) 2���̳��� �ݳ��ϼ��� 
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-M-d(E)");
		System.out.println("\"" + bookTitle + "\" ������ ����Ǿ����ϴ�." );
		System.out.println("������ : " + borrower + "������ : " + sdf.format(checkoutDate) + " 2�� ���� �ݳ��ϼ���");
									//���⼭ borrower�� �� �Ű������� ���� borrower�� 
	}
	//book.checkIn() : ���� ���� Ȯ�� -> �ݳ����°� �ƴϸ� ���� ���� �߻� -> ��ü���� Ȯ��(��ü�� �� ���� ���ڿ� ���� ���� ���) 
	//-> (if. ��ü�Ǿ��� ��� ��ü�� ���� yes or no) -> �ݳ����� -> ������� 
	@Override
	public void checkIn() throws Exception {
		if(state == STATE_NORMAL) {
			throw new Exception(bookTitle + "������ �̹�  �ڹݳ� �Ϸ� or ������ ���� ������  å�Դϴ�.");
		}
		//��ü���� Ȯ�� checkOutDate~������� 14�� �̳����� ���� //API_date_Ex03_gc_term Ȯ��  
		//Ư�� ������ checkoutDate�� ���� 
		//���� ������ ������ �;ߵ�. now��� ���� ���� ����
		Date now = new Date();
		long diff = now.getTime() - checkoutDate.getTime();//����������� ��������� �и����� 
		long day = diff / (1000*60*60*24); //�츮�� �ñ��Ѱ� �̸������� �ƴ϶� ��ĥ ���������̱� ������ day ���� �ϳ� �� �������ص� ������ֱ� 
										   // long���̱� ������ ������ ������ ��µ� 
		if(day>14) { //��ü�� ��� //��'�ް�' �ݳ� ���� ��Ű��  
			System.out.println("��ü��� ���� 100�� �ΰ��˴ϴ�. ���ž��� ��ü��� " + (day-14)*100);
			Scanner scanner = new Scanner(System.in); // ��ü�� �ȵǸ� ��ĳ�ʰ� �ʿ���� ������ �ʿ��� �κп� ��ĳ�� ��������  //��ĳ�� Ŭ����� �����Լ������� ���� �� ���� 
			System.out.print("��ü�Ḧ ���̳��� (Y/N)");
			if(! scanner.next().equalsIgnoreCase("y")) {// ��ü�Ḧ �´ٰ� y�� �Է����� ���� ��� //y�� �������� ����ǵ��� ������ ���� �����  
				System.out.println("��ü�Ḧ �����ϼž� �ݳ�ó���� �����մϴ�. ��ü�Ḧ ������");
				return; //���̻� ���� ���� �ϸ� �ȵǴϱ� return �ؾߵ� //void�� ������ ���ϸ� �ؾߵ� return = 0 �̷��� �ϸ� �ȵ�  
			}
		}
//		else { //��ü �ȵ� ���  //��'�ȹް�' �ݳ� ���� ��Ű��  ���� �׳� �ٷ� �ݳ� ���� ���� �ص� �Ǳ� ������else ���� �� 
//		}
		borrower = null;//�ּҸ� ��ƾ� �ϴ� ���� �� ��ü���� �� null ���� �� ���� 
		checkoutDate = null;
		state = STATE_NORMAL;
		System.out.println("\"" + bookTitle + "\"������ �ڹݳ��ڵǾ����ϴ�");
	}
	// sysout(book) -> å��ȣ : 89��-01 å�̸� : java ���� : ȫ�浿 ���Ⱑ�� 
	//				-> å��ȣ : 89��-01 å�̸� : java ���� : ȫ�浿 ������(������:2022-4-4(��))
	@Override
	public String toString() {
		String msg = "å��ȣ : " + bookNo + "\tå�̸� : " + bookTitle + "\t���� : " + writer;
		msg += (state ==STATE_NORMAL)? "\t���Ⱑ��" : "\t������ ";
		if(state == STATE_BORROWED) {//�������� ���¸� �ݳ������� ����ؾߵ� 
//	�ݳ������� ������ �� �����̿����� �ڹٿ��� �̷����� ����� �� ����.. ����Ŭ���� �ٽ� �ϴ� �ɷ� 
//			//�������� + 14��
//			Date date = new Date(checkoutDate.getTime() + (1000*60*60*24*14)); //üũ�ƿ� ������ �и����� 
//								// ���� ������ ����� ���� ��  	+ //�� 14�� �� �� ����� ���� 
			SimpleDateFormat sdf = new SimpleDateFormat("(������ : yyyy-M-d(E))");
			msg += sdf.format(checkoutDate);
		}
		return msg;
	
	}
	public void setCheckoutDate(Date checkoutDate) { //�������� 2�������� ����� ���� (��ü�� �׽�Ʈ ����), ���������� setter ������ֱ� 
		this.checkoutDate = checkoutDate;
	}
	
	
	

}
