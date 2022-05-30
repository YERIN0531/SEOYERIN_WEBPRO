package com.lec.ex18_gui;

import java.awt.*;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.io.OutputStream;

public class Ex02Login2 extends Frame {
	private Panel		panel;	//---------------------------------------- �߰��� �κ� 
	private Label 		lbl1;
	private TextField 	txtId;
	private Label 		lbl2;
	private TextField 	txtPw;
	private Button 		btnLogin;
	
	public Ex02Login2(String title) { 
		super(title);	
		//BorderLayout ���� ����� 
//		panel 	 = new Panel(new GridLayout(2,2));//-----------------------�г��� �⺻ ���̾ƿ� : FlowLayout
		panel	 = new Panel();					  //-----------------------�⺻ ���̾ƿ����� ó���Ұ��� 
//		setLayout(new GridLayout(2,2));
		
		lbl1   	 = new Label(" ���̵�  "); 	 	
		txtId  	 = new TextField("ID", 20); 
		lbl2   	 = new Label("��й�ȣ");
		txtPw  	 = new TextField(20);
		txtPw.setEchoChar('*');           	
		btnLogin = new Button("LOGIN");
		
		panel.add(lbl1);						 //------------------------�гο� ���̵�,��й�ȣ �߰� ���ֱ� 
		panel.add(txtId); 
		panel.add(lbl2);
		panel.add(txtPw);
		panel.setPreferredSize(new Dimension(280,50));
		
		add(panel, BorderLayout.NORTH);			//------------------------�߰��� �κ� 
		add(btnLogin, BorderLayout.SOUTH);		//------------------------�߰��� �κ� 
		setSize(new Dimension(300,150));
		setLocation(200,100);
		setVisible(true);
		addWindowListener(new WindowAdapter() {
			@Override
			public void windowClosing(WindowEvent e) {
				setVisible(false); 
				dispose();		   
				System.exit(0);    
			}
		});
	}
	public Ex02Login2() {
		this("");
	}
	public static void main(String[] args) {
		new Ex02Login2("Login");
	}
}






























