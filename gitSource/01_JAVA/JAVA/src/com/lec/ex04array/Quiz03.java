package com.lec.ex04array;
//76,45,34,89,100,50,90,92  8���� ���� 1���� �迭�� �ʱ�ȭ �ϰ� 
//���� �հ��  ��� �׸��� �ִ밪�� �ּҰ��� ���ϴ� ���α׷��� �ۼ� �Ͻÿ�. 
public class Quiz03 {
	public static void main(String[] args) {
		int[] arr = {76,45,34,89,100,50,90,92};
		int sum = 0; //�����ҰŴ� 0�� �������
		for(int i=0 ; i<arr.length ; i++) {
			sum = sum+arr[i];
		}	
		System.out.print("��     ��  = " + sum + "\t");
		System.out.println("��   �� = " +sum/8);
	
	//�ִ밪�� �ּҰ��� ���ϱ�
		
		int minarr = 999, minIdx=0; //max���� min���� �����ؾ� �ϱ� ����
		int maxarr = 0, maxIdx=0;
		for(int i1=0 ; i1<arr.length ; i1++) {
			if(arr[i1]<minarr) {
				minarr = arr[i1];
				minIdx = i1;
			}//if �ּҰ�
			if(arr[i1]>maxarr) {
				maxarr = arr[i1];
				maxIdx = i1;
			}//if �ִ밪
		}//for
		System.out.print("�ִ밪�� = " + arr[maxIdx] + "\t");
		System.out.println("�ּҰ��� = " + arr[minIdx]);
	}
}