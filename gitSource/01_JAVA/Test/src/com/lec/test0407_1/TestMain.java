package com.lec.test0407_1;

import java.util.Scanner;

public class TestMain {

	public static void main(String[] args) {
		
		Friend [] friend = {new Friend("ȫ�浿","����� ��걸","010-9999-1234","05-22"),
							new Friend("��浿","��õ�� ����","010-8888-8888","04-07")};
		Scanner scanner = new Scanner(System.in);		
		while(true) {
			System.out.print(" �˻��� �ּ� �� ���� 2�ڸ� (�� ���Ḧ ���Ͻø� X�� �Է��Ͻÿ�)");
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
				System.out.println("�ش� ��ȭ��ȣ�� ģ���� �����ϴ�");
				break;
			}
			scanner.close();
		}//while
		
	}
}
