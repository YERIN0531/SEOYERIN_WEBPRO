package com.lec.ex08_class2;

public class StudentTestMain {
	
	public static void main(String[] args) {
		Student j = new Student("정우성", 90, 90, 90);
		Student k = new Student("김하늘", 90, 90, 91);
		Student h = new Student("황정민", 80, 80, 80);
		Student d = new Student("강동원", 80, 80, 81);
		Student u = new Student("유아인", 70, 70, 70);
		
		
		System.out.println("■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■\n" + "                                                성적표  ");
		System.out.println("      -------------------------------------");
		System.out.println("                    이 름        국 어    영 어    수 학      총 점       평균 ");
		System.out.println("      -------------------------------------");
		System.out.println(j.acc());
		System.out.println(k.acc());
		System.out.println(h.acc());
		System.out.println(d.acc());
		System.out.println(u.acc());
		
		
		
		System.out.println("\n■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■\n");
		
		
		
	}
}
