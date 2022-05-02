package com.lec.ex11_interface;

import java.util.Scanner;

public class TestMain_book {

	public static void main(String[] args) {
		
		BookLib[] books = {new BookLib("890��-101-1��","java","ȫ�浿"),
							new BookLib("100��-233-1��","dbms","ȫ���"),
							new BookLib("200��-111-3��","web","�ű浿"),
							new BookLib("168��-010-1��","jsp","��浿"),
							new BookLib("770��-123-2��","spring","��浿")};
	
		Scanner scanner = new Scanner(System.in);
		int fn; // (��ɹ�ȣ(1:���� | 2:�ݳ� | 3:ålist | 0:����))
		int idx; // �����ϰų� �ݳ��Ϸ��� �� ��, ��ȸ�� å�� idx 
		String bTitle, borrower, checkOutDate; 
		
		do {
			System.out.print("1:���� | 2:�ݳ� | 3:ålist | 0:����");
			fn = scanner.nextInt();
			switch(fn) {
			case 1: 
				System.out.print("�����ϰ��� �ϴ� å �̸��� ? ");
				bTitle = scanner.next();
				
			for(idx=0 ; idx<books.length ; idx++) {
				if(books[idx].getBookTitle().equals(bTitle)) {
					break;
				}//if
			} // å ��ȸ for
			if(idx==books.length) {
				System.out.println("���� �������� ���� �����Դϴ�.");
			}else {
				if(books[idx].getState() == BookLib.STATE_BORROWED) {
				System.out.println("���� �������� �����Դϴ�");	
				}else {//���� ���� ����
					System.out.print("�����ڴ�?");
					borrower = scanner.next();
					System.out.print("��������?");
					checkOutDate = scanner.next();
					books[idx].checkOut(borrower, checkOutDate);
					
				}
			}
			break;
			
			case 2: 
				System.out.println("�ݳ��� å �̸���?");
				bTitle = scanner.next();
				
				for(idx = 0 ; idx<books.length ; idx++) {
					if(bTitle.equals(books[idx].getBookTitle())) {
						break;
					}
				}
			if(idx == books.length) {
				System.out.println("�ش� ������ �� �������� å�� �ƴմϴ�.");
			}else {
				books[idx].checkIn();
			}
			break;
			
			case 3:
				System.out.println("å ����Ʈ�� ������ �����ϴ�.");
				for(BookLib book : books) {
					book.printState();
				}
				break;
			}//switch
		}while(fn != 0);
		System.out.println("�ȳ��� ������ ");
	
	
	
	
	
	
	
	
	
	}
}
