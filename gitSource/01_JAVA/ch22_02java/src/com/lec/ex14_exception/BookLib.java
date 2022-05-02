package com.lec.ex14_exception;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Scanner;

public class BookLib implements ILendable {

	private String bookNo;			//책번호
	private String bookTitle;		//책이름
	private String writer;			//저자
	private String borrower;		//대출인
	private Date checkoutDate;		//대출일
	private byte state;				//대출중(1) or 대출가능(0)
		
	public BookLib(String bookNo, String bookTitle, String writer) {
		this.bookNo = bookNo;
		this.bookTitle = bookTitle;
		this.writer = writer;
	}
	// BookLib book = new BookLin("89a-01","java","홍길동");
	// book.checkOut("신길동") : 도서상태 확인 -> 대출로직 -> 도서상태출력 
	@Override
	public void checkOut(String borrower) throws Exception { //얘를 호출한 애는 무조건 try catch 해주자 .. 여기선 일단 던져 
		if(state == STATE_BORROWED) { //대출중인 아이라면 
			throw new Exception(bookTitle + "도서는 ★대출중★ 입니다");//예외를 강제로 발생 시키기 //한번 던지는 거기 때문에 throws아니고 throw 
		}
		// 대출로직 ----- 대출이 가능한 상태 
		this.borrower = borrower; // 매개변수로 온 borrower를 내 객체의 borrower에 넣고
		checkoutDate = new Date();
		state = STATE_BORROWED;
		// java 도서가 대출되었습니다. 대출인 : 신길동 대출일 : 2022-4-4(월) 2주이내에 반납하세요 
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-M-d(E)");
		System.out.println("\"" + bookTitle + "\" 도서가 대출되었습니다." );
		System.out.println("대출인 : " + borrower + "대출일 : " + sdf.format(checkoutDate) + " 2주 내로 반납하세요");
									//여기서 borrower는 내 매개변수로 들어온 borrower임 
	}
	//book.checkIn() : 도서 상태 확인 -> 반납상태가 아니면 강제 예외 발생 -> 연체여부 확인(객체에 들어간 대출 일자와 현재 일자 계산) 
	//-> (if. 연체되었을 경우 연체료 납부 yes or no) -> 반납로직 -> 상태출력 
	@Override
	public void checkIn() throws Exception {
		if(state == STATE_NORMAL) {
			throw new Exception(bookTitle + "도서는 이미  ★반납 완료 or 대출이 되지 않은★  책입니다.");
		}
		//연체여부 확인 checkOutDate~현재까지 14일 이내인지 여부 //API_date_Ex03_gc_term 확인  
		//특정 시점은 checkoutDate에 있음 
		//현재 시점도 가지고 와야됨. now라는 변수 새로 설정
		Date now = new Date();
		long diff = now.getTime() - checkoutDate.getTime();//대출시점부터 현재까지의 밀리세컨 
		long day = diff / (1000*60*60*24); //우리가 궁금한건 미리세컨이 아니라 며칠 지났는지이기 때문에 day 변수 하나 더 설정해준뒤 계산해주기 
										   // long형이기 때문에 어차피 정수로 출력됨 
		if(day>14) { //연체된 경우 //돈'받고' 반납 로직 시키기  
			System.out.println("연체료는 일일 100원 부가됩니다. 내셔야할 연체료는 " + (day-14)*100);
			Scanner scanner = new Scanner(System.in); // 연체가 안되면 스캐너가 필요없기 때문에 필요한 부분에 스캐너 선언해줌  //스캐너 클로즈는 메인함수에서만 닫을 수 있음 
			System.out.print("연체료를 내셨나요 (Y/N)");
			if(! scanner.next().equalsIgnoreCase("y")) {// 연체료를 냈다고 y를 입력하지 않은 경우 //y를 누를때만 진행되도록 앞으로 로직 만들것  
				System.out.println("연체료를 납부하셔야 반납처리가 가능합니다. 연체료를 내세요");
				return; //더이상 로직 수행 하면 안되니까 return 해야됨 //void기 때문에 리턴만 해야됨 return = 0 이런거 하면 안됨  
			}
		}
//		else { //연체 안된 경우  //돈'안받고' 반납 로직 시키기  따라서 그냥 바로 반납 로직 수행 해도 되기 때문에else 빼도 됨 
//		}
		borrower = null;//주소를 담아야 하는 변수 즉 객체에는 다 null 넣을 수 있음 
		checkoutDate = null;
		state = STATE_NORMAL;
		System.out.println("\"" + bookTitle + "\"도서가 ★반납★되었습니다");
	}
	// sysout(book) -> 책번호 : 89ㅁ-01 책이름 : java 저자 : 홍길동 대출가능 
	//				-> 책번호 : 89ㅁ-01 책이름 : java 저자 : 홍길동 대출중(대출일:2022-4-4(월))
	@Override
	public String toString() {
		String msg = "책번호 : " + bookNo + "\t책이름 : " + bookTitle + "\t저자 : " + writer;
		msg += (state ==STATE_NORMAL)? "\t대출가능" : "\t대출중 ";
		if(state == STATE_BORROWED) {//대출중인 상태면 반납예정일 계산해야됨 
//	반납예정일 로직을 할 예정이였으나 자바에선 이로직이 제대로 안 나옴.. 오라클에서 다시 하는 걸로 
//			//빌린시점 + 14일
//			Date date = new Date(checkoutDate.getTime() + (1000*60*60*24*14)); //체크아웃 시점의 밀리세컨 
//								// 빌린 시점을 계산한 로직 ↑  	+ //↑ 14일 후 를 계산한 로직 
			SimpleDateFormat sdf = new SimpleDateFormat("(대출일 : yyyy-M-d(E))");
			msg += sdf.format(checkoutDate);
		}
		return msg;
	
	}
	public void setCheckoutDate(Date checkoutDate) { //대출일을 2주전으로 땡기기 위해 (연체료 테스트 위해), 임의적으로 setter 만들어주기 
		this.checkoutDate = checkoutDate;
	}
	
	
	

}
