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

	private JPanel panel; // �޾ƿ�  �����̳� ����
  //private Container contenPane; //�޾ƿ� �����̳ʸ� ���� 
	private JButton jbtn;
	private JLabel jlbl;
	
	public Ex01_Thrusday(String title) { //�����̳� �޾ƿͼ� ������Ʈ add 
		//JTextField txtF = new JTextField(); ����ٰ� new �ع����� ovride���� �ʿ��� �ֵ��� ������ ���� ����  
		super(title);
		setDefaultCloseOperation(EXIT_ON_CLOSE); // x��ư ������ ���� //setDefault �Լ��� �����ӿ� ������ J�����ӿ� �ֱ� ������ �� �� ���� 
		//������ �����̳� ������ (��ó��)
		panel = (JPanel) getContentPane(); //�ܰ��� �ִ� ū �������� ���ðǵ�, �� �������� �����̳� ���� 
		panel.setLayout(new FlowLayout());
		jlbl = new JLabel("��ſ� �����", (int)CENTER_ALIGNMENT);// ���� ��� �������ִ� ���� (����ȯ ����ߵ�)
		jbtn = new JButton("EXIT");
		
		panel.add(jlbl);
		jlbl.setPreferredSize(new Dimension(150,200));
		panel.add(jbtn);
		jbtn.setPreferredSize(new Dimension(200,200));
		
		setVisible(true);
		setSize(new Dimension(400,250));
		setLocation(200,50);
		// �̺�Ʈ ������ �߰� 
		jbtn.addActionListener(this);
	}
	@Override
	public void actionPerformed(ActionEvent e) { // �̺�Ʈ ���� 
		if(e.getSource() == jbtn) {
			setVisible(false); 
			dispose();		   
			System.exit(0); 
		}
	}
	public static void main(String[] args) {
		new Ex01_Thrusday("���� ����");
	}

}
