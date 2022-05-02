package com.lec.ex10_abstractClass;

public class TestMain {

	public static void main(String[] args) {
		Employee[] sawon = { new SalaryEmployee("홍길동", 24000000),
							 new SalaryEmployee("강동원", 70000000),
							 new SalaryEmployee("김고은", 12000000),
							 new HourlyEmployee("홍길고", 100, 7000),
							 new HourlyEmployee("김길자", 120, 8000)};
	
		for(Employee temp : sawon) {
			System.out.println("~ ~ ~ 월급명세서 ~ ~ ~");
			System.out.println("성 함 : " + temp.getName());
			System.out.println("월 급 : " + temp.computePay());
		
		int tempIncen = temp.computeIncentive();// for문의 temp 안에 담긴 computeIncenTive 를 또 if로 정의 해야 하니깐 변수를 하나 더 설정해준것 
		if (tempIncen!=0) {
			System.out.println("상 여 : " + tempIncen);
		} // int 안 쓰고, tempIncen 자리에 바로 temp.computeIncentive 넣을 수 있긴 함. 위에가 더 좋은 방향 //
		}
	  }
	}

