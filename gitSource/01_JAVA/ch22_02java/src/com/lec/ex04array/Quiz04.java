package com.lec.ex04array;
//거스름돈 2680을 500, 100, 50, 10짜리 동전으로 줄 때, 몇개씩 주어야 하나?
public class Quiz04 {
	public static void main(String[] args) {
		int a = 0;
		int[] coinUnit = {500, 100, 50, 10};
		int money = 2680;
		
		for(int i=0 ; i<coinUnit.length ; i++) {
		System.out.println(coinUnit[i] +"짜리"+ money/coinUnit[i] + "개");
		money = money%coinUnit[i]; // money = money%coinUnit[i];
		}
	
	}
}

//---------------------------------------------------
//					선생님버전


//		for(int coin : coinUnit){
//		System.out.println(coin+"짜리" + (money/coin) + "개");
//		money %= coin; //money = money%coin;