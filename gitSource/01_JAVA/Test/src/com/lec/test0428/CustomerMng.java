package com.lec.test0428;

import java.awt.Container;
import java.awt.Dimension;
import java.awt.FlowLayout;
import java.awt.GridBagLayout;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.ArrayList;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.JTextField;



public class CustomerMng extends JFrame implements ActionListener {

	//ȭ�鿡 �� ������Ʈ
	private Container 	container;
	private JPanel	  	jpup, jpdown;
	
	private JTextField  txtPhone,txtName,txtPoint;
	private JButton	    btnJoin,btnSearch,btnOutput,btnExit;
	private JTextArea   jta;
	private JScrollPane scrollpane;
	
	//DB���� ���� 
	private CustomerDao dao = CustomerDao.getInstance();
	private ArrayList<CustomerDto> customer;
	
	public CustomerMng(String title) {
		super(title);
		setDefaultCloseOperation(EXIT_ON_CLOSE);// ���������� ������ ��ư 
		container = getContentPane();
		container.setLayout(new FlowLayout());
		
		jpup     = new JPanel(new GridLayout(3,2));
		jpdown   = new JPanel();
		txtPhone = new JTextField(15);
		txtName  = new JTextField(15);
		txtPoint = new JTextField(15);
		
		btnJoin   = new JButton("����");
		btnSearch = new JButton("����ȸ");
		btnOutput = new JButton("���");
		btnExit   = new JButton("����");
		
		//---------------------------------------------------��ư���� ���� 
//		btnJoin.setPreferredSize(new Dimension(100,30));
//		btnSearch.setPreferredSize(new Dimension(100,30));
//		btnOutput.setPreferredSize(new Dimension(100,30));
//		btnExit.setPreferredSize(new Dimension(100,30));
		
		jta = new JTextArea(15,30);
		scrollpane = new JScrollPane(jta);
		
		jpup.add(new JLabel("����ȣ",(int)CENTER_ALIGNMENT));
		jpup.add(txtPhone);
		jpup.add(new JLabel("��  ��",(int)CENTER_ALIGNMENT));
		jpup.add(txtName);
		jpup.add(new JLabel("����Ʈ",(int)CENTER_ALIGNMENT));
		jpup.add(txtPoint);
		
		jpdown.add(btnJoin);
		jpdown.add(btnSearch);
		jpdown.add(btnOutput);
		jpdown.add(btnExit);
		
		container.add(jpup);
		container.add(jpdown);
		container.add(scrollpane);
		
		setSize(new Dimension(400,450));
		setLocation(200,150);
		setVisible(true);
		
		btnJoin.addActionListener(this);
		btnSearch.addActionListener(this);
		btnOutput.addActionListener(this);
		btnExit.addActionListener(this);
	}
	
	@Override
	public void actionPerformed(ActionEvent e) {
		if(e.getSource()==btnJoin) { //ȸ�����Է��� 	
			String ctel = txtPhone.getText().trim();
			String cname = txtName.getText().trim();
			if(cname.length()<2 || ctel.length()<8) {
				jta.setText("�̸��� �α��� �̻� , ��ȭ��ȣ�� 8�ڸ� �̻����� �ۼ����ּ���");
				return;
			}
			
			int result = dao.insertCustomer(ctel, cname);
			if(result==CustomerDao.SUCCESS) {
				jta.setText(cname +" �� ȸ�������� ���ϵ帳�ϴ�");
				txtPoint.setText("1000");
				txtName.setText("");
				txtPhone.setText("");
				
			}
			
		}else if(e.getSource()==btnSearch) {
			txtName.setText("");
			txtPoint.setText("");
			jta.setText("");
			String ctel = txtPhone.getText().trim();
			if(ctel.length()<4) {
				jta.setText("�ùٸ� ��ȭ��ȣ ������ �Է��� �ּ���(���ڸ�||����ڸ�)");
				return;
			}
			ArrayList<CustomerDto> dtos = dao.ctelGetCustomer(ctel);
			if(dtos.size()==0) {// �ƹ��� ������ 
				jta.setText("�ش��ȣ�� ȸ���� �������� �ʽ��ϴ� ȸ�������� ���ּ���");
			}else if(dtos.size()==1) { // �Ѹ��϶� 
				txtPhone.setText(dtos.get(0).getCtel());
				txtName.setText(dtos.get(0).getCname());
				txtPoint.setText(String.valueOf(dtos.get(0).getPoint()));
				jta.setText("");
			} else if (dtos.size()>=1) {
				jta.append("ȸ����ȣ\t��ȭ��ȣ\t�̸�\t����Ʈ\n");
				for(CustomerDto d : dtos) {
					jta.append(d.toString());
					
				}
			}
			
			
			
		}else if(e.getSource()==btnOutput) {
			txtName.setText("");
			txtPhone.setText("");
			txtPoint.setText("");
			jta.setText("");
			
			ArrayList<CustomerDto> dtos = dao.getCustomer();
			if(dtos.size()!=0) {
				jta.append("ȸ����ȣ\t��ȭ��ȣ\t�̸�\t����Ʈ\n");
				for(CustomerDto d : dtos) {
					jta.append(d.toString());
				}
			}else {
				jta.setText("��ϵ� ȸ���� �������� �ʽ��ϴ�");
			}
	
			
		}else if(e.getSource()==btnExit) {
			setVisible(false);
			dispose();
			System.exit(0);
		}
		
		
		
		
		

	}
	public static void main(String[] args) {
		new CustomerMng("ȸ������");
	}

}
