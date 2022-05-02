package com.lec.ex07_class1;
/*������ü�� ����, ����, ����, ���ǳ� ���簢���� ����, ����, ���̸� �Ӽ����� ���� Ŭ������ �����϶�. ���ǳ� ���̸� ���ϴ� �����ϴ� �޼ҵ� getVolume(), ����ϴ� �޼ҵ� vPrint�� �����Ѵ�.
������ : ����, ����, ����, volume(���� or ����)
�޼ҵ� : int getVolume(), void vPrint()
*/

public class BoxOrRect {
	
	private int width;
	private int height;
	private int depth; //box�� ��� ����, rect�� ���� 0
	private int volume; //box�� ��� ����, rect�� ��� ���� 
	public BoxOrRect() {}//����Ʈ ������
	public BoxOrRect(int width, int height) {//rect�� ���
		this.width = width;
		this.height = height;
		volume = width*height;
	}
	public BoxOrRect(int width, int height, int depth) {//box�� ���
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
			System.out.println("���Ǵ�"+volume);			
		}else {//rect
			System.out.println("���̴�"+volume);
		}
	}
}
