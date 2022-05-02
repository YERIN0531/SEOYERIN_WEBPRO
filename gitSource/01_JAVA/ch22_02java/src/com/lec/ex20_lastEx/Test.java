package com.lec.ex20_lastEx;

import java.util.ArrayList;
import java.util.Vector;

import com.lec.ex3_student.StudentDao;
import com.lec.ex3_student.StudentDto;

public class Test {

	public static void main(String[] args) {
		
		CustomerDao dao = CustomerDao.getInstance();
		
		System.out.println("0�� �׽�Ʈ");
		Vector<String> lnamelist = dao.getLevelName();
		System.out.println(lnamelist);
		
		System.out.println("1�� �׽�Ʈ");
		CustomerDto dto = dao.cidGetCustomer(1);
		System.out.println(dto);
		
		System.out.println("2�� �׽�Ʈ");
		ArrayList<CustomerDto> dtos = dao.ctelGetCustomer("010-3333-3333");
		System.out.println(dtos);
		
		System.out.println("3�� �׽�Ʈ");
		ArrayList<CustomerDto> dtoss = dao.cnameGetCustomer("ȫ�浿");
		System.out.println(dtoss);
		
		System.out.println("4���׽�Ʈ ����Ʈ����");
		int result = dao.buyWithPoint(1, 900);
		System.out.println(result==CustomerDao.SUCCESS? "����":"����");
		
		System.out.println("5���׽�Ʈ ��ǰ����");
		result = dao.buy(2, 50000);
		System.out.println(result==CustomerDao.SUCCESS? "����":"����");
		
		System.out.println("6���׽�Ʈ ��޺����");
		ArrayList<CustomerDto> dtosss = dao.lnameGetCustomer("NORMAL");
		System.out.println(dtosss);
		
		
		System.out.println("7���׽�Ʈ ��ü���");
		ArrayList<CustomerDto> dtossss = dao.getCustomer();
		System.out.println(dtossss);
		
		
//		System.out.println("8���׽�Ʈ ȸ������ ");
//		result = dao.insertCustomer("010-6666-6666", "������");
//		System.out.println(result==CustomerDao.SUCCESS? "����":"����");
		
		System.out.println("9���׽�Ʈ ��ȣ����");
		result = dao.updateCustomer(7, "010-1234-1234");
		System.out.println(result==CustomerDao.SUCCESS? "����":"����");
		
		System.out.println("10���׽�Ʈ ȸ��Ż�� ");
		result = dao.deleteCustomer("010-1234-1234");
		System.out.println(result==CustomerDao.SUCCESS? "����":"����");
	}
}
