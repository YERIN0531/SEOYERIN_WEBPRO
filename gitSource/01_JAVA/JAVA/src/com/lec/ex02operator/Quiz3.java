package com.lec.ex02operator;
import java.util.Scanner;
//Quiz3 두 수를 입력받아 , 두 수가 같은지 결과를 o나 x로 출력 + 첫번째 수가 더 큰지 o나 x로 출력 
public class Quiz3 {
	public static void main(String[] args)
    {
        Scanner sc = new Scanner(System.in);
        System.out.print("첫번째수는 ?");
        int s1 = sc.nextInt();
        System.out.print("2번째수는 ?");
        int s2 = sc.nextInt();
        String  result1 = (s1==s2) ? "o" : "x";
        System.out.println("같은 값?" + result1);
        
       String result2 = s1>s2 ? "o" : "x";
    	   System.out.println("첫번째가 더 크니?" + result2);
       
        
        
      
       
	}
}
