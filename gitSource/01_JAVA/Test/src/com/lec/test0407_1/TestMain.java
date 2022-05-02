package com.lec.test0407_1;

import java.util.Scanner;

public class TestMain {

	public static void main(String[] args) {
		
		Friend [] friend = {new Friend("홍길동","서울시 용산구","010-9999-1234","05-22"),
							new Friend("김길동","인천시 부평구","010-8888-8888","04-07")};
		Scanner scanner = new Scanner(System.in);		
		while(true) {
			System.out.print(" 검색할 주소 앞 글자 2자리 (단 종료를 원하시면 X를 입력하시오)");
			String answer = scanner.next();
			if(answer.equalsIgnoreCase("x")) 
				break;
			boolean searchOk = false;
			for(int i = 0 ; i<friend.length ; i++) {
				String add2 = friend[i].getAddress();
				String pre = add2.substring(0,2);
				if(answer.equals(pre)) {
					System.out.println(friend[i]);
					searchOk = true;
				}//if

			} //for
			if(! searchOk) {
				System.out.println("해당 전화번호의 친구는 없습니다");
				break;
			}
			scanner.close();
		}//while
		
	}
}
