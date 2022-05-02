package com.lec.ex16_io;
//step1�� �Խ��� ���鶧 ������� ���� 
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

// 1.��Ʈ����ü : �Է¿�, ��¿� �� �� ����� 
// 2.�а� ���� 
// 3.���� �ݴ´� : ��Ʈ����ü.close(); 
// ��Ʈ����ü�� �ΰ��� ù��° ��ü ����, �ι�° ��ü �������� �ݾ����� �Ϲ������� �ݴ�� �� 
public class Ex05_filecopyStep1 {

	public static void main(String[] args) {
		//��ü ����� ������ ��� ���� 
		InputStream  is = null;
		OutputStream os = null;
		try {
			is = new FileInputStream("d:\\webPro\\bts.png"); //1�ܰ� �Ϸ� 
			os = new FileOutputStream("d:/webPro/bts_copyed.png"); //�����̸� or ���� �̸��� �ٸ��� �ؾߵ� 
			int cnt = 0; //��� ������ �ñ��ؼ� �׳� �߰��Ѱ� ��� �� 
			while(true) { //2�ܰ� 
				int i = is.read(); // 1byte �б�
				if(i == -1) break; // ������ ������ ���� 
				os.write(i);
				cnt++;
			}
			System.out.println(cnt + "�� while�� �����Ͽ� ����� ���� ���� ");
		} catch (FileNotFoundException e) {
			System.out.println(e.getMessage());
		} catch (IOException e) {
			System.out.println(e.getMessage());
		}finally {
		try {
			if(os!=null) os.close();
			if(is!=null) is.close();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		}
		
		
		
		
		
	}
	
}
