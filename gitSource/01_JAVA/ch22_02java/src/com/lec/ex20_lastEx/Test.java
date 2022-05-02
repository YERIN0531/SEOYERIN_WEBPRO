package com.lec.ex20_lastEx;

import java.util.ArrayList;
import java.util.Vector;

import com.lec.ex3_student.StudentDao;
import com.lec.ex3_student.StudentDto;

public class Test {

	public static void main(String[] args) {
		
		CustomerDao dao = CustomerDao.getInstance();
		
		System.out.println("0번 테스트");
		Vector<String> lnamelist = dao.getLevelName();
		System.out.println(lnamelist);
		
		System.out.println("1번 테스트");
		CustomerDto dto = dao.cidGetCustomer(1);
		System.out.println(dto);
		
		System.out.println("2번 테스트");
		ArrayList<CustomerDto> dtos = dao.ctelGetCustomer("010-3333-3333");
		System.out.println(dtos);
		
		System.out.println("3번 테스트");
		ArrayList<CustomerDto> dtoss = dao.cnameGetCustomer("홍길동");
		System.out.println(dtoss);
		
		System.out.println("4번테스트 포인트구매");
		int result = dao.buyWithPoint(1, 900);
		System.out.println(result==CustomerDao.SUCCESS? "성공":"실패");
		
		System.out.println("5번테스트 물품구매");
		result = dao.buy(2, 50000);
		System.out.println(result==CustomerDao.SUCCESS? "성공":"실패");
		
		System.out.println("6번테스트 등급별출력");
		ArrayList<CustomerDto> dtosss = dao.lnameGetCustomer("NORMAL");
		System.out.println(dtosss);
		
		
		System.out.println("7번테스트 전체출력");
		ArrayList<CustomerDto> dtossss = dao.getCustomer();
		System.out.println(dtossss);
		
		
//		System.out.println("8번테스트 회원가입 ");
//		result = dao.insertCustomer("010-6666-6666", "아이유");
//		System.out.println(result==CustomerDao.SUCCESS? "성공":"실패");
		
		System.out.println("9번테스트 번호수정");
		result = dao.updateCustomer(7, "010-1234-1234");
		System.out.println(result==CustomerDao.SUCCESS? "성공":"실패");
		
		System.out.println("10번테스트 회원탈퇴 ");
		result = dao.deleteCustomer("010-1234-1234");
		System.out.println(result==CustomerDao.SUCCESS? "성공":"실패");
	}
}
