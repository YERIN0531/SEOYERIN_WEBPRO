package com.lec.ex18_gui;

import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;

public class Ex03Event extends Frame implements ActionListener{

	private Panel panel;
	//private Label lbl;	// �̺�Ʈ �Ҷ� ���ص� ��
	private TextField txtField;
	private Button btnOk, btnExit;
	private List	list; //util���� awt ����Ʈ
	
	public Ex03Event() {// layout����, ������Ʈ ���� �� add, setVisible, setSize
//		setLayout(new BorderLayout()); //�������� �⺻ ���̾ƿ��� Border�̹Ƿ� ���� ����
		panel = new Panel();
//		panel = new Panel(new FlowLayout())// �г��� �⺻ ���̾ƿ��� Flow�̹Ƿ� ���� ����
		txtField = new TextField(20);
		btnOk = new Button("OK");
		btnExit = new Button("EXIT");
		list = new List();
		
		panel.add(new Label("write"));
		panel.add(txtField); //new�ϸ� �ȵ� .. null��
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
		//�̺�Ʈ �߰�  1. implements ActionListener (ActionListere�ȿ� �ִ� �߻�޼ҵ尡 ����) -> �������̵� ����ߵ� 
		//		  2. �̺�Ʈ ������ �߰� (V) (���� ���� btnOk �� �������� ������ ���ְ� ������ btnOk�� �����ʸ� �߰� ����ߵ� : �� �̰� �߾�? �ϰ� �׻� ��� �ִ°���)
		btnOk.addActionListener(this); //Ŭ���ϸ� �Ű����� �ȿ� �ִ� this �ȿ� �ִ� actionPerforemed �ȿ��� �����ض� 
		btnExit.addActionListener(this);
		//		  3. override �� �޼ҵ�(�Լ�) �ȿ� ���� �߰� 
			
	}
	public Ex03Event(String title) {
		this();
		setTitle(title);
	}
	@Override
	public void actionPerformed(ActionEvent e) {
		if(e.getSource()==btnOk) {// OK��ư Ŭ���� �� ���� : txtfield�� �ִ� ���̸� list�� �߰� //��� ������ ��Ʈ������ ���� ��   
			list.add(txtField.getText().trim().toUpperCase());
			txtField.setText(" "); //���� ġ�� �� �ڿ� write �κ��� ���� �Ǵϱ� ���ִ� ���� 
			
		}else if(e.getSource() == btnExit) { // EXIT �������� �����ϴ� ���� 
			setVisible(false); 
			dispose();		   
			System.exit(0);
		}
	}

	public static void main(String[] args) {
		new Ex03Event("title"); // title �ȳְ� ������ new Ex03Event(); �ص� ��  
	}
}
