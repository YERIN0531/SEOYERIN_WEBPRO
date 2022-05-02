package com.lec.ex03control;

import java.util.Scanner;

//*************** 엄청 헷갈림 ****************
//Quiz5컴퓨터와 가위바위보 게임을 하는 프로그램을 구현하시오. 단, 사용자는 가위를 내고자 할 때는 0을 입력하고 바위를 선택하고자 할 때는 1을 입력하고, 보를 선택하고자 할 때는 2를 입력하여 게임을 진행합니다
//Quiz5 는 컴퓨터가 랜덤하게 제시하는 것. 
//Math.random 은 0~1사이의 숫자만 0을 나타냄 . //0<=Math.random() < 1
// 그 이상을 나타내기 위해선? 각 항에다 3을 곱해 // 0 <== Math.random()*3 < 3
// 우리가 원하는 것은 실수가 아니라 정수임 - 형변환 해주면 됨 // (int)(Math.random()*3) : 0,1,2 중 하나 
public class Quiz5 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
//		int you, computer; //컴퓨터가 0,1,2를 가지고 있어야함 // int you, computer = (int)(Math.random()*3); 으로 선언할땐 Sysout (computer); 해도됨 
//		System.out.println((int)(Math.random()*3)); // 6,7번 줄 확인하기 

		int you, computer = (int) (Math.random() * 3);
		System.out.print("가위(0), 바위(0), 보(2) 중 하나 선택 : ");
		you = sc.nextInt();// 정수를 입력 받음

		if (you == 0) {
			System.out.print("당신은 가위\t");
		} else if (you == 1) {
			System.out.print("당신은 바위\t");
		} else if (you == 2) {
			System.out.print("당신은 보자기\t");
		} else {
			System.out.print("당신은 잘못 냈어요. 바이 ");
			you = 3; // 끝내기 위한 조건
		} // if
		if (you != 3) { // 컴퓨터가 낸 것과 승패 출력
			String msg = (computer == 0) ? "컴퓨터는 가위" : (computer == 1) ? "컴퓨터가 바위" : "컴퓨터가 보자기";
			System.out.println(msg);
			if (you == 0) {
				if (computer == 0) {
					System.out.println("비겼다");
				} else if (computer == 1) {
					System.out.println("컴퓨터가 이겼다");
				} else if (computer == 2) {
					System.out.println("당신이 이겼다");
				} // if
			} else if (you == 1) {
				if (computer == 0) {
					System.out.println("당신이 이겼다");
				} else if (computer == 1) {
					System.out.println("비겼다");
				} else {
					System.out.println("컴퓨터가 이겼다");
				} // if
			} else if (you == 2) {
				if (computer == 0) {
					System.out.println("컴퓨터가 이겼다");
				} else if (computer == 1) {
					System.out.println("당신이 이겼다");
				} else {
					System.out.println("비겼다");
				} // if 승패출력
			} // if
		} // if
	}// main
}// class
