package com.lec.ex18_gui;

import java.awt.*;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.io.OutputStream;

public class Ex02Login extends Frame {

	private Label 		lbl1;
	private TextField 	txtId;
	private Label 		lbl2;
	private TextField 	txtPw;
	private Button 		btnLogin;
	//�����Ϳ� �ִ°� �����ͼ� ����ٰ� �޷�� ����ϰ� ������ ArrayList[]��� 
	//	private OutputStream os ; //���� ����� �Ϸ��� io ��� 
	
	public Ex02Login(String title) { // �� �����ڴ� �� ���� 
									 // Frame�� ������Ʈ �߰��ϰ� ȭ�� ���̰� -> �̺�Ʈ 
		super(title);
		// Frame�� �⺻ ���̾ƿ� Ÿ�� : BorderLayout - (��,��,��,��,���)
		// 						FlowLayout	 - (���ʺ��� ����������, ������ �Ʒ��� �������� add �Ǵ� ���� )
		//						GridLayout	 - (N�� N��)
		
		
		setLayout(new FlowLayout()); 		// Frame�� ���̾ƿ��� Flow ���·� ���� 
		lbl1   	 = new Label(" ���̵�  "); 	 	// Label�� ��ü ���±� ������ ���������� ������ null���� ������. lbl1�� ���ο� ��ü �������ֱ� 
		txtId  	 = new TextField("ID", 20); // [���� ���̴� ����] �� 20�� ������ ���� �� �ֵ��� ���� - ���°� 30�� �Ѱ� ���� 
		lbl2   	 = new Label("��й�ȣ");
		txtPw  	 = new TextField(20);
		txtPw.setEchoChar('*');           	// ��й�ȣ �׳� ġ�� ���̴ϱ�, *�� ���� �� �ֵ��� ����
		btnLogin = new Button("LOGIN");
		add(lbl1);
		add(txtId); //�ƴµ� ���ڱ� nullPoint���ܰ� �߻��Ѵٴ°�, ������ ��ü ������ ���ߴٴ� �� 
		add(lbl2);
		add(txtPw);
		add(btnLogin);
		
		setSize(new Dimension(300,150));
		setLocation(200,100);
		setVisible(true);
		setResizable(false); //����ڰ� ������ ������ �Ұ��� (ȭ���� �÷����� �ȿ� �ִ� �α��� ���� �ٲ��� ����)
		// x�� ������ ���� 
		addWindowListener(new WindowAdapter() {//������ â�� X�� �������� �ȴ������� ��� ��� �ְڴ� ��� �� (frame�� ����)
			@Override
			public void windowClosing(WindowEvent e) {
				setVisible(false); //�Ⱥ��̰�
				dispose();		   //�ڿ�����
				System.exit(0);    //��������
			}
		});
	}
	public Ex02Login() { //�Ű����� ���� �����ڸ� ���� ����� ������ �� ������ ���� �Ű����� �ִ� �ַ� �Ѿ �� �ְԲ� ����� �� 
		this("");
	}
	public static void main(String[] args) {
		new Ex02Login("Login");
	}
}






























