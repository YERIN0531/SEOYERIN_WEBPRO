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

	//화면에 들어갈 컴포넌트
	private Container 	container;
	private JPanel	  	jpup, jpdown;
	
	private JTextField  txtPhone,txtName,txtPoint;
	private JButton	    btnJoin,btnSearch,btnOutput,btnExit;
	private JTextArea   jta;
	private JScrollPane scrollpane;
	
	//DB관련 변수 
	private CustomerDao dao = CustomerDao.getInstance();
	private ArrayList<CustomerDto> customer;
	
	public CustomerMng(String title) {
		super(title);
		setDefaultCloseOperation(EXIT_ON_CLOSE);// 엑스누르면 나가는 버튼 
		container = getContentPane();
		container.setLayout(new FlowLayout());
		
		jpup     = new JPanel(new GridLayout(3,2));
		jpdown   = new JPanel();
		txtPhone = new JTextField(15);
		txtName  = new JTextField(15);
		txtPoint = new JTextField(15);
		
		btnJoin   = new JButton("가입");
		btnSearch = new JButton("폰조회");
		btnOutput = new JButton("출력");
		btnExit   = new JButton("종료");
		
		//---------------------------------------------------버튼길이 조정 
//		btnJoin.setPreferredSize(new Dimension(100,30));
//		btnSearch.setPreferredSize(new Dimension(100,30));
//		btnOutput.setPreferredSize(new Dimension(100,30));
//		btnExit.setPreferredSize(new Dimension(100,30));
		
		jta = new JTextArea(15,30);
		scrollpane = new JScrollPane(jta);
		
		jpup.add(new JLabel("폰번호",(int)CENTER_ALIGNMENT));
		jpup.add(txtPhone);
		jpup.add(new JLabel("이  름",(int)CENTER_ALIGNMENT));
		jpup.add(txtName);
		jpup.add(new JLabel("포인트",(int)CENTER_ALIGNMENT));
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
		if(e.getSource()==btnJoin) { //회원가입로직 	
			String ctel = txtPhone.getText().trim();
			String cname = txtName.getText().trim();
			if(cname.length()<2 || ctel.length()<8) {
				jta.setText("이름은 두글자 이상 , 전화번호는 8자리 이상으로 작성해주세요");
				return;
			}
			
			int result = dao.insertCustomer(ctel, cname);
			if(result==CustomerDao.SUCCESS) {
				jta.setText(cname +" 님 회원가입을 축하드립니다");
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
				jta.setText("올바른 전화번호 형식을 입력해 주세요(뒷자리||모든자리)");
				return;
			}
			ArrayList<CustomerDto> dtos = dao.ctelGetCustomer(ctel);
			if(dtos.size()==0) {// 아무도 없을때 
				jta.setText("해당번호의 회원이 존재하지 않습니다 회원가입을 해주세요");
			}else if(dtos.size()==1) { // 한명일때 
				txtPhone.setText(dtos.get(0).getCtel());
				txtName.setText(dtos.get(0).getCname());
				txtPoint.setText(String.valueOf(dtos.get(0).getPoint()));
				jta.setText("");
			} else if (dtos.size()>=1) {
				jta.append("회원번호\t전화번호\t이름\t포인트\n");
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
				jta.append("회원번호\t전화번호\t이름\t포인트\n");
				for(CustomerDto d : dtos) {
					jta.append(d.toString());
				}
			}else {
				jta.setText("등록된 회원이 존재하지 않습니다");
			}
	
			
		}else if(e.getSource()==btnExit) {
			setVisible(false);
			dispose();
			System.exit(0);
		}
		
		
		
		
		

	}
	public static void main(String[] args) {
		new CustomerMng("회원관리");
	}

}
