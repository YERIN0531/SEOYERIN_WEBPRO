package com.lec.test0428;

import java.util.ArrayList;

public class Test {

	public static void main(String[] args) {
		CustomerDao dao = CustomerDao.getInstance();
		
//		System.out.println("1번테스트 ");
//		int result = dao.insertCustomer("010-5555-5555", "서예린");
//		System.out.println(result);
//		System.out.println(result==CustomerDao.SUCCESS ?"입력성공" : "입력실패");
		
		
		System.out.println("2번테스트");
		ArrayList<CustomerDto> dto = dao.ctelGetCustomer("010-2222-2222");
		for(CustomerDto d : dto) {
			System.out.println(d);
		}
		
		System.out.println("3번테스트");
		ArrayList<CustomerDto> dtos = dao.getCustomer();
		for(CustomerDto d:dtos) {
			
			System.out.println(d);
		}
	}
}
