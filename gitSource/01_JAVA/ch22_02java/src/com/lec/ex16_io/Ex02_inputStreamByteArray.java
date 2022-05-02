package com.lec.ex16_io;

import java.io.*; //���߿� ��Ʈ�� ����Ʈ O ���� 
//1.���Ͽ��� 
//2.�����͸� �д´� : read() 1byte�� �д´�. �ӵ��� ���� / read(byte[])- byte[]��ŭ ���� -read ���� �ȿ� byte �迭 ������ �־��ָ� byte�迭�� ����  
//3.���� �ݴ´� 
public class Ex02_inputStreamByteArray {

	public static void main(String[] args) {
		InputStream is = null;
		try {
			is = new FileInputStream("txtFile/inTest.txt"); // ������ �ϳ� �ϰų� �������� �ΰ� �ϰų� //1�� ���� ����
			byte[] bs = new byte[10]; //10����Ʈ�� �д� �迭 
			while(true) {// 2. ������ �д´�
				int readByteCount = is.read(bs); //bs����Ʈ �� ��ŭ �д´� 
				if(readByteCount == -1)break; //���� ������ ���� 
//				for(byte b : bs) {
//					System.out.print((char)b);
				for(int i=0 ; i<readByteCount ; i++) {
					System.out.print((char)bs[i]);
				}
			}
		} catch (FileNotFoundException e) {
			System.out.println(e.getMessage());
		} catch (IOException e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(is !=null) //if�� �߰�ȣ �� ����?  
					is.close();					
				
			} catch (IOException e) {
				System.out.println(e.getMessage());
			}
		}
	}
}
