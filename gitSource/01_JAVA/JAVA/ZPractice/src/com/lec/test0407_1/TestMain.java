package com.lec.test0407_1;

import java.util.Scanner;

public class TestMain {
// 객체 생성하고, 주소의 앞자리가 입력값이 같으면 출력 하기 
// 검색할 주소 앞 글자 2자리 (종료를 원하면 x)
	public static void main(String[] args) {
		Friend [] friend = {new Friend("홍길동","서울시 용산구","010-9999-1234","05-22"),
							new Friend("김길동","인천시 부평구","010-8888-8888","04-07")};
		Scanner scanner = new Scanner(System.in);
		do {
			System.out.println("검색할 주소를 입력하세요 (종료를 원하시면 X)");
			String answer = scanner.next();
			if(answer.equalsIgnoreCase("x")) break;
			boolean searchOk = false;
			for(int idx = 0 ; idx<friend.length ; idx++) {
				String add = friend[idx].getAddress();
				String pre = add.substring(0,2);
				if(pre.equals(answer)) {
					System.out.println(friend[idx]);
					searchOk = true;
				}
			}
			if(! searchOk) {
				System.out.println("해당 주소의 회원이 없습니다");
			}
		}while(true);
	}
}
