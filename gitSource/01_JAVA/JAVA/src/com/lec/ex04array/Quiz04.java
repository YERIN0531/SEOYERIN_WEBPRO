package com.lec.ex04array;
//�Ž����� 2680�� 500, 100, 50, 10¥�� �������� �� ��, ��� �־�� �ϳ�?
public class Quiz04 {
	public static void main(String[] args) {
		int a = 0;
		int[] coinUnit = {500, 100, 50, 10};
		int money = 2680;
		
		for(int i=0 ; i<coinUnit.length ; i++) {
		System.out.println(coinUnit[i] +"¥��"+ money/coinUnit[i] + "��");
		money = money%coinUnit[i]; // money = money%coinUnit[i];
		}
	
	}
}

//---------------------------------------------------
//					�����Թ���


//		for(int coin : coinUnit){
//		System.out.println(coin+"¥��" + (money/coin) + "��");
//		money %= coin; //money = money%coin;