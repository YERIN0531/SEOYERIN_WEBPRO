package com.lec.ex18_gui;

import java.awt.Dimension;
import java.awt.FlowLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTextField;

public class Ex01_Thrusday extends JFrame implements ActionListener{

	private JPanel panel; // 받아온  컨테이너 저장
  //private Container contenPane; //받아온 컨테이너를 저장 
	private JButton jbtn;
	private JLabel jlbl;
	
	public Ex01_Thrusday(String title) { //컨테이너 받아와서 컴포넌트 add 
		//JTextField txtF = new JTextField(); 여기다가 new 해버리면 ovride못함 필요한 애들은 위에서 변수 선언  
		super(title);
		setDefaultCloseOperation(EXIT_ON_CLOSE); // x버튼 누르면 종료 //setDefault 함수는 프레임엔 없지만 J프레임엔 있기 때문에 쓸 소 있음 
		//스윙은 컨테이너 얻어오기 (맨처음)
		panel = (JPanel) getContentPane(); //외곽에 있는 큰 프레임을 얻어올건데, 그 프레임이 컨테이너 형식 
		panel.setLayout(new FlowLayout());
		jlbl = new JLabel("즐거운 목요일", (int)CENTER_ALIGNMENT);// 라벨을 가운데 정렬해주는 아이 (형변환 해줘야됨)
		jbtn = new JButton("EXIT");
		
		panel.add(jlbl);
		jlbl.setPreferredSize(new Dimension(150,200));
		panel.add(jbtn);
		jbtn.setPreferredSize(new Dimension(200,200));
		
		setVisible(true);
		setSize(new Dimension(400,250));
		setLocation(200,50);
		// 이벤트 리스터 추가 
		jbtn.addActionListener(this);
	}
	@Override
	public void actionPerformed(ActionEvent e) { // 이벤트 로직 
		if(e.getSource() == jbtn) {
			setVisible(false); 
			dispose();		   
			System.exit(0); 
		}
	}
	public static void main(String[] args) {
		new Ex01_Thrusday("나의 예제");
	}

}
