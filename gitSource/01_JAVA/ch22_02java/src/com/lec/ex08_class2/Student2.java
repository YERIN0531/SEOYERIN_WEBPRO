package com.lec.ex08_class2;

public class Student2 {
	private String name;
	private int kor;
	private int eng;
	private int mat;
	private int tot;
	private double avg;
	public Student2(String name, int kor, int eng, int mat) {
		this.name = name;
		this.kor = kor;
		this.eng = eng;
		this.mat = mat;
		tot = kor + eng + mat;
		avg = tot / 3.0;
	}
	public void print() {
		System.out.printf("\t %s \t %d \t %d \t %d \t %d \t %.1f\n", 
				name, kor, eng, mat, tot, avg);
	}
	// System.out.println(s.infoString());
	public String infoString() {
		return String.format("\t %s \t %d \t %d \t %d \t %d \t %.1f\n", 			name, kor, eng, mat, tot, avg);
	}
	public String getName() {return name;}
	public int getKor() {return kor;}
	public int getEng() {return eng;}
	public int getMat() {return mat;}
	public int getTot() {return tot;}
	public double getAvg() {return avg;}
}


