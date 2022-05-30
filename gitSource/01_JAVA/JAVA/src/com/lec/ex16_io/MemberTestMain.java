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
				System.out.print("회원 가입을 하시겠습니까 (Y/N)");
				answer = sc.next();
				if(answer.equalsIgnoreCase("n")) {
					break;
				}else if(answer.equalsIgnoreCase("y")) {
					System.out.print("성함을 입력하세요 : ");
					name = sc.next();
					System.out.print("전화번호를 입력하세요 : ");
					phone = sc.next();
					System.out.print("생일을 입력하세요 : ");
					birth = sc.next();
					Date now = new Date();
					SimpleDateFormat sdf = new SimpleDateFormat("MM-dd");
					String nowStr = sdf.format(now);
					if(birth.equals(nowStr)) {
						System.out.println("★★★생일을 축하드립니다★★★");
					}
					sc.nextLine();
					System.out.println("주소를 입력하세요 : ");
					address = sc.nextLine();
					member.add(new Member(name, phone, birth, address));
				}//else if
				
			}//while
			if(member.isEmpty()) {
				System.out.println("☆☆☆등록된 회원이 없습니다☆☆☆");
			}else {
				for(Member members : member) {
					System.out.println(members);
					fos.write(members.toString().getBytes());
				}
				System.out.println("...이하" + member.size() + "명 가입");
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
