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

	//������Ʈ ��ü ���� ����  //[������ ���� ��] ArrayList ����, file io �� ���� stream, db���Ӱ��� ����  
	
	private Container   contenPane;			//�����̳� ���� ����
	private JPanel	    jp;					//�̸� ��ȭ ���� ���� 6�� ������Ʈ�� gridLayout���� add 
	
	private JTextField  txtName,txtTel,txtAge;
	private ImageIcon   icon;
	private JButton	    btnOut;
	private JTextArea   jta; 				// TextArea�� ������ �����ϰ� �ϴ� �� 
	private JScrollPane scroolbar;			// ��ũ�ѹ� JTextArea�� ����� ���� ������ ���� 
	private int 		cnt;				// ��� �Է��ߴ��� ����
//	private ArrayList<Person> person;		// �����ڿ��� �ݵ�� new �ؾߵ�
	
	//������ : �����̳� ������ -> ���̾ƿ� ����(�������̾ƿ��� ������ �ʿ� ����) -> ������Ʈ ��ü ���� , add -> �̺�Ʈ �߰� 
	
	public Ex03_GUI(String title) {
		super(title);
		setDefaultCloseOperation(EXIT_ON_CLOSE); 
		contenPane = getContentPane();
//		contenPane.setLayout(new BorderLayout());			//�⺻ ���̾ƿ� �״�� ����ؼ� ����
		jp		   = new JPanel(new GridLayout(3,2));
//		jp		   = new JPanel();
//		jp.setLayout(new GridLayout(3,2));					//�г��� �⺻ ���̾ƿ��� FLowLayout();
		
		txtName	   = new JTextField();
		txtTel	   = new JTextField();
		txtAge     = new JTextField();
		icon 	   = new ImageIcon("icon/output.png");
		btnOut 	   = new JButton("���", icon);
		jta	 	   = new JTextArea(5,30);					// 5�� 30�� text
		scroolbar  = new JScrollPane(jta);					// ��ũ�ѹٸ� ���� textarea�� ���� (�ڵ������δ� ��ũ�ѹٰ� jta�� �Ȱ� �ִ� ��ó�� �������ߵ�)
		
		jp.add(new JLabel("��  ��", (int) CENTER_ALIGNMENT)); 
		jp.add(txtName);
		jp.add(new JLabel("��  ȭ", (int) CENTER_ALIGNMENT)); 
		jp.add(txtTel);
		jp.add(new JLabel("��  ��", (int) CENTER_ALIGNMENT)); 
		jp.add(txtAge);
		
		contenPane.add(jp, BorderLayout.NORTH);
		contenPane.add(btnOut, BorderLayout.CENTER);
		contenPane.add(scroolbar, BorderLayout.SOUTH);		// ��ũ�ѹٸ� �־�� jta�� ǰ�� �ִ� �ְ� ���� �� 
		setVisible(true);
//		setSize(new Dimension(400,300));
//		setLocation(200,100);
		setBounds(200,100,400,300); 						//setLocation�� setSize�� �ѹ��� �� �� �ִ� ���� 
		
		//�̺�Ʈ �߰� 
		
		btnOut.addActionListener(this);
	}
	
	@Override
	public void actionPerformed(ActionEvent e) {//�̺�Ʈ ���� 
		if(e.getSource() == btnOut) { //�̺�Ʈ �ɰ� �� �� �ҽ��� btnOut��?
			// txtName, txtTel, txtAge �� �Էµ� ���� jta�� ����ϴ� ���� .. �� ����� �Է��ؾ� ������� �� 
			String name = txtName.getText().trim(); //���� �Է��Ѱ� name�� ��
			String tel  = txtTel.getText().trim();
			if(name.equals("") || tel.equals("")) {
				System.out.println("�̸��� ��ȭ��ȣ�� �ʼ� �Է� �����Դϴ�");
				return;
			}
			// ��ȣ üũ 
			if(tel.indexOf("-") == tel.lastIndexOf("-") || 
			   tel.indexOf("-")<2 ||
			   tel.lastIndexOf("-")>10){
			// 1 ) 010-9999-9999 �� ġ�� ������ ���� X // 010-12345 or 1234567 �̷������� ġ�� �߸��� ������ �����ֱ� ���� �� ���� ����
			// 2 ) 02, 032 �� ���ڰ� 2���� ������ �ȵ� 
			// 3 ) 010-91234567-9999 �̷��� ġ�� �ȵ� 
				System.out.println("��ȭ��ȣ ������ Ȯ���� �ּ��� ");
				return;
			}
			// ���� üũ 
			int age =0;
			try {
				age = Integer.parseInt(txtAge.getText());
				if(age <0 || age>150 ) {
					System.out.println("��ȿ���� ���� ���̸� �Է��� ��� 0���");
					age = 0;
				}
			}catch(Exception e1) {
				System.out.println("��ȿ���� ���� ���̸� �Է��� ��� 0���");
			}
			System.out.println(++cnt + "�� �Էµ�");
			if(cnt==1) {
				jta.setText("�̸�\t��ȭ\t\t����\n");
			}
			jta.append(name + "\t" + tel + "\t\t"+age+"\n"); // append �ϸ� ���� ���� ���ϱ� �߰�  //�� �� add �� ���� jta��� 
			txtName.setText("");
			txtTel.setText("");
			txtAge.setText("");
		}
	}
	
	public static void main(String[] args) {
		new Ex03_GUI("last EX");
	}

}


















