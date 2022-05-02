package com.lec.ex18_gui;

import java.awt.*;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.io.OutputStream;

public class Ex02Login2 extends Frame {
	private Panel		panel;	//---------------------------------------- 추가된 부분 
	private Label 		lbl1;
	private TextField 	txtId;
	private Label 		lbl2;
	private TextField 	txtPw;
	private Button 		btnLogin;
	
	public Ex02Login2(String title) { 
		super(title);	
		//BorderLayout 으로 만들것 
//		panel 	 = new Panel(new GridLayout(2,2));//-----------------------패널의 기본 레이아웃 : FlowLayout
		panel	 = new Panel();					  //-----------------------기본 레이아웃으로 처리할거임 
//		setLayout(new GridLayout(2,2));
		
		lbl1   	 = new Label(" 아이디  "); 	 	
		txtId  	 = new TextField("ID", 20); 
		lbl2   	 = new Label("비밀번호");
		txtPw  	 = new TextField(20);
		txtPw.setEchoChar('*');           	
		btnLogin = new Button("LOGIN");
		
		panel.add(lbl1);						 //------------------------패널에 아이디,비밀번호 추가 해주기 
		panel.add(txtId); 
		panel.add(lbl2);
		panel.add(txtPw);
		panel.setPreferredSize(new Dimension(280,50));
		
		add(panel, BorderLayout.NORTH);			//------------------------추가된 부분 
		add(btnLogin, BorderLayout.SOUTH);		//------------------------추가된 부분 
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






























