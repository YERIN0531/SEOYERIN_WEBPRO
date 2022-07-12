package com.lec.ch02.ex2_bmi;
import java.util.ArrayList;
import lombok.Data;
@Data
public class MyInfro {

	private String name;
	private double height;
	private double weight;
	private ArrayList<String> hobby;
	private BMICalculator bmiCalculator; // bmi 의존하겠다고 말하는 것
	
	private void bmiCal() {
		bmiCalculator.bmiCalculation(weight, height);
	}
	
	public void getInfo() {
		System.out.println("이름 : " + name);
		System.out.println("키 : " + height);
		System.out.println("몸무게 : " + weight);
		System.out.println("취미 : " + hobby);
		bmiCal();
	}
	
}
