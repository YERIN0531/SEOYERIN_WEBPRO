package com.lec.ex18_gui;

import java.awt.*;
import java.awt.*;

public class Ex01MyFrame extends Frame { //frame을 상속받아
	private Button btn;
	private Button btn1;
	public Ex01MyFrame(String title) {
		super(title); //상속 받은 frame 생성자 함수를 호출 
		//버튼 2개를 추가한 프레임 
		btn = new Button("버튼");
		btn1 = new Button("그냥 버튼");
		add(btn, BorderLayout.NORTH);
		add(btn1, BorderLayout.CENTER);
//		pack(); //최소한의 사이즈로 
		setSize(new Dimension(300, 200));
		setVisible(true);
		setLocation(100,50);
		try {
			Thread.sleep(3000);
		} catch (InterruptedException e) {}
		setVisible(false); //3초 후 안보이게 됨 
		dispose(); //모든 자원 해제 (frame도 null되고, button도 null되고)
		System.exit(0);  //강제 종료 
	}
	public static void main(String[] args) {
		new Ex01MyFrame("first GUI");
	}
}
