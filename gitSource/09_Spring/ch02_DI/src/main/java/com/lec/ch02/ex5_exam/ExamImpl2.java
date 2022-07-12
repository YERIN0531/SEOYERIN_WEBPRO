package com.lec.ch02.ex5_exam;

import lombok.Data;

@Data
public class ExamImpl2 implements Exam {

	private String name;
	private int kor;
	private int eng;
	private int mat;


	public int total() {
		return kor+eng+mat;
	}

	public double avg() {
		return total()/3.0;
	}

}
