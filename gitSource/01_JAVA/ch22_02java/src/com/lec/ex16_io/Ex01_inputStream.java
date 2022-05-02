package com.lec.ex16_io;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;

//어떤 특정 프로그램에 있는 특정 파일을 1byte 씩 읽을 거임 
// 1. 파일을 연다 (=스트림객체생성) 2.데이터를 읽는다(read메소드로 읽는다)  3.파일을 닫는다(=스트림객체없앤다)
public class Ex01_inputStream {

	public static void main(String[] args) {
		InputStream is = null; // null값을 주는 이유 : null을 주지 않으면 finally try 에서 is.close()에 만약, is에 아무값도 안들어가 있을 경우 문제가 발생할 수 있음 ..null을 넣어줘야해 
		//위에다가 변수선언 한 이유는 fianlly에서도 써주기 위해.. 
		try {
			is = new FileInputStream("txtFile/inTest.txt"); //----------------------------- 1.파일을 연다 
			while(true) {//파일의 언제까지 읽을줄 모르니, while을 써서 파일의 끝까지 읽어주기 
				int i = is.read(); //여기서 나오는 예외 처리 해줘야됨. try절 안에 try절 추가 하면 안되고, 밑에 캐치절로 추가해주자 //--2. 데이터를 읽는다  
				//(1byte씩 읽을거니 int를 써줘야됨) 
				if(i==-1)break; //파일의 끝이면 반복문break //파일의 끝이라는 코드값을 읽으면 i가 -1를 리턴함.. 따라서 -1즉 파일의 끝을 만나면 return 해라 라는 뜻 
//				System.out.print(i); // i의 아스키코드가 나옴.. 싫으면 형변환 해줘야됨 
				System.out.print((char)i + "(" + i + ")"); //형변환 안하면 아스키코드 나오는 것
			}
			System.out.println("\n끝");
			//여기서 파일을 닫아버리면 2번 에러가 났을때 닫을수가 없음. 2번 수행하다말고 catch절로 떨어져버리면 안됨  
		} catch (FileNotFoundException e) {
			System.out.println("파일을 못 찾은 경우 예외 : " + e.getMessage());
		} catch (IOException e) {
			System.out.println("파일을 읽을 수 없는 경우 예외 : " + e.getMessage());
		} finally {
			//3. 파일을 닫는다 //예외가 발생해도 finally 실행, 예외가 발생하지 않아도 finally 실행 
			//fianlly에 is 변수가 없으면 안되니, InputStream is는 맨 위로 빼주자 
			try {
				if(is!=null) is.close(); //is가 null이면 close 실행하지 않고 끝냄 
			} catch (IOException e) {
				System.out.println(e.getMessage());
			}
		}
	}
}
