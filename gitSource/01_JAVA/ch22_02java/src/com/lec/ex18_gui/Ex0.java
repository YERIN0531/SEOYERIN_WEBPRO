package com.lec.ex18_gui;

import java.awt.*;

public class Ex0 {

	public static void main(String[] args) {
		Frame frame = new Frame("자바 첫 GUI"); // frame의 레이아웃 타입 : BorderLayout
		Button btn  = new Button("버튼");
		frame.add(btn, BorderLayout.NORTH); // 버튼을 프레임에 추가를 하는데, NORTH(위쪽)에 추가 
		Button btn1 = new Button("그냥 버튼");
		frame.add(btn1, BorderLayout.CENTER); // 여기서 NORTH를 또 쓰면 처음 작성한 버튼이 사라짐 // 그냥버튼을 CENTER 에 추가 
		
		//프레임 사이즈 조정
		frame.setSize(new Dimension(300, 200)); //사이즈 조정하는 로직 
		frame.setVisible(true); //이걸 해야 보임 
		frame.setLocation(100, 50); //기본은 왼쪽 위에 뜸.. 이게 싫으면 왼쪽에서 100띄우고 위로 50띄어라 
		
		//3초후 자동 창 닫고 실행 종료 
		try {
			Thread.sleep(3000);
		} catch (InterruptedException e) {}
		frame.setVisible(false); //3초 후 안보이게 됨 
		frame.dispose(); //모든 자원 해제 (frame도 null되고, button도 null되고)
		System.exit(0);  //강제 종료 
	}
}
