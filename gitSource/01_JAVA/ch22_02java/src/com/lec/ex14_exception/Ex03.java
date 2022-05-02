package com.lec.ex14_exception;
import java.util.InputMismatchException;
//예외 : ArithmeticException , InputMismatchException(숫자넣는부분에 문자 넣었을때)
//12부터는 "사칙연산을 할 첫번째 수" 부분만 예외처리 한 것 
//두번째는 예외처리 한번에 함 (j에 대한 예외처리 26부터 
import java.util.Scanner;

public class Ex03 {

	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		int i, j=1; // try밖에서도 i를 실행할 수 있도록 밖으로 빼서 선언해주기 
		do {		
				try {
					System.out.print("사칙연산을 할 첫번째 수 : ");
					i = scanner.nextInt();
					////////////////////// 여기로 왔다면 i를 제대로 입력했다는 소리 (i에 정수가 들어갔다는 소리)
					break; /////////////// 제대로 입력했으니 break로 빠져나오렴 (do while로 묶어줬으니 break통해 빠져나와라)
				}catch(InputMismatchException e) {
					System.out.println("예외 메세지 : " + e.getMessage()); //안뿌려도 되긴한데 개발자가 왜 예외가 됐는지 알게 하기 위해 써주는게 좋음 
					System.out.println("정수를 반드시 입력하세요 ");
					scanner.nextLine(); //버퍼 지우는 것  next로 지워도 되긴 함 
				}
		}while(true);
		System.out.print("사칙연산을 할 두번째 수 : ");
		try {
			j = scanner.nextInt(); 
			System.out.println("i = " + i + "  j = " + j);
			System.out.println("i X j = " + (i*j));
			System.out.println("i / j = " + (i/j)); 
		}catch(InputMismatchException e) {//----------------------j = scanner.nextInt();  부분에 대한 예외 처리  
			System.out.println("예외 메세지 : " + e.getMessage());
			System.out.println("두번째 수를 잘못 입력하시면 1로 초기화 됩니다");
		}catch(ArithmeticException e) {//------------------------ System.out.println("i / j = " + (i/j)); 부분에 대한 예외처리 
			System.out.println(e.getMessage());
		}catch(Exception e) {
			System.out.println("모든 예외는 다 이쪽으로 " + e.getMessage());
		}
		System.out.println("i + j = " + (i+j));
		System.out.println("i - j = " + (i-j));
		System.out.println("DONE");
		scanner.close();
	}
}
