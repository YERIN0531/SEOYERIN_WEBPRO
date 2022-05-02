package com.lec.ex18_gui;

import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;

public class Ex03Event extends Frame implements ActionListener{

	private Panel panel;
	//private Label lbl;	// 이벤트 할때 안해도 됨
	private TextField txtField;
	private Button btnOk, btnExit;
	private List	list; //util말고 awt 임폴트
	
	public Ex03Event() {// layout셋팅, 컴포넌트 생성 후 add, setVisible, setSize
//		setLayout(new BorderLayout()); //프레임의 기본 레이아웃은 Border이므로 생략 가능
		panel = new Panel();
//		panel = new Panel(new FlowLayout())// 패널의 기본 레이아웃은 Flow이므로 생략 가능
		txtField = new TextField(20);
		btnOk = new Button("OK");
		btnExit = new Button("EXIT");
		list = new List();
		
		panel.add(new Label("write"));
		panel.add(txtField); //new하면 안됨 .. null들어감
		panel.add(btnOk);
		panel.add(btnExit);
		
		add(panel, BorderLayout.NORTH);
		add(list, BorderLayout.CENTER);
		
		setVisible(true);
		setSize(new Dimension(400,150));
		setLocation(200,50);
		addWindowListener(new WindowAdapter() {
			@Override
			public void windowClosing(WindowEvent e) {
				setVisible(false); 
				dispose();		   
				System.exit(0);    
			}
		});
		//이벤트 추가  1. implements ActionListener (ActionListere안에 있는 추상메소드가 있음) -> 오버라이드 해줘야됨 
		//		  2. 이벤트 리스너 추가 (V) (내가 만약 btnOk 를 눌렀을때 뭔가를 해주고 싶으면 btnOk에 리스너를 추가 해줘야됨 : 너 이거 했어? 하고 항상 듣고 있는거임)
		btnOk.addActionListener(this); //클릭하면 매개변수 안에 있는 this 안에 있는 actionPerforemed 안에를 실행해라 
		btnExit.addActionListener(this);
		//		  3. override 된 메소드(함수) 안에 로직 추가 
			
	}
	public Ex03Event(String title) {
		this();
		setTitle(title);
	}
	@Override
	public void actionPerformed(ActionEvent e) {
		if(e.getSource()==btnOk) {// OK버튼 클릭시 할 로직 : txtfield에 있는 아이를 list에 추가 //얘는 무조건 스트링으로 가져 옴   
			list.add(txtField.getText().trim().toUpperCase());
			txtField.setText(" "); //문자 치고 난 뒤에 write 부분은 비어야 되니까 써주는 로직 
			
		}else if(e.getSource() == btnExit) { // EXIT 눌렀을때 종료하는 로직 
			setVisible(false); 
			dispose();		   
			System.exit(0);
		}
	}

	public static void main(String[] args) {
		new Ex03Event("title"); // title 안넣고 싶으면 new Ex03Event(); 해도 됨  
	}
}
