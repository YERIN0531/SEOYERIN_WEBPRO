package com.lec.test0407_1;

import java.util.Scanner;

public class TestMain {
// ��ü �����ϰ�, �ּ��� ���ڸ��� �Է°��� ������ ��� �ϱ� 
// �˻��� �ּ� �� ���� 2�ڸ� (���Ḧ ���ϸ� x)
	public static void main(String[] args) {
		Friend [] friend = {new Friend("ȫ�浿","����� ��걸","010-9999-1234","05-22"),
							new Friend("��浿","��õ�� ����","010-8888-8888","04-07")};
		Scanner scanner = new Scanner(System.in);
		do {
			System.out.println("�˻��� �ּҸ� �Է��ϼ��� (���Ḧ ���Ͻø� X)");
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
				System.out.println("�ش� �ּ��� ȸ���� �����ϴ�");
			}
		}while(true);
	}
}
