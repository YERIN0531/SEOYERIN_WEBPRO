package com.lec.ex06_oop;
public class RectTestMain {
	public static void main(String[] args) {
		Rect r1 = new Rect();
		Rect r2 = new Rect();
		r1.setWidth(10);
		r1.setHeigh(5);
		System.out.println("r1ÀÇ ³ÐÀÌ´Â" + r1.area());
		System.out.println("r2ÀÇ ³ÐÀÌ´Â" + r2.area());
		
		
	}
}
