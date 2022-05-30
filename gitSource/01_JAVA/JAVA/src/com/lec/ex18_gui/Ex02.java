package com.lec.ex18_gui;

import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.Vector;
import javax.swing.*;

public class Ex02 extends JFrame implements ActionListener {
	//필요한 컴포넌트 변수 추가 
  //private JPanel jpanel; 					//컨테이너 얻어올 변수
	private Container 			contenPane; //컨테이너 얻어올 변수 
	private ImageIcon 			icon;		//버튼에 들어갈 icon변수
	private JButton				jBtn;
	private JTextField 			jtxtField;
	private Vector<String> 		items;		//컴보박스에 들어갈 item리스트 (벡터로 하는 이유 : 아이템이 가변적일때 벡터로 함)
	private String[] item = {"A","B","C"};	//고정적인 개념이 들어갈땐 String 배열 설정 [위와 다르게]
	private JComboBox<String> 	jCombo;		//아이템을 만들었으면 이 아이템을 넣을 컴보박스
	private JCheckBox			jCheck;
	private JLabel				jlBlank;	//빈 라벨 (이벤트를 만들기 위해) 
	private JButton				jBtnExit;	//종료버튼 
	
	//생성자 : 컨테이너 얻어와서 layout 세팅 -> 컴포넌트 생성 후 add -> setVisible, setSize [화면구현] ->이벤트 추가  
	
	public Ex02() {//매개변수 없는 생성자를 쓸 땐 super 안써도 됨 
		setDefaultCloseOperation(EXIT_ON_CLOSE);		//x클릭시 종료 
		contenPane 	 = getContentPane();				//컨테이너 얻어오는 것 (swing은 컨테이너를 얻어온 후 작업)
//		jpanel	   	 = (JPanel)getContentPane(); 		//패널을 통해 컨테이너 얻어오는 방법
		contenPane.setLayout(new FlowLayout());			//레이아웃 지정
		icon 	   	 = new ImageIcon("icon/write.gif");
		jBtn 	  	 = new JButton("Button", icon);
		jtxtField 	 = new JTextField(20); 
//		jCombo 		 = new JComboBox<String>(item); 	//스트링 콤보박스 안에 있는 내가 이미 만들어 놓은 아이템을 넣고 싶을때 //컴보박스 item 리스트 추가 방법 1. string 배열(고정)
		items 		 = new Vector<String>();			//벡터객체생성
		
		//items 추가할 사항들 가져오기
		
		items.add("A"); items.add("B"); items.add("C");
		jCombo 		 = new JComboBox<String>(items);	//컴버박스 item 리스트 추가방법 2. vector 이용(가변적)
		jCheck 		 = new JCheckBox("CheckBox");
		jlBlank 	 = new JLabel("");
		jBtnExit 	 = new JButton("Exit");
		
		//컴포넌트 add -> 컴포넌트 사이즈 조정(pdf참조)
		
		contenPane.add(new JLabel("Label"));
		contenPane.add(jBtn);
		contenPane.add(jtxtField);
		contenPane.add(jCombo);
		contenPane.add(jCheck);
		contenPane.add(jlBlank);
		contenPane.add(jBtnExit);
		
		jBtn.setPreferredSize(new Dimension(200,50));
		jtxtField.setPreferredSize(new Dimension(300,50));
		jCombo.setPreferredSize(new Dimension(100,50));
		jCheck.setPreferredSize(new Dimension(100,50));
		jlBlank.setPreferredSize(new Dimension(200,50));
		jBtnExit.setPreferredSize(new Dimension(100,50));
		
		setVisible(true);
		pack(); //안에 들어 있는 아이들(컴포넌트들을 포함한) 기준으로 프레임을 최소한으로 만든 사이즈 
		setLocation(100,50);
		
		//이벤트 리스너 추가 
		
		jBtn.addActionListener(this);
		jCombo.addActionListener(this);
		jCheck.addActionListener(this);
		jBtnExit.addActionListener(this);
		
	}
		//이벤트 로직 추가 
	@Override
	public void actionPerformed(ActionEvent e) {
		if(e.getSource() == jBtn) { 								// e.getSource() = 이벤트 걸린 아이 
			String temp = jtxtField.getText().trim().toUpperCase(); //jtxtField에 있는 txt를 temp에 넣을것
			if(temp.equals("")) {
				System.out.println("떼끼"); 							//jtxtField에 빈스트링이거나 space만 입력했을 경우 
				return;
			}
			jCombo.addItem(temp);									//콤보박스에 item 추가(=items 벡터에 추가)
			jlBlank.setText(jtxtField.getText().trim());            //jlBlank에는 jtxtField 입력 내용 그대로 (콤보박스에는 대문자로 바꿔서 넣고)
			jtxtField.setText(""); 									//추가할거 다 했으면 빈스트링으로 다시 바꿔주기 
		}else if(e.getSource() == jCombo) {
			String temp = jCombo.getSelectedItem().toString();
			int    no	= jCombo.getSelectedIndex();
			jlBlank.setText(no + "번째 " + temp + "선택");
			jCombo.setSelectedItem("A");							//"A"가 선택되도록 (=jCombo.setSelectedIndex(0);)
		}else if(e.getSource() == jCheck) { 	
			if(jCheck.isSelected()) {								//체크박스 체크됨
				jlBlank.setText(jCheck.getText());
			}else {													//체크박스 언체크함
				jlBlank.setText("");
			}
		}else if(e.getSource() == jBtnExit) {
			setVisible(false);
			dispose();
			System.exit(0);
		}
		
	}
	
	public static void main(String[] args) {
		new Ex02(); //실행 
	}

}

































