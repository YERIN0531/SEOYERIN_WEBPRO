package com.lec.ex10_abstractClass;
//Employee : name,(공통 생성함수) computePay()(추상메소드),computeIncentive()(final 메소드)
//SalaryEmployee : name, annalSalary(추가), computePay(),computeIncentive()
//HourlyEmployee : name, hoursWorked, moneyPerHour, computePay(),computeIncentive()
//인센튼 200이 넘으면 10%주는 것. 
//연봉 의 월급 /14
public abstract class Employee {

	private String name;
	
	public Employee (String name) {// name은 공통점이기 때문에 정규직과 아르바이트의 월급 형태는 super 쓰고 난 후 데이터 추가 
		this.name = name;
	}
	
	public abstract int computePay(); // 정규직과 아르바이트생의 계산 법이 다르기 때문에 오버라이드 할 필요 있음
	
	public final int computeIncentive() { //static 넣으면 안됨 
		
//		실무에선 첫번째 방법이 더 많이 쓰임.. 변수로 다시 지정하는거 알아두기 
//		int pay = computeIncentive();
//		if(pay>2000000 ) {
//			return (int) (pay*0.1);
//		}
//		return 0;
		
		if(computePay()>=2000000) {
		
			return (int) (computePay()*0.1);
		
		}else
	
		return  0;
	
	}		
	
	public String getName() {
		return name;
	
	}

	public void setName(String name) {
		this.name = name;
	
	}		

}
		





