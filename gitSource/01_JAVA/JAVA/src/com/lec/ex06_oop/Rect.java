package com.lec.ex06_oop;
// 나만의 클래스를 만드는 것이기 때문에 main 필요 없음
// 데이터(private)-width/height, 메소드(public)-area(), setter&getter
// Rect r1 = new Rect()
public class Rect {
	private int width;
	private int height;
	
	public int area() {
		return width*height;
	}
	public void setWidth(int width) {
		this.width = width;
	}
	public void setHeigh(int height) {
		this.height = height;
	}
	
	public int getWidth() {
		return width;
	}
	public int getHeight() {
		return height;
	}
}
