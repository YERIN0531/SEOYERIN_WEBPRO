package com.lec.ex13_api;
//��ȣ(031-234-5678)�Է� �ϸ� (sc.next())
//	"�Է��� ��ȭ��ȣ : 031-234-5678
//	 ¦����° ���ڿ�  : 0 1 2 4 5 7 //���ڿ� ��ü �� ������ 2 
//	���ڸ� ���ٷ�    : 8765-432-130 // ���ڿ� ��ü�� ������ 
//	��ȭ��ȣ �Ǿ��ڸ���: 031
//	��ȭ��ȣ ���ڸ���: 5678"�� sysout
// x(X)�� �Է��ϸ� ���α׷� ��
// ��ȭ��ȣ �޾�, �Է¹��� ��ȭ��ȣ, ¦����° ����, �Ųٷ�, 
import java.util.Scanner;

public class Quiz02_phonenumber {
	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		do{
		System.out.print("��ȭ��ȣ�� �Է��Ͻÿ�(010-9898-1234����) : ");
		String tel = sc.next(); //��Ʈ�� �Է�
		if(tel.equalsIgnoreCase("x"))break; // while ������ �������� ���� ���� 
		System.out.println("�Է��� ��ȭ��ȣ : " + tel);
		//Ư���� ��°�� �Լ��� �������� �Լ� charAt(); + �������� �Ѹ��� �𸣴� ������ �ѷ�����. ������ ���̸� �������� �Լ� length();
		System.out.print("¦����° ���ڿ� : ");
		for(int i = 0; i<tel.length() ; i++) {
			if(i%2==0) {
				System.out.print(tel.charAt(i)); //¦����° ���� ���
			}else {
				System.out.print(' '); // Ȧ����° ���ڿ� ��� ' ' ��� 
			}
		}
		System.out.println(); //����
		System.out.print("���ڸ� �Ųٷ� : ");
		for(int i =tel.length()-1 ; i>=0 ; i--) {
			System.out.print(tel.charAt(i));
		}
		System.out.println();
		int first = tel.indexOf('-'); //ù��° ������ ���� 
		int last = tel.lastIndexOf('-');//������ ������ ����
		String pre = tel.substring(0, first);
		String post = tel.substring(last+1);// +1�� �ٷ� �������Ͷ�� ��
		String mid = tel.substring(first+1, last);
		System.out.println("��ȭ��ȣ ���ڸ� : " + pre);
		System.out.println("��ȭ��ȣ ���ڸ� : " + post);
		System.out.println("��ȭ��ȣ �ߤ����ڸ� : " + mid);
		}while(true); // ���� �̹� do-while �ȿ� tel�� �־��� ������ while�ۿ��ٰ� tel ����. 
		
		
//		if(tel.indexOf("-")==3) {
//			System.out.println("��ȭ��ȣ ���ڸ� : " + tel.substring(4,8));
//		}else if(tel.indexOf("-")==2){
//			System.out.println("��ȭ��ȣ ���ڸ� : " + tel.substring(3,7));
//		}
//		
//		if(tel.indexOf("-")==8) {
//			System.out.println("��ȭ��ȣ ���ڸ� : " + tel.substring(9));
//		}else if(tel.indexOf("-")==7) {
//			System.out.println("��ȭ��ȣ ���ڸ� : " + tel.substring(8));
//		}
		
		
//		do {
//			System.out.println("��ȣ�� �Է��Ͻÿ� : ");
//			num = scanner.next();
//			System.out.println("");
//		}while
	
	
	
	
		
		
		
		
		
		
		
		
		
	
	
	
	}
	
	}


