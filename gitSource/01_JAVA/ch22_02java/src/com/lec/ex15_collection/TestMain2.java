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
			System.out.print("ȸ�� ������ ���Ͻʴϱ� ? ");
			answer = scanner.next();
			if(answer.equalsIgnoreCase("n")) {
				break;
			}else if(answer.equalsIgnoreCase("y")) {
				System.out.print("������ �Է��� �ּ��� : ");
				name = scanner.next();
				System.out.print("��ȭ��ȣ�� �Է��� �ּ��� : ");
				tel = scanner.next();
				if(member.get(tel) != null) {
					System.out.println("������ ��ϵ� ��ȭ��ȣ�� �����մϴ�");
					continue;
				}
				System.out.print("�ּҸ� �Է��� �ּ��� : ");
				scanner.nextLine();
				address = scanner.nextLine();
				member.put(tel, new Member(name, tel, address));	
			}
		}while(true);
		if(member.isEmpty()) {
			System.out.println("****��ϵ� ȸ���� �����ϴ�****");
		}else {
			System.out.println("****��ϵ� ȸ�� ��� ****");
			Iterator<String> iterator = member.keySet().iterator();
			while(iterator.hasNext()) {
				String key = iterator.next();
				System.out.println(member.get(key));
			}
		}
	}
}
