package com.lec.ch02.ex4_vehicle;
import lombok.Data;
@Data
public class VehicleImpl implements Vehicle {
	private String vehicle;
	private int speed;
	public void ride(String name) {
		System.out.println(name +"은(는)" + vehicle+"을(를) " + speed + "km/h로 갑니다");
	}
}
