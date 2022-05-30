package com.lec.ex16_io;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;

//� Ư�� ���α׷��� �ִ� Ư�� ������ 1byte �� ���� ���� 
// 1. ������ ���� (=��Ʈ����ü����) 2.�����͸� �д´�(read�޼ҵ�� �д´�)  3.������ �ݴ´�(=��Ʈ����ü���ش�)
public class Ex01_inputStream {

	public static void main(String[] args) {
		InputStream is = null; // null���� �ִ� ���� : null�� ���� ������ finally try ���� is.close()�� ����, is�� �ƹ����� �ȵ� ���� ��� ������ �߻��� �� ���� ..null�� �־������ 
		//�����ٰ� �������� �� ������ fianlly������ ���ֱ� ����.. 
		try {
			is = new FileInputStream("txtFile/inTest.txt"); //----------------------------- 1.������ ���� 
			while(true) {//������ �������� ������ �𸣴�, while�� �Ἥ ������ ������ �о��ֱ� 
				int i = is.read(); //���⼭ ������ ���� ó�� ����ߵ�. try�� �ȿ� try�� �߰� �ϸ� �ȵǰ�, �ؿ� ĳġ���� �߰������� //--2. �����͸� �д´�  
				//(1byte�� �����Ŵ� int�� ����ߵ�) 
				if(i==-1)break; //������ ���̸� �ݺ���break //������ ���̶�� �ڵ尪�� ������ i�� -1�� ������.. ���� -1�� ������ ���� ������ return �ض� ��� �� 
//				System.out.print(i); // i�� �ƽ�Ű�ڵ尡 ����.. ������ ����ȯ ����ߵ� 
				System.out.print((char)i + "(" + i + ")"); //����ȯ ���ϸ� �ƽ�Ű�ڵ� ������ ��
			}
			System.out.println("\n��");
			//���⼭ ������ �ݾƹ����� 2�� ������ ������ �������� ����. 2�� �����ϴٸ��� catch���� ������������ �ȵ�  
		} catch (FileNotFoundException e) {
			System.out.println("������ �� ã�� ��� ���� : " + e.getMessage());
		} catch (IOException e) {
			System.out.println("������ ���� �� ���� ��� ���� : " + e.getMessage());
		} finally {
			//3. ������ �ݴ´� //���ܰ� �߻��ص� finally ����, ���ܰ� �߻����� �ʾƵ� finally ���� 
			//fianlly�� is ������ ������ �ȵǴ�, InputStream is�� �� ���� ������ 
			try {
				if(is!=null) is.close(); //is�� null�̸� close �������� �ʰ� ���� 
			} catch (IOException e) {
				System.out.println(e.getMessage());
			}
		}
	}
}
