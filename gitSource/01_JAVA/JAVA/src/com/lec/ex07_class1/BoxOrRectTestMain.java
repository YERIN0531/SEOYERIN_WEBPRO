package com.lec.ex07_class1;

public class BoxOrRectTestMain {

	public static void main(String[] args) {
		BoxOrRect box = new BoxOrRect(5,6,10);
		BoxOrRect rect = new BoxOrRect(10,5);
		box.vPrint();
		rect.vPrint();
		System.out.println("박스 부피는 " +box.getVolume() );
		System.out.println("직사각형 넓이는 " +box.getVolume());

	}
}
