package com.lec.ex02operator;
import java.util.Scanner;
//Quiz3 �� ���� �Է¹޾� , �� ���� ������ ����� o�� x�� ��� + ù��° ���� �� ū�� o�� x�� ��� 
public class Quiz3 {
	public static void main(String[] args)
    {
        Scanner sc = new Scanner(System.in);
        System.out.print("ù��°���� ?");
        int s1 = sc.nextInt();
        System.out.print("2��°���� ?");
        int s2 = sc.nextInt();
        String  result1 = (s1==s2) ? "o" : "x";
        System.out.println("���� ��?" + result1);
        
       String result2 = s1>s2 ? "o" : "x";
    	   System.out.println("ù��°�� �� ũ��?" + result2);
       
        
        
      
       
	}
}
