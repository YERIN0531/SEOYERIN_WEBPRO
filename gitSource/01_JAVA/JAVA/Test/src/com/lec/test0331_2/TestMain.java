package com.lec.test0331_2;

public class TestMain {

	public static void main(String[] args) {
		Student st1 = new Student("A01","���л�","JAVA��");
		Student st2 = new Student("A02","ȫ�浿","C++��");
		Staff sf1 = new Staff("S01","������","������");
		Staff sf2 = new Staff("S02","������","���������");
		Gangsa gs = new Gangsa("G01","������","���α׷���");
		
		Person[] p = {st1, st2, sf1, sf2, gs};
		for(Person pp : p) {
			System.out.println(pp.print());
		}
		
	}
}
