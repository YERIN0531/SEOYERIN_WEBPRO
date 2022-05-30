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
		ArrayList<Customer> customer = new ArrayList<Customer>();
		Scanner scanner = new Scanner(System.in);
		String answer,name,phone,address;
		OutputStream fos = null;
		File file = new File("d://webPro/SOURCE/01_JAVA/ZPractice/src/com/lec/test0407_2/customer.txt");
		
		try {
			fos = new FileOutputStream(file,true);
			while(true) {
				System.out.print("회원 가입을 하시겠습니까?(Y/N)");
				answer = scanner.next();
				if(answer.equalsIgnoreCase("n")) {
					break;
				}else if(answer.equalsIgnoreCase("y")) {
					System.out.print("성함을 입력하세요 : ");
					name = scanner.next();
					System.out.print("번호를 입력하세요 : ");
					phone = scanner.next();
					scanner.nextLine();
					System.out.print("주소를 입력하세요 :  ");
					address = scanner.nextLine();
					customer.add(new Customer(name, phone, address));
				}//else if
			}//while
			if(customer.isEmpty()) {
				System.out.println("등록된 회원이 없습니다");
			}else {
				for(Customer customers : customer) {
					System.out.println(customers);
					fos.write(customer.toString().getBytes());
				}
			}
			
	
			
		} catch (FileNotFoundException e) {
			System.out.println(e.getMessage());
		} catch (IOException e) {
			System.out.println(e.getMessage());
		}
	}
}
