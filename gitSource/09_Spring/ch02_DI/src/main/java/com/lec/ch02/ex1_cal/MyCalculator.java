package com.lec.ch02.ex1_cal;
import lombok.Data;
@Data
public class MyCalculator {
	// --1)
	private Calculator calculator; // MyCalculator가 Calculator 에 있는 아이를 의존한다는 뜻
	
	// --2)
	private int num1;
	private int num2;
	
	// --3)은 어노테이션 class위에다 써주기 
	
	// --4) 
	public void add() {
		calculator.additon(num1, num2);
	}
	public void sub() {
		calculator.substraction(num1, num2);
	}
	public void mul() {
		calculator.multiplication(num1, num2);
	}
	public void div() {
		calculator.division(num1, num2);
	}
	
	
	//MyCalculator에서 new 해서 만들지 않고, 주입받아서 쓸 것
}
