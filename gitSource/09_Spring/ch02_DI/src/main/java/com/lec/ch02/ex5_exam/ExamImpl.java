package com.lec.ch02.ex5_exam;
import lombok.Data;
@Data
public class ExamImpl implements Exam {
	private String name;
	private int kor;
	private int eng;
	private int mat;
	private int computer;
	public int total() {
		return kor+eng+mat+computer;
	}
	public double avg() {
		return total()/4.0;
	}

}
