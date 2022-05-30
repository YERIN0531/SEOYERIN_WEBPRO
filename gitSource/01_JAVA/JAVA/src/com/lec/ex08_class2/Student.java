package com.lec.ex08_class2;

public class Student {
	private String name;
	private int kor;
	private int eng;
	private int mat;
	private int sum;
	private double avg;

	public Student() {}
	
	public Student(String name, int kor, int eng, int mat) {
		this.name = name;
		this.kor= kor;
		this.eng= eng;
		this.mat= mat;
		//출력하는 거 만들어 놓기 
		sum = kor+eng+mat;
		avg = (kor + eng + mat)/3.0;
	}
	
	public String acc() {
		return ("\t "+name +"        "+ kor+"   " + eng +"   "+ mat +"   "+ sum+ "   " + avg);
	}

	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getKor() {
		return kor;
	}

	public void setKor(int kor) {
		this.kor = kor;
	}

	public int getEng() {
		return eng;
	}

	public void setEng(int eng) {
		this.eng = eng;
	}

	public int getMat() {
		return mat;
	}

	public void setMat(int mat) {
		this.mat = mat;
	}

	public int getSum() {
		return sum;
	}

	public void setSum(int sum) {
		this.sum = sum;
	}

	public double getAvg() {
		return avg;
	}

	public void setAvg(double avg) {
		this.avg = avg;
	}

	public void print() {
		System.out.println("\t"+name+"\t"+kor);
	}

		
		
		
		
		
	
}