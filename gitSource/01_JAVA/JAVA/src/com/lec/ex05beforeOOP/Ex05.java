package com.lec.ex05beforeOOP;
//���ϰ��� ���ų� �Ű������� ���� �żҵ� 
//�Ʒ� ��� �����. (���� �׸��� �޼ҵ�)
/* ����������������
 * Hello, World!
 * ------------- printLine()
 * Hello, Java!
 * ~~~~~~~~~~~~~ printLine('~')
 * Hello, Hong!
 * ����������������
 */
public class Ex05 {
	public static void main(String[] args) {
		printLine('��',50); // 
		System.out.println("\tHello, World!");
		printLine(40); // 
		System.out.println("\tHello, Java!");
		printLine('~'); 
		System.out.println("\tHello, Hong!");
		printLine('��',40);
	}
	
	//printLine �������� �ʰ� �޼ҵ� �����
	//static�� ������� ������ Ex05_line line = new Ex05_line �̶�� ��ü�������� 
	//return Ÿ�� ������ void
	//�Ű������� Ÿ���̳� ������ ���� 
	private static void printLine(char c, int cnt) {
		for(int i=0 ; i<cnt ; i++) {
			System.out.print(c);
		}
		System.out.println();
	}
	private static void printLine(int cnt) { //40�̶�� '����'�� ������ int ��
		for(int i=0 ; i<cnt ; i++) {
			System.out.print(cnt);
		}
		System.out.println();
	}
	private static void printLine(char c) { //���� '~'�� �����ű� ������ char �� // �Լ� �����ε�(���� �̸��� �Լ� printLine�� �Ű������� ����)
		for(int i=0 ; i<30 ; i++) {
			System.out.print(c);
		}
		System.out.println();//�Ű������� ���� c���� 30�� ����ϰ� ����
	}
	private static void printLine() {//return Ÿ���� ���� �Ű� ���� ���� �޼ҵ�(=�Լ�)
		for(int i=0 ; i<30 ; i++) {
			System.out.print('-');
		}
		System.out.println();//���� '-' 30�� ����ϰ� ���� 
	}
}







































