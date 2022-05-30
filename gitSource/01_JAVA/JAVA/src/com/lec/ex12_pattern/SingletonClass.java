package com.lec.ex12_pattern;

public class SingletonClass {
	private int i;

	//객체 생성했으면 그 객체 주소를  return 하고 , 객체 생성 안했으면 객체를 생성하고 그 주소를 return 해야함
	//객체 생성 했는지 안했는지 
	private static SingletonClass INSTANCE= new SingletonClass(); //SinglegonClass의 주소를 가지고 있는 static 
	public static  SingletonClass getInstance() {
//		if(INSTANCE==null) { //null이면 객체 생성 안했다는 것이고, 생성안했으면 객체를 생성한뒤에 INSTANCE에 넘겨줘야함
//			INSTANCE = new SingletonClass(); //SingletonClass 객체를 만들어 INSTANCE에 주소를 넣어준 것  
//	}
	return INSTANCE;
}	
	private SingletonClass() {}
	//생성자 함수를 public으로 주면 계쏙 생성하니 private로 주면 외부에서 객체 생성 못함. getInstane통해 하나만 만들수 있도록 ..... 
	
	
	public int getI() {
		return i;
	}

	public void setI(int i) {
		this.i = i;
	}
	
}
