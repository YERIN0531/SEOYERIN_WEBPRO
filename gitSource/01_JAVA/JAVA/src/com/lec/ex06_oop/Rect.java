package com.lec.ex06_oop;
// ������ Ŭ������ ����� ���̱� ������ main �ʿ� ����
// ������(private)-width/height, �޼ҵ�(public)-area(), setter&getter
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
