package com.lec.test0428;

import java.util.ArrayList;

public class Test {

	public static void main(String[] args) {
		CustomerDao dao = CustomerDao.getInstance();
		
//		System.out.println("1���׽�Ʈ ");
//		int result = dao.insertCustomer("010-5555-5555", "������");
//		System.out.println(result);
//		System.out.println(result==CustomerDao.SUCCESS ?"�Է¼���" : "�Է½���");
		
		
		System.out.println("2���׽�Ʈ");
		ArrayList<CustomerDto> dto = dao.ctelGetCustomer("010-2222-2222");
		for(CustomerDto d : dto) {
			System.out.println(d);
		}
		
		System.out.println("3���׽�Ʈ");
		ArrayList<CustomerDto> dtos = dao.getCustomer();
		for(CustomerDto d:dtos) {
			
			System.out.println(d);
		}
	}
}
