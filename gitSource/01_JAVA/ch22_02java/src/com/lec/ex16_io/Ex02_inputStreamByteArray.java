package com.lec.ex16_io;

import java.io.*; //나중에 컨트롤 쉬프트 O 눌러 
//1.파일연다 
//2.데이터를 읽는다 : read() 1byte씩 읽는다. 속도가 느림 / read(byte[])- byte[]만큼 읽음 -read 변수 안에 byte 배열 변수를 넣어주면 byte배열씩 읽음  
//3.파일 닫는다 
public class Ex02_inputStreamByteArray {

	public static void main(String[] args) {
		InputStream is = null;
		try {
			is = new FileInputStream("txtFile/inTest.txt"); // 슬래쉬 하나 하거나 역슬래쉬 두개 하거나 //1번 파일 연다
			byte[] bs = new byte[10]; //10바이트씩 읽는 배열 
			while(true) {// 2. 파일을 읽는다
				int readByteCount = is.read(bs); //bs바이트 수 만큼 읽는다 
				if(readByteCount == -1)break; //파일 끝인지 여부 
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
				if(is !=null) //if에 중괄호 왜 안함?  
					is.close();					
				
			} catch (IOException e) {
				System.out.println(e.getMessage());
			}
		}
	}
}
