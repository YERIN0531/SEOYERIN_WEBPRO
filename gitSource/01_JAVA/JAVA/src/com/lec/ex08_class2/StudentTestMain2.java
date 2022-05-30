package com.lec.ex08_class2;

public class StudentTestMain2 {
	
	public static void main(String[] args) {
		Student s1 = new Student("���켺", 90, 90, 90);
		Student s2 = new Student("���ϴ�", 81, 90, 90);
		Student s3 = new Student("Ȳ����", 91, 90, 90);
		Student s4 = new Student("������", 80, 90, 90);
		Student s5 = new Student("������", 70, 90, 90);
		Student[] student = {s1, s2, s3, s4, s5};
		String[] title = {"�̸�","����","����","����","����","���"};
		int[] tot = new int[5];       // �Ʒ� ��µ� ����(��, ��, ��, ����, ����� ����)// tot[0] ���� ����, tot[1] ���� ����.....tot[4] ��� ����
		double[] avg = new double[5]; // ��� �濣 0.0 �ʱ�ȭ // avg[0] ���� ���, avg[1] �������....avg[4]����� ����
		printLine();
		System.out.println("\t\t\t����ǥ");
		printLine('-',50);
		for(String t : title) {
			System.out.print("\t"+t);
		}
		System.out.println();
		printLine('-',50);
		for(Student s : student) {
			s.print(); //����� ����
			tot[0] += s.getKor();
			tot[1] += s.getEng();
			tot[2] += s.getMat();
			tot[3] += s.getMat();
			tot[4] += s.getAvg(); //tot[4] = (int)(tot[4] + s.getAvg());
		}
		for(int idx=0 ; idx<avg.length ; idx++) { //����� ��� ��� avg[0] = tot[0]/5
												  // avg[1] = tot[1]/5
												  // avg[4] = tot[4]/5
			avg[idx] = (double)tot[idx]/student.length;
		}
		printLine();
		System.out.print("\t����\t");
		for (int t : tot) {
			System.out.print(t + "\t");
		}
		System.out.print("\n\t���\t");
		for(double a : avg) {
			System.out.print(a + "\t");
		}
		printLine('-',50);
		
//		printLine();
	}
	private static void printLine() {
		for(int i=0 ; i<65 ; i++) {
			System.out.print('��');
		}
		System.out.println();
	}
	private static void printLine(char ch, int cnt) {
		System.out.print("\t");
		for(int i=0 ; i<cnt ; i++) { // ���ٿ� cnt�� ch�� ���
			System.out.print(ch);
		}
		System.out.println(); // ����
	}
}