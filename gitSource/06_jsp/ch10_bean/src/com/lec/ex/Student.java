package com.lec.ex;

public class Student {
//Student String학번, 이름, int 학년, char 반(radio), int 점수(number))
	private String sno;
	private String name;
	private int    grade;
	private int    cla;
	private int    score;
	
	public Student() {}
	
	public Student(String sno, String name, int grade, int cla, int score) {
		super();
		this.sno = sno;
		this.name = name;
		this.grade = grade;
		this.cla = cla;
		this.score = score;
	}

	public String getSno() {
		return sno;
	}

	public void setSno(String sno) {
		this.sno = sno;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public int getCla() {
		return cla;
	}

	public void setCla(int cla) {
		this.cla = cla;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}
	
	
	
}
