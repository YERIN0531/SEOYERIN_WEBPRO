package com.lec.ex15_collection;

import java.util.ArrayList;
import java.util.Scanner;

public class TestMain1 {

	public static void main(String[] args) {
		ArrayList<Member> member = new ArrayList<Member>();
		Scanner scanner = new Scanner(System.in);
		String answer, name,  address, tel;
		
		do {
			System.out.print("회원가입을 하시겠습니까(Y/N) ");
			answer = scanner.next();
		if(answer.equalsIgnoreCase("n")) {
			break;
		}else if(answer.equalsIgnoreCase("y")) {
			System.out.print("성함을 입력하세요 : ");
			name = scanner.next();
			System.out.print("전화번호를 입력하세요 : ");
			tel = scanner.next();
			scanner.nextLine();
			System.out.print("주소를 입력하세요 : ");
			address = scanner.next();
			member.add(new Member(name, tel, address));
		}
		}while(true);
		if(member.isEmpty()) {
			System.out.println("****등록된 회원이 없습니다****");
		}else {
			for(Member temp : member) {
				System.out.println(temp);
			}
		}
	}
}
