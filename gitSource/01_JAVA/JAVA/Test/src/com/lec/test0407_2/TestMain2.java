package com.lec.test0407_2;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Scanner;

public class TestMain2 {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		HashMap<String,Customer> customer = new HashMap<String,Customer>();
		String answer,name,address,phone;
		OutputStream fos = null;
		File file = new File("d://webPro/SOURCE/01_JAVA/Test/src/com/lec/test0407_2/customer.txt");
		
		try {
			fos = new FileOutputStream(file,true);
		while(true) {
			System.out.print("ȸ�������� ���ϼ���(Y/N)");
			answer = sc.next();
			if(answer.equalsIgnoreCase("n")) {
				break;
			}else if(answer.equalsIgnoreCase("y")) {
				System.out.print("������ �Է��ϼ��� : ");
				name = sc.next();
				System.out.print("��ȭ��ȣ�� �Է��ϼ��� : ");
				phone = sc.next();
				System.out.print("�ּҸ� �Է��ϼ��� : ");
				sc.nextLine();
				address = sc.nextLine();
				customer.put(phone,new Customer(name, phone, address));
			}//esle if
		}// while
		if(customer.isEmpty()) {
			System.out.println("****��ϵ� ȸ���� �����ϴ�****");
		}else {
			Iterator<String> iterator = customer.keySet().iterator();
			while(iterator.hasNext()) {
				String key = iterator.next();
				System.out.println(customer.get(key));
			}
			System.out.println("....����" + customer.size() + "�� ���� ");
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
