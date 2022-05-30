package com.lec.test0407_2;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Scanner;

public class TestMain1 {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		ArrayList<Customer> customer = new ArrayList<Customer>();
		String answer,name,address,phone;
		OutputStream fos = null;
		File file = new File("d://webPro/SOURCE/01_JAVA/Test/src/com/lec/test0407_2/customer.txt");
		
		try {
			fos = new FileOutputStream(file,true);
		while(true) {
			System.out.print("회원가입을 원하세요(Y/N)");
			answer = sc.next();
			if(answer.equalsIgnoreCase("n")) {
				break;
			}else if(answer.equalsIgnoreCase("y")) {
				System.out.print("성함을 입력하세요 : ");
				name = sc.next();
				System.out.print("전화번호를 입력하세요 : ");
				phone = sc.next();
				System.out.print("주소를 입력하세요 : ");
				sc.nextLine();
				address = sc.nextLine();
				customer.add(new Customer(name, phone, address));
			}//esle if
		}// while
		if(customer.isEmpty()) {
			System.out.println("****등록된 회원이 없습니다****");
		}else {
			for(Customer customers : customer) {
				System.out.println(customers);
				fos.write(customers.toString().getBytes());
			}
			System.out.println("....이하" + customer.size() + "명 가입 ");
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
