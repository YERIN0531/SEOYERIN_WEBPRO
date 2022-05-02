package com.lec.ex16_io;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;

// 1. 파일을 연다(출력용스트림객체생성) 2. write한다 3. 파일을 닫는다(스트림객체.close)
public class Ex04_outputStream2 {
	public static void main(String[] args) {
		OutputStream os = null;
		try {//////////////////////////////////////////////↓true를 안쓰면 덮어씀. true를 쓰면 append되서 추가가 됨 ..(append 하기 싫으면 true지우면 됨) output에서 가능 
			os = new FileOutputStream("txtfile/outTest.txt",true);//1.파일을 연다 //true를 쓸때와 안쓸때 다름  
			String str = "Hello, Java \n 이 시국에 모두 건강하세요";
			byte[] bs = str.getBytes(); //스트링을 byte배열로 바꾸는 함수 
			os.write(bs); //for문 안돌리고 출력 
			System.out.println("파일 출력 성공 ");
			
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
