package com.lec.ex16_io;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;

// 1. 파일을 연다(출력용스트림객체생성) 2. write한다 3. 파일을 닫는다(스트림객체.close)
public class Ex03_outputStream {
	public static void main(String[] args) {
		OutputStream os = null;
		try {//////////////////////////////////////////////↓true를 안쓰면 덮어씀. true를 쓰면 append되서 추가가 됨 ..(append 하기 싫으면 true지우면 됨) output에서 가능 
			os = new FileOutputStream("txtfile/outTest.txt",true);//1.파일을 연다 
			byte[] bs = {'H','e','l','l','o'};
			for(int i = 0 ; i<bs.length ; i++) { //얘는 확장포문 넣어도 됨  2.write 한다.
				os.write(bs[i]); // 얘는 콘솔 아니고 파일에 추가 되는 거임 
			}//for문 안쓰고 os.write(bs) 로 바로 써도 가능 
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
