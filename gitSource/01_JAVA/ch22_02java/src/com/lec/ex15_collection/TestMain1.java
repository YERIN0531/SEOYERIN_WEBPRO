package com.lec.ex15_collection;

import java.util.ArrayList;
import java.util.Scanner;

public class TestMain1 {

	public static void main(String[] args) {
		ArrayList<Member> member = new ArrayList<Member>();
		Scanner scanner = new Scanner(System.in);
		String answer, name,  address, tel;
		
		do {
			System.out.print("ȸ�������� �Ͻðڽ��ϱ�(Y/N) ");
			answer = scanner.next();
		if(answer.equalsIgnoreCase("n")) {
			break;
		}else if(answer.equalsIgnoreCase("y")) {
			System.out.print("������ �Է��ϼ��� : ");
			name = scanner.next();
			System.out.print("��ȭ��ȣ�� �Է��ϼ��� : ");
			tel = scanner.next();
			scanner.nextLine();
			System.out.print("�ּҸ� �Է��ϼ��� : ");
			address = scanner.next();
			member.add(new Member(name, tel, address));
		}
		}while(true);
		if(member.isEmpty()) {
			System.out.println("****��ϵ� ȸ���� �����ϴ�****");
		}else {
			for(Member temp : member) {
				System.out.println(temp);
			}
		}
	}
}
