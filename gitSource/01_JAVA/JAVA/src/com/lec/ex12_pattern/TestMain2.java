package com.lec.ex12_pattern;

public class TestMain2 {
	public static void main(String[] args) {
		//원래였으면 이렇게 할 것 . 싱글톤 패턴을 활용했으니 new를 못 씀 
//		SingletonClass obj1 = new SingletonClass();
//		SingletonClass obj2 = new SingletonClass();
//		obj1.setI(99);
//		System.out.println("obj1의 i : " + obj1.getI());
//		System.out.println("obj2의 i : " + obj2.getI());
		
		SingletonClass obj1 = SingletonClass.getInstance();
		SingletonClass obj2 = SingletonClass.getInstance();
		//obj1과 obj2를 가르키는거 동일함.(반대도 마찬가지) obj1가 바뀌면 obj2도 바뀜 
		//왜? instance에서 가르키는 객체의 주소를 가르키게 되어 있음. 
		// instance에서 만들어 놓은 new SingletonClass 라는 객체가 가르키는 주소값. 
		obj1.setI(99);
		System.out.println("obj1의 i : " + obj1.getI());
		System.out.println("obj2의 i : " + obj2.getI());
		obj2.setI(10);
		System.out.println("obj1의 i : " + obj1.getI());
		System.out.println("obj2의 i : " + obj2.getI());
	}
}
