package com.lec.ex16_io;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;

// 1. ������ ����(��¿뽺Ʈ����ü����) 2. write�Ѵ� 3. ������ �ݴ´�(��Ʈ����ü.close)
public class Ex03_outputStream {
	public static void main(String[] args) {
		OutputStream os = null;
		try {//////////////////////////////////////////////��true�� �Ⱦ��� ���. true�� ���� append�Ǽ� �߰��� �� ..(append �ϱ� ������ true����� ��) output���� ���� 
			os = new FileOutputStream("txtfile/outTest.txt",true);//1.������ ���� 
			byte[] bs = {'H','e','l','l','o'};
			for(int i = 0 ; i<bs.length ; i++) { //��� Ȯ������ �־ ��  2.write �Ѵ�.
				os.write(bs[i]); // ��� �ܼ� �ƴϰ� ���Ͽ� �߰� �Ǵ� ���� 
			}//for�� �Ⱦ��� os.write(bs) �� �ٷ� �ᵵ ���� 
			System.out.println("���� ��� ���� ");
			
		} catch (FileNotFoundException e) {
			System.out.println(e.getMessage());
		} catch (IOException e) {
			System.out.println(e.getMessage());
		}finally {
				try {
					if(os !=null)
					os.close();
				} catch (IOException e) {
					System.out.println(e.getMessage());
				}
		}
	}

}