package com.lec.ex05beforeOOP;
//1~10���� ������ ���� ����ϰ� / �� ���� ¦������ Ȧ������ ���
public class Ex02 {
	public static void main(String[] args) {
		int tot = sum(1, 10);//1~10���� �˾Ƽ� ������ ����� tot��� ������ ��ƶ�.
		int tot2 = sum(10);
		System.out.println("1~10���� �������� " + tot); //sum ���� �� ������ �� return �ϰ�, sysout �ض� 
		System.out.println(evenOdd(tot));//¦Ȧ�� �Ǻ� ���� �ҷ� sysout
		System.out.println(tot2);
		tot = sum(10,100);
		System.out.println("10~100���� �������� " + tot);
		System.out.println(evenOdd(tot)); //¦Ȧ�� �Ǻ� ���� �ҷ� sysout �׷��� evenOdd�ӿ� �ִ� tot�� �ҷ� �;� �ϱ� ������ evenOdd(tot)
		
	}//main
	public static String evenOdd(int value) {
		return value%2==0 ? "¦���Դϴ�" : "Ȧ���Դϴ�";
//		String result = null;
//		if(value%2 ==0) {
//			result = "¦���Դϴ�";
//		}else {
//			result = "Ȧ���Դϴ�";
//		}
//		return result;
		
	}
	private static int sum(int to) {//�Լ��� �����ε� //tot2�� ���� ��
		int result = 0;
		for(int i=1 ; i<=to ; i++) {
			result += 1;
		}
		return result;
	}
	
	private static int sum(int from, int to) { //private �� ȭ�Ͽ����� ȣ�� �����ϴٴ� ��(public�� ��� �����ϱ���). int �� ������ ���� ��� �ǹ� 
						//from~to���� ������ ��� return
		int result = 0;
		for(int i=from ; i<=to ; i++) {
			result = result + i; //result += i;
			//result�� main�Լ� �ȿ� �ٽ� ��������� �׷���.. return�� ���� 
		}//for
		return result;
	}//sum
}//class

















