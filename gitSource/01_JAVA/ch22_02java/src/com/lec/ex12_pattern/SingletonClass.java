package com.lec.ex12_pattern;

public class SingletonClass {
	private int i;

	//��ü ���������� �� ��ü �ּҸ�  return �ϰ� , ��ü ���� �������� ��ü�� �����ϰ� �� �ּҸ� return �ؾ���
	//��ü ���� �ߴ��� ���ߴ��� 
	private static SingletonClass INSTANCE= new SingletonClass(); //SinglegonClass�� �ּҸ� ������ �ִ� static 
	public static  SingletonClass getInstance() {
//		if(INSTANCE==null) { //null�̸� ��ü ���� ���ߴٴ� ���̰�, ������������ ��ü�� �����ѵڿ� INSTANCE�� �Ѱ������
//			INSTANCE = new SingletonClass(); //SingletonClass ��ü�� ����� INSTANCE�� �ּҸ� �־��� ��  
//	}
	return INSTANCE;
}	
	private SingletonClass() {}
	//������ �Լ��� public���� �ָ� ��� �����ϴ� private�� �ָ� �ܺο��� ��ü ���� ����. getInstane���� �ϳ��� ����� �ֵ��� ..... 
	
	
	public int getI() {
		return i;
	}

	public void setI(int i) {
		this.i = i;
	}
	
}
