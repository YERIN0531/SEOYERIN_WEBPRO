package com.lec.ex18_gui;

import java.awt.BorderLayout;
import java.awt.Container;
import java.awt.Dimension;
import java.awt.GridBagLayout;
import java.awt.GridLayout;
import java.awt.TextField;
import java.awt.event.*;
import java.util.ArrayList;
import java.awt.event.*;

import javax.swing.*;

public class Ex03_GUI extends JFrame implements ActionListener {

	//컴포넌트 객체 변수 선언  //[지금은 안할 것] ArrayList 변수, file io 를 위한 stream, db접속관련 변수  
	
	private Container   contenPane;			//컨테이너 얻어올 변수
	private JPanel	    jp;					//이름 전화 나이 받을 6개 컴포턴트를 gridLayout으로 add 
	
	private JTextField  txtName,txtTel,txtAge;
	private ImageIcon   icon;
	private JButton	    btnOut;
	private JTextArea   jta; 				// TextArea는 여러줄 생성하게 하는 애 
	private JScrollPane scroolbar;			// 스크롤바 JTextArea에 만들기 위해 생성한 변수 
	private int 		cnt;				// 몇명 입력했는지 저장
//	private ArrayList<Person> person;		// 생성자에서 반드시 new 해야됨
	
	//생성자 : 컨테이너 얻어오기 -> 레이아웃 세팅(보더레이아웃은 세팅할 필요 없음) -> 컴포넌트 객체 생성 , add -> 이벤트 추가 
	
	public Ex03_GUI(String title) {
		super(title);
		setDefaultCloseOperation(EXIT_ON_CLOSE); 
		contenPane = getContentPane();
//		contenPane.setLayout(new BorderLayout());			//기본 레이아웃 그대로 사용해서 생략
		jp		   = new JPanel(new GridLayout(3,2));
//		jp		   = new JPanel();
//		jp.setLayout(new GridLayout(3,2));					//패널의 기본 레이아웃은 FLowLayout();
		
		txtName	   = new JTextField();
		txtTel	   = new JTextField();
		txtAge     = new JTextField();
		icon 	   = new ImageIcon("icon/output.png");
		btnOut 	   = new JButton("출력", icon);
		jta	 	   = new JTextArea(5,30);					// 5행 30열 text
		scroolbar  = new JScrollPane(jta);					// 스크롤바를 안은 textarea가 생성 (코딩상으로는 스크롤바가 jta를 안고 있는 거처럼 만들어줘야됨)
		
		jp.add(new JLabel("이  름", (int) CENTER_ALIGNMENT)); 
		jp.add(txtName);
		jp.add(new JLabel("전  화", (int) CENTER_ALIGNMENT)); 
		jp.add(txtTel);
		jp.add(new JLabel("나  이", (int) CENTER_ALIGNMENT)); 
		jp.add(txtAge);
		
		contenPane.add(jp, BorderLayout.NORTH);
		contenPane.add(btnOut, BorderLayout.CENTER);
		contenPane.add(scroolbar, BorderLayout.SOUTH);		// 스크롤바를 넣어야 jta를 품고 있는 애가 같이 들어감 
		setVisible(true);
//		setSize(new Dimension(400,300));
//		setLocation(200,100);
		setBounds(200,100,400,300); 						//setLocation과 setSize를 한번에 할 수 있는 아이 
		
		//이벤트 추가 
		
		btnOut.addActionListener(this);
	}
	
	@Override
	public void actionPerformed(ActionEvent e) {//이벤트 로직 
		if(e.getSource() == btnOut) { //이벤트 걸게 한 그 소스가 btnOut야?
			// txtName, txtTel, txtAge 에 입력된 값을 jta에 출력하는 역할 .. 단 제대로 입력해야 출력해줄 것 
			String name = txtName.getText().trim(); //내가 입력한게 name에 들어감
			String tel  = txtTel.getText().trim();
			if(name.equals("") || tel.equals("")) {
				System.out.println("이름과 전화번호는 필수 입력 사항입니다");
				return;
			}
			// 번호 체크 
			if(tel.indexOf("-") == tel.lastIndexOf("-") || 
			   tel.indexOf("-")<2 ||
			   tel.lastIndexOf("-")>10){
			// 1 ) 010-9999-9999 로 치면 로직이 성립 X // 010-12345 or 1234567 이런식으로 치면 잘못된 것임을 말해주기 위해 이 로직 성립
			// 2 ) 02, 032 앞 숫자가 2보다 적으면 안됨 
			// 3 ) 010-91234567-9999 이렇게 치면 안됨 
				System.out.println("전화번호 형식을 확인해 주세요 ");
				return;
			}
			// 나이 체크 
			int age =0;
			try {
				age = Integer.parseInt(txtAge.getText());
				if(age <0 || age>150 ) {
					System.out.println("유효하지 않은 나이를 입력할 경우 0살로");
					age = 0;
				}
			}catch(Exception e1) {
				System.out.println("유효하지 않은 나이를 입력할 경우 0살로");
			}
			System.out.println(++cnt + "명 입력됨");
			if(cnt==1) {
				jta.setText("이름\t전화\t\t나이\n");
			}
			jta.append(name + "\t" + tel + "\t\t"+age+"\n"); // append 하면 기존 내용 더하기 추가  //한 명 add 한 것을 jta출력 
			txtName.setText("");
			txtTel.setText("");
			txtAge.setText("");
		}
	}
	
	public static void main(String[] args) {
		new Ex03_GUI("last EX");
	}

}


















