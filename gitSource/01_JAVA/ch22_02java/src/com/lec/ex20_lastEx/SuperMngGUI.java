package com.lec.ex20_lastEx;

import java.awt.Button;
import java.awt.Container;
import java.awt.Dimension;
import java.awt.FlowLayout;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.ArrayList;
import java.util.Vector;

import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JScrollBar;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.JTextField;

import javafx.scene.control.ComboBox;

public class SuperMngGUI extends JFrame implements ActionListener {
	
	//DAO
	private CustomerDao cdao = CustomerDao.getInstance();
	
	//ȭ�鱸�� 
	private Container 			container;
	private JPanel	  			jpup,jpbtn;
	
	private JTextField 			txtcid,txtctel,txtcname,txtcpoint,txtcamount;
	private Vector<String> 		lname;
	private JComboBox<String> 	comjob;
	private JButton				btncidSearch,btnctelSearch,btncnameSearch,btnbuyWithPoint;
	private JButton				btnBuy,btnLevelNameOutput,btnAllOutput,btnInsert,btnCTelUpdate,btnDelete,btnExit;
	private JTextArea			txtPool;
	private JScrollPane			scrollPane;
	
	public SuperMngGUI(String title) {
		super(title);
		setDefaultCloseOperation(EXIT_ON_CLOSE);//x��ư ������ ������ ���� 
		container = getContentPane(); //�����̳� �ҷ����¾�
		container.setLayout(new FlowLayout()); //�����̳� �⺻ ���̾ƿ��� border(���Ʒ����� ��������� �ϴ� �� )
	
		jpup = new JPanel(new GridLayout(6,3));
		jpbtn = new JPanel();
		
		txtcid     = new JTextField(20);
		txtctel    = new JTextField(20);
		txtcname   = new JTextField(20);
		txtcpoint  = new JTextField(20);
		txtcamount = new JTextField(20);
		
		lname = cdao.getLevelName();
		comjob = new JComboBox<String>(lname);
		
		btncidSearch    	= new JButton("���̵�˻�");
		btnctelSearch   	= new JButton("��4�ڸ�(FULL)�˻�");
		btncnameSearch  	= new JButton("�� �̸� �˻�");
		btnbuyWithPoint 	= new JButton("����Ʈ�θ� ����");
		
		btnBuy 				= new JButton("��ǰ����");
		btnLevelNameOutput  = new JButton("��޺����");
		btnAllOutput 		= new JButton("��ü���");
		btnInsert 			= new JButton("ȸ������");
		btnCTelUpdate 		= new JButton("��ȣ����");
		btnDelete 			= new JButton("ȸ��Ż��");
		btnExit 			= new JButton("������");
			
		txtPool				= new JTextArea(6,70);
		scrollPane			= new JScrollPane(txtPool);
	
		jpup.add(new JLabel("���̵�",(int)CENTER_ALIGNMENT));
		jpup.add(txtcid);
		jpup.add(btncidSearch);
		
		jpup.add(new JLabel("����ȭ",(int)CENTER_ALIGNMENT));
		jpup.add(txtctel);
		jpup.add(btnctelSearch);
		
		jpup.add(new JLabel("���̸�",(int)CENTER_ALIGNMENT));
		jpup.add(txtcname);
		jpup.add(btncnameSearch);
		
		jpup.add(new JLabel("����Ʈ",(int)CENTER_ALIGNMENT));
		jpup.add(txtcpoint);
		jpup.add(btnbuyWithPoint);
		
		jpup.add(new JLabel("���űݾ�",(int)CENTER_ALIGNMENT));
		jpup.add(txtcamount);
		jpup.add(new JLabel()); // 5�� 3�� 
		
		jpup.add(new JLabel("�����",(int)CENTER_ALIGNMENT));
		jpup.add(comjob);
	
	
		jpbtn.add(btnBuy);
		jpbtn.add(btnLevelNameOutput);
		jpbtn.add(btnAllOutput);
		jpbtn.add(btnInsert);
		jpbtn.add(btnCTelUpdate);
		jpbtn.add(btnDelete);
		jpbtn.add(btnExit);
	
		container.add(jpup);
		container.add(jpbtn);
		container.add(scrollPane);
		
		setVisible(true);
		setSize(new Dimension(800,400));
		setLocation(200,100);
	
		btncidSearch.addActionListener(this);
		btnctelSearch.addActionListener(this);
		btncnameSearch.addActionListener(this);
		btnbuyWithPoint.addActionListener(this);
		btnBuy.addActionListener(this);
		btnLevelNameOutput.addActionListener(this);
		btnAllOutput.addActionListener(this);
		btnInsert.addActionListener(this);
		btnCTelUpdate.addActionListener(this);
		btnDelete.addActionListener(this);
		btnExit.addActionListener(this);
		
	}
	
