package com.lec.ex08_class2;

public class StudentTestMain2 {
	
	public static void main(String[] args) {
		Student s1 = new Student("정우성", 90, 90, 90);
		Student s2 = new Student("김하늘", 81, 90, 90);
		Student s3 = new Student("황정민", 91, 90, 90);
		Student s4 = new Student("강동원", 80, 90, 90);
		Student s5 = new Student("유아인", 70, 90, 90);
		Student[] student = {s1, s2, s3, s4, s5};
		String[] title = {"이름","국어","영어","수학","총점","평균"};
		int[] tot = new int[5];       // 아래 출력될 총점(국, 영, 수, 총점, 평균의 총점)// tot[0] 국어 누적, tot[1] 영어 누적.....tot[4] 평균 누적
		double[] avg = new double[5]; // 모든 방엔 0.0 초기화 // avg[0] 국어 평균, avg[1] 영어평균....avg[4]평균의 누적
		printLine();
		System.out.println("\t\t\t성적표");
		printLine('-',50);
		for(String t : title) {
			System.out.print("\t"+t);
		}
		System.out.println();
		printLine('-',50);
		for(Student s : student) {
			s.print(); //출력후 누적
			tot[0] += s.getKor();
			tot[1] += s.getEng();
			tot[2] += s.getMat();
			tot[3] += s.getMat();
			tot[4] += s.getAvg(); //tot[4] = (int)(tot[4] + s.getAvg());
		}
		for(int idx=0 ; idx<avg.length ; idx++) { //출력할 평균 계산 avg[0] = tot[0]/5
												  // avg[1] = tot[1]/5
												  // avg[4] = tot[4]/5
			avg[idx] = (double)tot[idx]/student.length;
		}
		printLine();
		System.out.print("\t총점\t");
		for (int t : tot) {
			System.out.print(t + "\t");
		}
		System.out.print("\n\t평균\t");
		for(double a : avg) {
			System.out.print(a + "\t");
		}
		printLine('-',50);
		
//		printLine();
	}
	private static void printLine() {
		for(int i=0 ; i<65 ; i++) {
			System.out.print('■');
		}
		System.out.println();
	}
	private static void printLine(char ch, int cnt) {
		System.out.print("\t");
		for(int i=0 ; i<cnt ; i++) { // 한줄에 cnt번 ch를 출력
			System.out.print(ch);
		}
		System.out.println(); // 개행
	}
}