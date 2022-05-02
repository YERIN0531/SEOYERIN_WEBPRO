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
	//데이터에 있는걸 가져와서 여기다가 쭈루룩 출력하고 싶으면 ArrayList[]사용 
	//	private OutputStream os ; //파일 입출력 하려면 io 사용 
	
	public Ex02Login(String title) { // 이 생성자는 꼭 실행 
									 // Frame에 컴포넌트 추가하고 화면 보이게 -> 이벤트 
		super(title);
		// Frame의 기본 레이아웃 타입 : BorderLayout - (동,서,남,북,가운데)
		// 						FlowLayout	 - (왼쪽부터 오른쪽으로, 위부터 아래로 차곡차곡 add 되는 아이 )
		//						GridLayout	 - (N행 N열)
		
		
		setLayout(new FlowLayout()); 		// Frame의 레이아웃을 Flow 형태로 세팅 
		lbl1   	 = new Label(" 아이디  "); 	 	// Label이 객체 형태기 때문에 선언해주지 않으면 null값이 들어가버림. lbl1의 새로운 객체 생성해주기 
		txtId  	 = new TextField("ID", 20); // [눈에 보이는 길이] 가 20자 까지만 보일 수 있도록 세팅 - 쓰는건 30자 넘게 가능 
		lbl2   	 = new Label("비밀번호");
		txtPw  	 = new TextField(20);
		txtPw.setEchoChar('*');           	// 비밀번호 그냥 치면 보이니까, *로 보일 수 있도록 세팅
		btnLogin = new Button("LOGIN");
		add(lbl1);
		add(txtId); //쳤는데 갑자기 nullPoint예외가 발생한다는건, 위에서 객체 생성을 안했다는 뜻 
		add(lbl2);
		add(txtPw);
		add(btnLogin);
		
		setSize(new Dimension(300,150));
		setLocation(200,100);
		setVisible(true);
		setResizable(false); //사용자가 사이즈 조정이 불가능 (화면을 늘렸을때 안에 있는 로그인 폼이 바뀌지 않음)
		// x를 누르면 종료 
		addWindowListener(new WindowAdapter() {//윈도우 창에 X를 누르는지 안누르는지 계속 듣고 있겠다 라는 것 (frame에 존재)
			@Override
			public void windowClosing(WindowEvent e) {
				setVisible(false); //안보이게
				dispose();		   //자원해제
				System.exit(0);    //강제종료
			}
		});
	}
	public Ex02Login() { //매개변수 없는 생성자를 굳이 만들고 싶으면 빈 란으로 만들어서 매개변수 있는 애로 넘어갈 수 있게끔 만들면 됨 
		this("");
	}
	public static void main(String[] args) {
		new Ex02Login("Login");
	}
}






























