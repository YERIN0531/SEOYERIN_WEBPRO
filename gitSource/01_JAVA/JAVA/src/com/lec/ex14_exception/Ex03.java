package com.lec.ex14_exception;
import java.util.InputMismatchException;
//���� : ArithmeticException , InputMismatchException(���ڳִºκп� ���� �־�����)
//12���ʹ� "��Ģ������ �� ù��° ��" �κи� ����ó�� �� �� 
//�ι�°�� ����ó�� �ѹ��� �� (j�� ���� ����ó�� 26���� 
import java.util.Scanner;

public class Ex03 {

	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		int i, j=1; // try�ۿ����� i�� ������ �� �ֵ��� ������ ���� �������ֱ� 
		do {		
				try {
					System.out.print("��Ģ������ �� ù��° �� : ");
					i = scanner.nextInt();
					////////////////////// ����� �Դٸ� i�� ����� �Է��ߴٴ� �Ҹ� (i�� ������ ���ٴ� �Ҹ�)
					break; /////////////// ����� �Է������� break�� ���������� (do while�� ���������� break���� �������Ͷ�)
				}catch(InputMismatchException e) {
					System.out.println("���� �޼��� : " + e.getMessage()); //�Ȼѷ��� �Ǳ��ѵ� �����ڰ� �� ���ܰ� �ƴ��� �˰� �ϱ� ���� ���ִ°� ���� 
					System.out.println("������ �ݵ�� �Է��ϼ��� ");
					scanner.nextLine(); //���� ����� ��  next�� ������ �Ǳ� �� 
				}
		}while(true);
		System.out.print("��Ģ������ �� �ι�° �� : ");
		try {
			j = scanner.nextInt(); 
			System.out.println("i = " + i + "  j = " + j);
			System.out.println("i X j = " + (i*j));
			System.out.println("i / j = " + (i/j)); 
		}catch(InputMismatchException e) {//----------------------j = scanner.nextInt();  �κп� ���� ���� ó��  
			System.out.println("���� �޼��� : " + e.getMessage());
			System.out.println("�ι�° ���� �߸� �Է��Ͻø� 1�� �ʱ�ȭ �˴ϴ�");
		}catch(ArithmeticException e) {//------------------------ System.out.println("i / j = " + (i/j)); �κп� ���� ����ó�� 
			System.out.println(e.getMessage());
		}catch(Exception e) {
			System.out.println("��� ���ܴ� �� �������� " + e.getMessage());
		}
		System.out.println("i + j = " + (i+j));
		System.out.println("i - j = " + (i-j));
		System.out.println("DONE");
		scanner.close();
	}
}
