package com.lec.ex04array;
//�迭�� ��� ���� ���ϴ� ���α׷��� �ۼ�
public class Quiz01 {
	public static void main(String[] args) {
		int[] arr = {10,20,30,40,50};
		int tot = 0;
//		for(int idx=0 ; idx<arr.length ; idx++) {
//			tot = tot + arr[idx]; 
//		} //for
//		System.out.println("��� ���� ����" + tot);
//		
		
//---------------------------------------------------
//				�����Թ���
		
		for(int temp : arr) {
			tot += temp;
		}
		System.out.println("��� ���� ����" + tot);
	}
}
