package com.lec.ex03control;

import java.util.Scanner;

//*************** ��û �򰥸� ****************
//Quiz5��ǻ�Ϳ� ���������� ������ �ϴ� ���α׷��� �����Ͻÿ�. ��, ����ڴ� ������ ������ �� ���� 0�� �Է��ϰ� ������ �����ϰ��� �� ���� 1�� �Է��ϰ�, ���� �����ϰ��� �� ���� 2�� �Է��Ͽ� ������ �����մϴ�
//Quiz5 �� ��ǻ�Ͱ� �����ϰ� �����ϴ� ��. 
//Math.random �� 0~1������ ���ڸ� 0�� ��Ÿ�� . //0<=Math.random() < 1
// �� �̻��� ��Ÿ���� ���ؼ�? �� �׿��� 3�� ���� // 0 <== Math.random()*3 < 3
// �츮�� ���ϴ� ���� �Ǽ��� �ƴ϶� ������ - ����ȯ ���ָ� �� // (int)(Math.random()*3) : 0,1,2 �� �ϳ� 
public class Quiz5 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
//		int you, computer; //��ǻ�Ͱ� 0,1,2�� ������ �־���� // int you, computer = (int)(Math.random()*3); ���� �����Ҷ� Sysout (computer); �ص��� 
//		System.out.println((int)(Math.random()*3)); // 6,7�� �� Ȯ���ϱ� 

		int you, computer = (int) (Math.random() * 3);
		System.out.print("����(0), ����(0), ��(2) �� �ϳ� ���� : ");
		you = sc.nextInt();// ������ �Է� ����

		if (you == 0) {
			System.out.print("����� ����\t");
		} else if (you == 1) {
			System.out.print("����� ����\t");
		} else if (you == 2) {
			System.out.print("����� ���ڱ�\t");
		} else {
			System.out.print("����� �߸� �¾��. ���� ");
			you = 3; // ������ ���� ����
		} // if
		if (you != 3) { // ��ǻ�Ͱ� �� �Ͱ� ���� ���
			String msg = (computer == 0) ? "��ǻ�ʹ� ����" : (computer == 1) ? "��ǻ�Ͱ� ����" : "��ǻ�Ͱ� ���ڱ�";
			System.out.println(msg);
			if (you == 0) {
				if (computer == 0) {
					System.out.println("����");
				} else if (computer == 1) {
					System.out.println("��ǻ�Ͱ� �̰��");
				} else if (computer == 2) {
					System.out.println("����� �̰��");
				} // if
			} else if (you == 1) {
				if (computer == 0) {
					System.out.println("����� �̰��");
				} else if (computer == 1) {
					System.out.println("����");
				} else {
					System.out.println("��ǻ�Ͱ� �̰��");
				} // if
			} else if (you == 2) {
				if (computer == 0) {
					System.out.println("��ǻ�Ͱ� �̰��");
				} else if (computer == 1) {
					System.out.println("����� �̰��");
				} else {
					System.out.println("����");
				} // if �������
			} // if
		} // if
	}// main
}// class
