package com.lec.ex11_interface;

import java.util.Scanner;

public class TestMain_book {

	public static void main(String[] args) {
		
		BookLib[] books = {new BookLib("890ㅁ-101-1ㄱ","java","홍길동"),
							new BookLib("100ㄱ-233-1ㄱ","dbms","홍길순"),
							new BookLib("200ㅁ-111-3ㄴ","web","신길동"),
							new BookLib("168ㅁ-010-1ㅅ","jsp","김길동"),
							new BookLib("770ㅁ-123-2ㅌ","spring","고길동")};
	
		Scanner scanner = new Scanner(System.in);
		int fn; // (기능번호(1:대출 | 2:반납 | 3:책list | 0:종료))
		int idx; // 대출하거나 반납하려고 할 때, 조회된 책의 idx 
		String bTitle, borrower, checkOutDate; 
		
		do {
			System.out.print("1:대출 | 2:반납 | 3:책list | 0:종료");
			fn = scanner.nextInt();
			switch(fn) {
			case 1: 
				System.out.print("대출하고자 하는 책 이름은 ? ");
				bTitle = scanner.next();
				
			for(idx=0 ; idx<books.length ; idx++) {
				if(books[idx].getBookTitle().equals(bTitle)) {
					break;
				}//if
			} // 책 조회 for
			if(idx==books.length) {
				System.out.println("현재 보유하지 않은 도서입니다.");
			}else {
				if(books[idx].getState() == BookLib.STATE_BORROWED) {
				System.out.println("현재 대출중인 도서입니다");	
				}else {//대출 가능 상태
					System.out.print("대출자는?");
					borrower = scanner.next();
					System.out.print("대출일은?");
					checkOutDate = scanner.next();
					books[idx].checkOut(borrower, checkOutDate);
					
				}
			}
			break;
			
			case 2: 
				System.out.println("반납할 책 이름은?");
				bTitle = scanner.next();
				
				for(idx = 0 ; idx<books.length ; idx++) {
					if(bTitle.equals(books[idx].getBookTitle())) {
						break;
					}
				}
			if(idx == books.length) {
				System.out.println("해당 도서는 본 도서관의 책이 아닙니다.");
			}else {
				books[idx].checkIn();
			}
			break;
			
			case 3:
				System.out.println("책 리스트는 다음과 같습니다.");
				for(BookLib book : books) {
					book.printState();
				}
				break;
			}//switch
		}while(fn != 0);
		System.out.println("안녕히 가세요 ");
	
	
	
	
	
	
	
	
	
	}
}
