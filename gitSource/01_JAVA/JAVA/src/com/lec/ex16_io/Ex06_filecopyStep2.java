package com.lec.ex16_io;
//1kb 씩 카피 
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

public class Ex06_filecopyStep2 {

	public static void main(String[] args) {
		//객체 만드는 순서는 상관 없음 
		InputStream  is = null;
		OutputStream os = null;
		try {
			is = new FileInputStream("d:\\webPro\\bts.png"); //1단계 완료 
			os = new FileOutputStream("d:/webPro/bts_copyed.png"); //파일이름 or 폴더 이름을 다르게 해야됨 
			int cnt = 0; //몇번 도는지 궁금해서 그냥 추가한거 없어도 됨 
			byte[] bs = new byte[1024]; //1kbyte = 1024 // 1024*3 = 3kb
			while(true) { //2단계 
				int readByteCount = is.read(bs); // 1024byte(1Kb) 읽기
				if(readByteCount == -1) break; // 파일의 끝인지 여부 // readyByteCount (1kb씩 읽다가 100byte만 남았을때, 100byte 읽고, 99index까지 들어감)
				os.write(bs, 0, readByteCount); // bs를 0 index부터 readBytecount만큼 쓴다  
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
