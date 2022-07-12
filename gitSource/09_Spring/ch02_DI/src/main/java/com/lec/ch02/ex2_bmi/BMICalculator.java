package com.lec.ch02.ex2_bmi;

import lombok.Data;

@Data
public class BMICalculator {

	private double lowWeight;
	private double normal;
	private double overWeight;
	private double obesity;
	
	public void bmiCalculation(double weight, double height) { // 60 170 - 60/(1.7*1.7)
		//들어온 키를 소숫점으로 바꾸기 
		double h = height*0.01;
		//bmi 지수 계산하기
		double result = weight/(h*h);
		System.out.println("BMI 지수 : " + result);
		//result 가 비
		if(result>obesity) {
			System.out.println("비만입니다");
		}else if(result>overWeight){
			System.out.println("과체중입니다");
		}else if(result>normal) {
			System.out.println("정상체중입니다");
		}else if(result>lowWeight) {
			System.out.println("저체중입니다");
		}else {
			System.out.println("심각합니다. 살 좀 빼세요");
		}
	}
	
}
