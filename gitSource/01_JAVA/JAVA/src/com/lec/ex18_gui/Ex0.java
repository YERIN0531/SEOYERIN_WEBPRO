package com.lec.ex18_gui;

import java.awt.*;

public class Ex0 {

	public static void main(String[] args) {
		Frame frame = new Frame("�ڹ� ù GUI"); // frame�� ���̾ƿ� Ÿ�� : BorderLayout
		Button btn  = new Button("��ư");
		frame.add(btn, BorderLayout.NORTH); // ��ư�� �����ӿ� �߰��� �ϴµ�, NORTH(����)�� �߰� 
		Button btn1 = new Button("�׳� ��ư");
		frame.add(btn1, BorderLayout.CENTER); // ���⼭ NORTH�� �� ���� ó�� �ۼ��� ��ư�� ����� // �׳ɹ�ư�� CENTER �� �߰� 
		
		//������ ������ ����
		frame.setSize(new Dimension(300, 200)); //������ �����ϴ� ���� 
		frame.setVisible(true); //�̰� �ؾ� ���� 
		frame.setLocation(100, 50); //�⺻�� ���� ���� ��.. �̰� ������ ���ʿ��� 100���� ���� 50���� 
		
		//3���� �ڵ� â �ݰ� ���� ���� 
		try {
			Thread.sleep(3000);
		} catch (InterruptedException e) {}
		frame.setVisible(false); //3�� �� �Ⱥ��̰� �� 
		frame.dispose(); //��� �ڿ� ���� (frame�� null�ǰ�, button�� null�ǰ�)
		System.exit(0);  //���� ���� 
	}
}
