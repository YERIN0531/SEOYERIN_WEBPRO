package com.lec.ex15_collection;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Scanner;

public class TestMain2 {

	public static void main(String[] args) {
		HashMap<String, Member> member = new HashMap<String, Member>();
		Scanner scanner = new Scanner(System.in);
		String answer, name, tel, address;
		do {
			System.out.print("회원 가입을 원하십니까 ? ");
			answer = scanner.next();
			if(answer.equalsIgnoreCase("n")) {
				break;
			}else if(answer.equalsIgnoreCase("y")) {
				System.out.print("성함을 입력해 주세요 : ");
				name = scanner.next();
				System.out.print("전화번호를 입력해 주세요 : ");
				tel = scanner.next();
				if(member.get(tel) != null) {
					System.out.println("기존에 등록된 전화번호가 존재합니다");
					continue;
				}
				System.out.print("주소를 입력해 주세요 : ");
				scanner.nextLine();
				address = scanner.nextLine();
				member.put(tel, new Member(name, tel, address));	
			}
		}while(true);
		if(member.isEmpty()) {
			System.out.println("****등록된 회원이 없습니다****");
		}else {
			System.out.println("****등록된 회원 목록 ****");
			Iterator<String> iterator = member.keySet().iterator();
			while(iterator.hasNext()) {
				String key = iterator.next();
				System.out.println(member.get(key));
			}
		}
	}
}