	@Override
	public void actionPerformed(ActionEvent e) {
		if(e.getSource()==btncidSearch) {
			int cid; 
			try {
				cid = Integer.parseInt(txtcid.getText().trim());				
			}catch(Exception e2) {
				txtPool.setText("��ȿ�� �� ID�� �Է��Ͻ� �� �˻��ϼ���");
				txtctel.setText("");
				txtcname.setText("");
				txtcpoint.setText("");
				comjob.setSelectedItem("");
				
				return;
			}
			CustomerDto dto = cdao.cidGetCustomer(cid);
			if(dto!=null) {
//				txtcid.setText(String.valueOf(dto.getCid()));
				txtctel.setText(dto.getCtel());
				txtcname.setText(dto.getCname());
				txtcpoint.setText(String.valueOf(dto.getPoint()));
				txtcamount.setText("");
				comjob.setSelectedItem(dto.getLname());
				txtPool.setText("ID\t��ȭ\t\t�̸�\t����Ʈ\t���Ŵ�����\t������\t�������������߰����ž�\n");
				txtPool.append("\t\t--------------------------------------------------------------------------------------\n");
				txtPool.append(dto.toString());
			}else {
				txtPool.setText("�˻����� ���� ID�Դϴ�");
				txtctel.setText("");
				txtcname.setText("");
				txtcpoint.setText("");
				comjob.setSelectedItem("");
				
			}
			
		}else if(e.getSource()==btnctelSearch) {
			
			txtcid.setText("");
			txtcname.setText("");
			txtcpoint.setText("");
			txtcamount.setText("");
			comjob.setSelectedItem("");
			String ctel = txtctel.getText().trim();
			
			if(ctel.length()<4) {
				txtPool.setText("��� �� 4�ڸ� �̻��� �Է��ϼž� �˻��˴ϴ�");
				return;
			}
			ArrayList<CustomerDto> dtos = cdao.ctelGetCustomer(ctel);
			if(dtos.size()==0) {
				txtPool.setText("�ش� ��ȭ��ȣ�� ���� �˻����� �ʽ��ϴ�. ȸ���������ּ���");
				txtcid.setText("");
				txtctel.setText("");
				txtcname.setText("");
				txtcpoint.setText("");
				comjob.setSelectedItem("");
			}else if(dtos.size()==1) {
				txtcid.setText(String.valueOf(dtos.get(0).getCid()));
				txtcname.setText(dtos.get(0).getCname());
				txtcpoint.setText(String.valueOf(dtos.get(0).getPoint()));
				txtcamount.setText("");
				comjob.setSelectedItem(dtos.get(0).getLname());
				txtPool.setText("ID\t��ȭ\t\t�̸�\t����Ʈ\t���Ŵ�����\t������\t�������������߰����ž�\n");
				txtPool.append("\t\t--------------------------------------------------------------------------------------\n");
				for(CustomerDto d : dtos) {
					txtPool.append(d.toString());					
				}
			}else if(dtos.size()>1) {
				txtPool.setText("ID\t��ȭ\t\t�̸�\t����Ʈ\t���Ŵ�����\t������\t�������������߰����ž�\n");
				txtPool.append("\t\t--------------------------------------------------------------------------------------\n");
				for(CustomerDto a : dtos) {
					txtPool.append(a.toString());
				}
				
			}
			
		}else if(e.getSource()==btncnameSearch) {
			// cname �Է¶� �ܿ��� �⺻���� ������� ���� ���� 
			txtcid.setText("");
			txtctel.setText("");
			txtcpoint.setText("");
			txtcamount.setText("");
			comjob.setSelectedItem("");
			String cname = txtcname.getText().trim();
			if(cname.length()<2) {
				txtPool.setText("��� �̸��� 2���� �̻��� �Է��ϼž� �˻��˴ϴ�");
				return;
			}
			ArrayList<CustomerDto> customer = cdao.cnameGetCustomer(cname);
			if(customer.size()==0) {//���
				txtPool.setText("�ش� �̸��� ���� �˻����� �ʽ��ϴ�. ȸ������ �� �ּ���");
			}else if(customer.size()==1) {//1�����
				txtcid.setText(String.valueOf(customer.get(0).getCid()));
				txtctel.setText(customer.get(0).getCtel());
				txtcpoint.setText(String.valueOf(customer.get(0).getPoint()));
				comjob.setSelectedItem(customer.get(0).getLname());
				txtPool.setText("ID\t��ȭ\t\t�̸�\t����Ʈ\t���Ŵ�����\t������\t�������������߰����ž�\n");
				txtPool.append("\t\t--------------------------------------------------------------------------------------\n");
				for(CustomerDto c : customer) {
					txtPool.setText(c.toString());
				}
				
			}else if(customer.size()>1) {// ��������
				txtPool.setText("ID\t��ȭ\t\t�̸�\t����Ʈ\t���Ŵ�����\t������\t�������������߰����ž�\n");
				txtPool.append("\t\t--------------------------------------------------------------------------------------\n");
				for(CustomerDto a : customer) {
					txtPool.append(a.toString());
				}
			}
			
		}else if(e.getSource()==btnbuyWithPoint) {
			int cid, cpoint, camount;
			
			try {
				cid = Integer.parseInt(txtcid.getText().trim());
				cpoint = Integer.parseInt(txtcpoint.getText().trim());
				camount = Integer.parseInt(txtcamount.getText().trim());
				if(cpoint < camount) {
					txtPool.setText("����Ʈ�� �����Ͽ� ����Ʈ ���Ű� �Ұ��մϴ�");
					return;
				}
			}catch(Exception e1) {
				txtPool.setText("��ȿ�� �� ID�� POINT�� ���űݾ��� �Է��Ͻ��� �����ϼ���");
				return;
			}
			int result = cdao.buyWithPoint(cid, camount);
			if(result == CustomerDao.SUCCESS) {
				txtPool.setText("����Ʈ ���� ����");
//				txtcpoint.setText("500");
				txtcpoint.setText(String.valueOf(cpoint-camount));
				txtcamount.setText("");
			}else {
				txtPool.setText("�� ���̵� ��ȿ���� �ʽ��ϴ�. ���˻��� ������ �ּ���");
			}
			
		}else if(e.getSource()==btnBuy) {// ��ǰ����
			int cid, cpoint,camount;
			try {
				cid = Integer.parseInt(txtcid.getText().trim());
				cpoint = Integer.parseInt(txtcpoint.getText().trim());
				camount = Integer.parseInt(txtcamount.getText().trim());
			} catch (Exception e2) {
				txtPool.setText("��ȿ�� �� ID�� ���űݾ��� �Է��Ͻð� �����ϼ���");
				return;
			}
			int result = cdao.buy(cid, camount);
			if(result == CustomerDao.SUCCESS) {
				txtPool.setText("��ǰ ���� �Ϸ�");
				txtcpoint.setText(String.valueOf(cpoint+(int)(camount*0.05)));
				txtcamount.setText("");
			}else {
				txtPool.setText("�� ID�� ��ȿ���� �ʽ��ϴ�. �� �˻� �� �����ϼ���");
			}

		
		}else if(e.getSource()==btnLevelNameOutput) {
			// lname �Է� �޺��ڽ� �ܿ���  �⺻���� ������� ���� ���� 
						txtcid.setText("");
						txtctel.setText("");
						txtcname.setText("");
						txtcpoint.setText("");
						txtcamount.setText("");
						String lname = comjob.getSelectedItem().toString();
						if(lname.length()==0) {
							txtPool.setText("���ϴ� ����� �����Ͻð� �˻��ϼ���");
							return;
						}
						
						ArrayList<CustomerDto> customer = cdao.lnameGetCustomer(lname);
						if(customer.size()!=0) {//1�����
							txtPool.setText("ID\t��ȭ\t\t�̸�\t����Ʈ\t���Ŵ�����\t������\t�������������߰����ž�\n");
							txtPool.append("\t\t--------------------------------------------------------------------------------------\n");
							for(CustomerDto c : customer) {
								txtPool.append(c.toString());
							}
							txtPool.append("��" + customer.size() + "��");
						}else {// ��������
							txtPool.setText("�ش� ������ ���� ���� �˻����� �ʽ��ϴ�. ȸ������ ���ּ��� ");
						}
						
		}else if(e.getSource()==btnAllOutput) {
			txtcid.setText("");
			txtctel.setText("");
			txtcname.setText("");
			txtcpoint.setText("");
			txtcamount.setText("");
			comjob.setSelectedItem("");
			
			
			ArrayList<CustomerDto> customer = cdao.getCustomer();
			if(customer.size()!=0) {//1�����
				txtPool.setText("ID\t��ȭ\t\t�̸�\t����Ʈ\t���Ŵ�����\t������\t�������������߰����ž�\n");
				txtPool.append("\t\t--------------------------------------------------------------------------------------\n");
				for(CustomerDto c : customer) {
					txtPool.append(c.toString());
				}
				txtPool.append("��" + customer.size() + "��");
			}else {// ��������
				txtPool.setText("��ϵ� ���� �����ϴ�. ȸ������ ���ּ��� ");
			}
			
			
		}else if(e.getSource()==btnInsert) {
			txtcid.setText("");
			txtcpoint.setText("1000");
			txtcamount.setText("");
			comjob.setSelectedItem("NORMAL"); //�ʱⰪ���� �������ֱ�
	
			String ctel = txtctel.getText().trim();
			String cname = txtcname.getText().trim();
			if((ctel.length()<8 && ctel.indexOf('-')!=-1)||cname.length()<2) {
				txtPool.setText("��ȭ��ȣ�� 8�ڸ� �̻� �̸��� 2���� �̻� �Է��ϼ���");
				return;
			
			}
			int result = cdao.insertCustomer(ctel, cname);
			if(result==CustomerDao.SUCCESS) {
				txtPool.setText("ȸ������ �����մϴ�. ����Ʈ 1000���� ȸ�����Լ����� �帳�ϴ�");
			}
		
		}else if(e.getSource()==btnCTelUpdate) { //��ȣ���� 
//			String cidStr = txtcid.getText().trim();
//			String ctel = txtctel.getText().trim();
//			int cid = Integer.parseInt(cidStr);
			int cid; 
			String ctel;
			try {
				cid = Integer.parseInt(txtcid.getText().trim());
				ctel = txtctel.getText().trim();
				if(ctel.length()<8) {
					txtPool.setText("������ ��ȭ��ȣ�� Ȯ�����ּ���");
					return;
				}
			} catch (Exception e2) {
				txtPool.setText("��ȿ�� �� ID�� �˻��� �����ϼ���");
				return;
			}		
			int result = cdao.updateCustomer(cid, ctel);
			if(result==CustomerDao.SUCCESS) {
				txtPool.setText("��ȭ��ȣ�� �����Ǿ����ϴ�");
			}
			
			
		}else if(e.getSource()==btnDelete) {
			txtcid.setText("");
			txtcname.setText("");
			txtcpoint.setText("");
			txtcamount.setText("");
			comjob.setSelectedItem("");
			
			String ctel = txtctel.getText().trim();
				if(ctel.equals("")) {
					txtPool.setText("Ż���� ��ȭ��ȣ�� Ȯ�����ּ���");
					return;
				}
			int result = cdao.deleteCustomer(ctel);
			if(result == CustomerDao.SUCCESS) {
				txtPool.setText(ctel+"���� ȸ��Ż�� �Ϸ�Ǿ����ϴ�");
				txtctel.setText("");
			}else {
				txtPool.setText("��ϵ� ��ȭ��ȣ�� �ƴϿ��� Ż�� ���� �Ұ��մϴ�.");
			}
			
			
		}else if(e.getSource()==btnExit) {
			setVisible(false);
			dispose();
			System.exit(0);
		}
			

	}
	public static void main(String[] args) {
		new SuperMngGUI("���۸��� ����");
	}

}
