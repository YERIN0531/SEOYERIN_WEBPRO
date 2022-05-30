package com.lec.ex16_io;
//step1은 게시판 만들때 사용하지 않음 
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

// 1.스트림객체 : 입력용, 출력용 둘 다 만들어 
// 2.읽고 쓴다 
// 3.파일 닫는다 : 스트림객체.close(); 
// 스트림객체가 두개면 첫번째 객체 열고, 두번째 객체 열었으면 닫았을땐 일반적으로 반대로 함 
public class Ex05_filecopyStep1 {

	public static void main(String[] args) {
		//객체 만드는 순서는 상관 없음 
		InputStream  is = null;
		OutputStream os = null;
		try {
			is = new FileInputStream("d:\\webPro\\bts.png"); //1단계 완료 
			os = new FileOutputStream("d:/webPro/bts_copyed.png"); //파일이름 or 폴더 이름을 다르게 해야됨 
			int cnt = 0; //몇번 도는지 궁금해서 그냥 추가한거 없어도 됨 
			while(true) { //2단계 
				int i = is.read(); // 1byte 읽기
				if(i == -1) break; // 파일의 끝인지 여부 
				os.write(i);
				cnt++;
			}
			System.out.println(cnt + "번 while문 실행하여 힘들게 복사 성공 ");
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
