package com.lec.ex03control;
import java.util.Scanner;
//���� �Է¹޾� ���밪�� ����ϴ� ���α׷��� �����ض� //�پ��� ��ʷ� �������� �����ϰ� ����غ��� 
public class Quiz1 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.println("���� �Է� �Ͻÿ� : ");
		int num1;
		num1 = sc.nextInt();
		if ( num1 > 0) {
			System.out.println("���� ���� ���밪��" + num1 + "�Դϴ�. ");
		} else if (num1 ==  0) {
			System.out.println("���� ���� ���밪��" + num1 + "�Դϴ�. ");
		} else {
			System.out.println("�������� ���밪�� " + (num1*(-1)) + "�Դϴ�. ");
		}
			
			
		}
		
	}
