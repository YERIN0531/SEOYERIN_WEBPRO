package com.lec.ex05beforeOOP;
//리턴값이 없거나 매개변수가 없는 매소드 
//아래 모양 만들것. (라인 그리는 메소드)
/* ■■■■■■■■■■■■■■■
 * Hello, World!
 * ------------- printLine()
 * Hello, Java!
 * ~~~~~~~~~~~~~ printLine('~')
 * Hello, Hong!
 * ■■■■■■■■■■■■■■■
 */
public class Ex05 {
	public static void main(String[] args) {
		printLine('■',50); // 
		System.out.println("\tHello, World!");
		printLine(40); // 
		System.out.println("\tHello, Java!");
		printLine('~'); 
		System.out.println("\tHello, Hong!");
		printLine('■',40);
	}
	
	//printLine 에러나지 않게 메소드 만들것
	//static을 사용하지 않으면 Ex05_line line = new Ex05_line 이라는 객체만들어야함 
	//return 타입 없으면 void
	//매개변수의 타입이나 갯수로 구분 
	private static void printLine(char c, int cnt) {
		for(int i=0 ; i<cnt ; i++) {
			System.out.print(c);
		}
		System.out.println();
	}
	private static void printLine(int cnt) { //40이라는 '정수'를 썼으니 int 씀
		for(int i=0 ; i<cnt ; i++) {
			System.out.print(cnt);
		}
		System.out.println();
	}
	private static void printLine(char c) { //문자 '~'를 넣을거기 때문에 char 씀 // 함수 오버로딩(같은 이름의 함수 printLine을 매개변수로 구분)
		for(int i=0 ; i<30 ; i++) {
			System.out.print(c);
		}
		System.out.println();//매개변수로 받은 c문자 30개 출력하고 개행
	}
	private static void printLine() {//return 타입이 없고 매개 변수 없는 메소드(=함수)
		for(int i=0 ; i<30 ; i++) {
			System.out.print('-');
		}
		System.out.println();//얇은 '-' 30개 출력하고 개행 
	}
}







































