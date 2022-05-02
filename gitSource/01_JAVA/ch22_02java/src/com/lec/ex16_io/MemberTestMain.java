package com.lec.ex16_io;

import java.io.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Scanner;

public class MemberTestMain {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		ArrayList<Member> member = new ArrayList<Member>();
		String answer, name, phone, address;
		String birth;
		OutputStream fos = null;
		
		File file = new File("d://webPro/SOURCE/01_JAVA/ch17_io/src/com/lec/ex5homework/member.txt");
		
		try {
			fos = new FileOutputStream(file,true);
			while(true) {
				System.out.print("ȸ�� ������ �Ͻðڽ��ϱ� (Y/N)");
				answer = sc.next();
				if(answer.equalsIgnoreCase("n")) {
					break;
				}else if(answer.equalsIgnoreCase("y")) {
					System.out.print("������ �Է��ϼ��� : ");
					name = sc.next();
					System.out.print("��ȭ��ȣ�� �Է��ϼ��� : ");
					phone = sc.next();
					System.out.print("������ �Է��ϼ��� : ");
					birth = sc.next();
					Date now = new Date();
					SimpleDateFormat sdf = new SimpleDateFormat("MM-dd");
					String nowStr = sdf.format(now);
					if(birth.equals(nowStr)) {
						System.out.println("�ڡڡڻ����� ���ϵ帳�ϴ١ڡڡ�");
					}
					sc.nextLine();
					System.out.println("�ּҸ� �Է��ϼ��� : ");
					address = sc.nextLine();
					member.add(new Member(name, phone, birth, address));
				}//else if
				
			}//while
			if(member.isEmpty()) {
				System.out.println("�١١ٵ�ϵ� ȸ���� �����ϴ١١١�");
			}else {
				for(Member members : member) {
					System.out.println(members);
					fos.write(members.toString().getBytes());
				}
				System.out.println("...����" + member.size() + "�� ����");
			}
		
		} catch (FileNotFoundException e) {
			System.out.println(e.getMessage());
		} catch (IOException e) {
			System.out.println(e.getMessage());
		} finally {
				try {
					if(fos !=null) fos.close();
				} catch (IOException e) {
					System.out.println(e.getMessage());
				}
				
		}
	}
}
