package com.lec.ex10_abstractClass;
//Employee : name,(���� �����Լ�) computePay()(�߻�޼ҵ�),computeIncentive()(final �޼ҵ�)
//SalaryEmployee : name, annalSalary(�߰�), computePay(),computeIncentive()
//HourlyEmployee : name, hoursWorked, moneyPerHour, computePay(),computeIncentive()
//�μ�ư 200�� ������ 10%�ִ� ��. 
//���� �� ���� /14
public abstract class Employee {

	private String name;
	
	public Employee (String name) {// name�� �������̱� ������ �������� �Ƹ�����Ʈ�� ���� ���´� super ���� �� �� ������ �߰� 
		this.name = name;
	}
	
	public abstract int computePay(); // �������� �Ƹ�����Ʈ���� ��� ���� �ٸ��� ������ �������̵� �� �ʿ� ����
	
	public final int computeIncentive() { //static ������ �ȵ� 
		
//		�ǹ����� ù��° ����� �� ���� ����.. ������ �ٽ� �����ϴ°� �˾Ƶα� 
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
		





