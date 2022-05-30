package com.lec.ex16_io;
//1kb �� ī�� 
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

public class Ex06_filecopyStep2 {

	public static void main(String[] args) {
		//��ü ����� ������ ��� ���� 
		InputStream  is = null;
		OutputStream os = null;
		try {
			is = new FileInputStream("d:\\webPro\\bts.png"); //1�ܰ� �Ϸ� 
			os = new FileOutputStream("d:/webPro/bts_copyed.png"); //�����̸� or ���� �̸��� �ٸ��� �ؾߵ� 
			int cnt = 0; //��� ������ �ñ��ؼ� �׳� �߰��Ѱ� ��� �� 
			byte[] bs = new byte[1024]; //1kbyte = 1024 // 1024*3 = 3kb
			while(true) { //2�ܰ� 
				int readByteCount = is.read(bs); // 1024byte(1Kb) �б�
				if(readByteCount == -1) break; // ������ ������ ���� // readyByteCount (1kb�� �дٰ� 100byte�� ��������, 100byte �а�, 99index���� ��)
				os.write(bs, 0, readByteCount); // bs�� 0 index���� readBytecount��ŭ ����  
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
