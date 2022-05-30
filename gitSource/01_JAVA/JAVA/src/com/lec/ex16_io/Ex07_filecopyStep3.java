package com.lec.ex16_io;
import java.io.File;
//������ ũ�⸸ŭ�� byte�� ���� 
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

public class Ex07_filecopyStep3 {

	public static void main(String[] args) {
		//��ü ����� ������ ��� ���� 
		InputStream  is = null;
		OutputStream os = null;
		try {
			File file = new File("d:\\webPro\\bts.png"); //file�� �뷮�� �̾Ƴ��� ���� ������� ��ü 
			is = new FileInputStream(file); //1�ܰ� �Ϸ� 
			os = new FileOutputStream("d:/webPro/bts_copyed.png"); //�����̸� or ���� �̸��� �ٸ��� �ؾߵ� 
			int cnt = 0; //��� ������ �ñ��ؼ� �׳� �߰��Ѱ� ��� �� 
			byte[] bs = new byte[(int)file.length()];//file.length() = ������ �뷮 ---> ����ȯ ����ߵ� 
			while(true) { //2�ܰ� 
				int readByteCount = is.read(bs); // ������ ũ�⸸ŭ byte �б�
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
