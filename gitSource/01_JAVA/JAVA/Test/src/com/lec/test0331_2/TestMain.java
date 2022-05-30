package com.lec.test0331_2;

public class TestMain {

	public static void main(String[] args) {
		Student st1 = new Student("A01","나학생","JAVA반");
		Student st2 = new Student("A02","홍길동","C++반");
		Staff sf1 = new Staff("S01","나직원","교무팀");
		Staff sf2 = new Staff("S02","나도요","취업지원팀");
		Gangsa gs = new Gangsa("G01","나선생","프로그래밍");
		
		Person[] p = {st1, st2, sf1, sf2, gs};
		for(Person pp : p) {
			System.out.println(pp.print());
		}
		
	}
}
