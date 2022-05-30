package com.lec.ex18_gui;

import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.Vector;
import javax.swing.*;

public class Ex02 extends JFrame implements ActionListener {
	//�ʿ��� ������Ʈ ���� �߰� 
  //private JPanel jpanel; 					//�����̳� ���� ����
	private Container 			contenPane; //�����̳� ���� ���� 
	private ImageIcon 			icon;		//��ư�� �� icon����
	private JButton				jBtn;
	private JTextField 			jtxtField;
	private Vector<String> 		items;		//�ĺ��ڽ��� �� item����Ʈ (���ͷ� �ϴ� ���� : �������� �������϶� ���ͷ� ��)
	private String[] item = {"A","B","C"};	//�������� ������ ���� String �迭 ���� [���� �ٸ���]
	private JComboBox<String> 	jCombo;		//�������� ��������� �� �������� ���� �ĺ��ڽ�
	private JCheckBox			jCheck;
	private JLabel				jlBlank;	//�� �� (�̺�Ʈ�� ����� ����) 
	private JButton				jBtnExit;	//�����ư 
	
	//������ : �����̳� ���ͼ� layout ���� -> ������Ʈ ���� �� add -> setVisible, setSize [ȭ�鱸��] ->�̺�Ʈ �߰�  
	
	public Ex02() {//�Ű����� ���� �����ڸ� �� �� super �Ƚᵵ �� 
		setDefaultCloseOperation(EXIT_ON_CLOSE);		//xŬ���� ���� 
		contenPane 	 = getContentPane();				//�����̳� ������ �� (swing�� �����̳ʸ� ���� �� �۾�)
//		jpanel	   	 = (JPanel)getContentPane(); 		//�г��� ���� �����̳� ������ ���
		contenPane.setLayout(new FlowLayout());			//���̾ƿ� ����
		icon 	   	 = new ImageIcon("icon/write.gif");
		jBtn 	  	 = new JButton("Button", icon);
		jtxtField 	 = new JTextField(20); 
//		jCombo 		 = new JComboBox<String>(item); 	//��Ʈ�� �޺��ڽ� �ȿ� �ִ� ���� �̹� ����� ���� �������� �ְ� ������ //�ĺ��ڽ� item ����Ʈ �߰� ��� 1. string �迭(����)
		items 		 = new Vector<String>();			//���Ͱ�ü����
		
		//items �߰��� ���׵� ��������
		
		items.add("A"); items.add("B"); items.add("C");
		jCombo 		 = new JComboBox<String>(items);	//�Ĺ��ڽ� item ����Ʈ �߰���� 2. vector �̿�(������)
		jCheck 		 = new JCheckBox("CheckBox");
		jlBlank 	 = new JLabel("");
		jBtnExit 	 = new JButton("Exit");
		
		//������Ʈ add -> ������Ʈ ������ ����(pdf����)
		
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
		pack(); //�ȿ� ��� �ִ� ���̵�(������Ʈ���� ������) �������� �������� �ּ������� ���� ������ 
		setLocation(100,50);
		
		//�̺�Ʈ ������ �߰� 
		
		jBtn.addActionListener(this);
		jCombo.addActionListener(this);
		jCheck.addActionListener(this);
		jBtnExit.addActionListener(this);
		
	}
		//�̺�Ʈ ���� �߰� 
	@Override
	public void actionPerformed(ActionEvent e) {
		if(e.getSource() == jBtn) { 								// e.getSource() = �̺�Ʈ �ɸ� ���� 
			String temp = jtxtField.getText().trim().toUpperCase(); //jtxtField�� �ִ� txt�� temp�� ������
			if(temp.equals("")) {
				System.out.println("����"); 							//jtxtField�� ��Ʈ���̰ų� space�� �Է����� ��� 
				return;
			}
			jCombo.addItem(temp);									//�޺��ڽ��� item �߰�(=items ���Ϳ� �߰�)
			jlBlank.setText(jtxtField.getText().trim());            //jlBlank���� jtxtField �Է� ���� �״�� (�޺��ڽ����� �빮�ڷ� �ٲ㼭 �ְ�)
			jtxtField.setText(""); 									//�߰��Ұ� �� ������ ��Ʈ������ �ٽ� �ٲ��ֱ� 
		}else if(e.getSource() == jCombo) {
			String temp = jCombo.getSelectedItem().toString();
			int    no	= jCombo.getSelectedIndex();
			jlBlank.setText(no + "��° " + temp + "����");
			jCombo.setSelectedItem("A");							//"A"�� ���õǵ��� (=jCombo.setSelectedIndex(0);)
		}else if(e.getSource() == jCheck) { 	
			if(jCheck.isSelected()) {								//üũ�ڽ� üũ��
				jlBlank.setText(jCheck.getText());
			}else {													//üũ�ڽ� ��üũ��
				jlBlank.setText("");
			}
		}else if(e.getSource() == jBtnExit) {
			setVisible(false);
			dispose();
			System.exit(0);
		}
		
	}
	
	public static void main(String[] args) {
		new Ex02(); //���� 
	}

}

































