package com.lec.ex18_gui;

import java.awt.*;
import java.awt.*;

public class Ex01MyFrame extends Frame { //frame�� ��ӹ޾�
	private Button btn;
	private Button btn1;
	public Ex01MyFrame(String title) {
		super(title); //��� ���� frame ������ �Լ��� ȣ�� 
		//��ư 2���� �߰��� ������ 
		btn = new Button("��ư");
		btn1 = new Button("�׳� ��ư");
		add(btn, BorderLayout.NORTH);
		add(btn1, BorderLayout.CENTER);
//		pack(); //�ּ����� ������� 
		setSize(new Dimension(300, 200));
		setVisible(true);
		setLocation(100,50);
		try {
			Thread.sleep(3000);
		} catch (InterruptedException e) {}
		setVisible(false); //3�� �� �Ⱥ��̰� �� 
		dispose(); //��� �ڿ� ���� (frame�� null�ǰ�, button�� null�ǰ�)
		System.exit(0);  //���� ���� 
	}
	public static void main(String[] args) {
		new Ex01MyFrame("first GUI");
	}
}
