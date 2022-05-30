package com.lec.ex07_class1;
/*직육면체의 가로, 세로, 높이, 부피나 직사각형의 가로, 세로, 넓이를 속성으로 갖는 클래스를 구현하라. 부피나 넓이를 구하는 리턴하는 메소드 getVolume(), 출력하는 메소드 vPrint도 구현한다.
데이터 : 가로, 세로, 높이, volume(부피 or 넓이)
메소드 : int getVolume(), void vPrint()
*/

public class BoxOrRect {
	
	private int width;
	private int height;
	private int depth; //box의 경우 깊이, rect의 경우는 0
	private int volume; //box의 경우 부피, rect의 경우 넓이 
	public BoxOrRect() {}//디폴트 생성자
	public BoxOrRect(int width, int height) {//rect일 경우
		this.width = width;
		this.height = height;
		volume = width*height;
	}
	public BoxOrRect(int width, int height, int depth) {//box일 경우
		this.width = width;
		this.height = height;
		this.depth = depth;
		volume = width*height*depth;
	}
	public int getVolume() {
		return volume;
	}
	public void vPrint() {
		if(depth!=0) {//box
			System.out.println("부피는"+volume);			
		}else {//rect
			System.out.println("넓이는"+volume);
		}
	}
}
