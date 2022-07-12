package com.lec.ch02.ex5_exam;

import lombok.AllArgsConstructor;

@AllArgsConstructor
public class ExamConsoleImpl implements ExamConsole {
	private Exam exam;
	public void print() {
		System.out.println("이름 : " + exam.getName());
		System.out.println("총점 : " + exam.total());
		System.out.printf("평균 : %5.1f", exam.avg());
	}

}
