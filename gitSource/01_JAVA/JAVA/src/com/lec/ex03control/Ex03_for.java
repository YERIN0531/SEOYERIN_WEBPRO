package com.lec.ex03control;
//for�� �ȿ� for �ֱ� = ��ø���� //�ܼ�â�� ������ ���� ��µǵ��� for���� �̿��Ͽ� �����Ͽ� ����(���� ��Ʈ����)
/*
 * *
 * * *
 * * * *
 * * * * */


public class Ex03_for {

	public static void main(String[] args) {
		for (int j=1 ; j<=5 ; j++) { // 5ȸ �ݺ�(j�� 1���� 5���� �ݺ�)
			for(int i=1 ; i<=j ; i++) { // jȸ �ݺ�( i�� 1���� j���� �ݺ�)
				System.out.print('*');
			}///for - i
			System.out.println();//����
		}//for-j
	}//main
}
