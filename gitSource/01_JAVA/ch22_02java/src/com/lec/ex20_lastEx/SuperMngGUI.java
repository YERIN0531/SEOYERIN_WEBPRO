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
	
	//화면구현 
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
		setDefaultCloseOperation(EXIT_ON_CLOSE);//x버튼 누르면 나가는 아이 
		container = getContentPane(); //컨테이너 불러오는애
		container.setLayout(new FlowLayout()); //컨테이너 기본 레이아웃은 border(위아래센터 지정해줘야 하는 것 )
	
		jpup = new JPanel(new GridLayout(6,3));
		jpbtn = new JPanel();
		
		txtcid     = new JTextField(20);
		txtctel    = new JTextField(20);
		txtcname   = new JTextField(20);
		txtcpoint  = new JTextField(20);
		txtcamount = new JTextField(20);
		
		lname = cdao.getLevelName();
		comjob = new JComboBox<String>(lname);
		
		btncidSearch    	= new JButton("아이디검색");
		btnctelSearch   	= new JButton("폰4자리(FULL)검색");
		btncnameSearch  	= new JButton("고객 이름 검색");
		btnbuyWithPoint 	= new JButton("포인트로만 구매");
		
		btnBuy 				= new JButton("물품구매");
		btnLevelNameOutput  = new JButton("등급별출력");
		btnAllOutput 		= new JButton("전체출력");
		btnInsert 			= new JButton("회원가입");
		btnCTelUpdate 		= new JButton("번호수정");
		btnDelete 			= new JButton("회원탈퇴");
		btnExit 			= new JButton("나가기");
			
		txtPool				= new JTextArea(6,70);
		scrollPane			= new JScrollPane(txtPool);
	
		jpup.add(new JLabel("아이디",(int)CENTER_ALIGNMENT));
		jpup.add(txtcid);
		jpup.add(btncidSearch);
		
		jpup.add(new JLabel("고객전화",(int)CENTER_ALIGNMENT));
		jpup.add(txtctel);
		jpup.add(btnctelSearch);
		
		jpup.add(new JLabel("고객이름",(int)CENTER_ALIGNMENT));
		jpup.add(txtcname);
		jpup.add(btncnameSearch);
		
		jpup.add(new JLabel("포인트",(int)CENTER_ALIGNMENT));
		jpup.add(txtcpoint);
		jpup.add(btnbuyWithPoint);
		
		jpup.add(new JLabel("구매금액",(int)CENTER_ALIGNMENT));
		jpup.add(txtcamount);
		jpup.add(new JLabel()); // 5행 3열 
		
		jpup.add(new JLabel("고객등급",(int)CENTER_ALIGNMENT));
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
				txtPool.setText("유효한 고객 ID를 입력하신 후 검색하세요");
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
				txtPool.setText("ID\t전화\t\t이름\t포인트\t구매누적액\t고객레벨\t레벨업을위한추가구매액\n");
				txtPool.append("\t\t--------------------------------------------------------------------------------------\n");
				txtPool.append(dto.toString());
			}else {
				txtPool.setText("검색되지 않은 ID입니다");
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
				txtPool.setText("적어도 폰 4자리 이상은 입력하셔야 검색됩니다");
				return;
			}
			ArrayList<CustomerDto> dtos = cdao.ctelGetCustomer(ctel);
			if(dtos.size()==0) {
				txtPool.setText("해당 전화번호의 고객이 검색되지 않습니다. 회원가입해주세요");
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
				txtPool.setText("ID\t전화\t\t이름\t포인트\t구매누적액\t고객레벨\t레벨업을위한추가구매액\n");
				txtPool.append("\t\t--------------------------------------------------------------------------------------\n");
				for(CustomerDto d : dtos) {
					txtPool.append(d.toString());					
				}
			}else if(dtos.size()>1) {
				txtPool.setText("ID\t전화\t\t이름\t포인트\t구매누적액\t고객레벨\t레벨업을위한추가구매액\n");
				txtPool.append("\t\t--------------------------------------------------------------------------------------\n");
				for(CustomerDto a : dtos) {
					txtPool.append(a.toString());
				}
				
			}
			
		}else if(e.getSource()==btncnameSearch) {
			// cname 입력란 외에는 기본으로 비워놓고 로직 수행 
			txtcid.setText("");
			txtctel.setText("");
			txtcpoint.setText("");
			txtcamount.setText("");
			comjob.setSelectedItem("");
			String cname = txtcname.getText().trim();
			if(cname.length()<2) {
				txtPool.setText("적어도 이름은 2글자 이상은 입력하셔야 검색됩니다");
				return;
			}
			ArrayList<CustomerDto> customer = cdao.cnameGetCustomer(cname);
			if(customer.size()==0) {//출력
				txtPool.setText("해당 이름의 고객이 검색되지 않습니다. 회원가입 해 주세요");
			}else if(customer.size()==1) {//1명출력
				txtcid.setText(String.valueOf(customer.get(0).getCid()));
				txtctel.setText(customer.get(0).getCtel());
				txtcpoint.setText(String.valueOf(customer.get(0).getPoint()));
				comjob.setSelectedItem(customer.get(0).getLname());
				txtPool.setText("ID\t전화\t\t이름\t포인트\t구매누적액\t고객레벨\t레벨업을위한추가구매액\n");
				txtPool.append("\t\t--------------------------------------------------------------------------------------\n");
				for(CustomerDto c : customer) {
					txtPool.setText(c.toString());
				}
				
			}else if(customer.size()>1) {// 동명이인
				txtPool.setText("ID\t전화\t\t이름\t포인트\t구매누적액\t고객레벨\t레벨업을위한추가구매액\n");
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
					txtPool.setText("포인트가 부족하여 포인트 구매가 불가합니다");
					return;
				}
			}catch(Exception e1) {
				txtPool.setText("유효한 고객 ID와 POINT와 구매금액을 입력하신후 구매하세요");
				return;
			}
			int result = cdao.buyWithPoint(cid, camount);
			if(result == CustomerDao.SUCCESS) {
				txtPool.setText("포인트 구매 성공");
//				txtcpoint.setText("500");
				txtcpoint.setText(String.valueOf(cpoint-camount));
				txtcamount.setText("");
			}else {
				txtPool.setText("고객 아이디가 유효하지 않습니다. 고객검색후 구매해 주세요");
			}
			
		}else if(e.getSource()==btnBuy) {// 물품구매
			int cid, cpoint,camount;
			try {
				cid = Integer.parseInt(txtcid.getText().trim());
				cpoint = Integer.parseInt(txtcpoint.getText().trim());
				camount = Integer.parseInt(txtcamount.getText().trim());
			} catch (Exception e2) {
				txtPool.setText("유효한 고객 ID와 구매금액을 입력하시고 구매하세요");
				return;
			}
			int result = cdao.buy(cid, camount);
			if(result == CustomerDao.SUCCESS) {
				txtPool.setText("물품 구매 완료");
				txtcpoint.setText(String.valueOf(cpoint+(int)(camount*0.05)));
				txtcamount.setText("");
			}else {
				txtPool.setText("고객 ID가 유효하지 않습니다. 고객 검색 후 구매하세요");
			}

		
		}else if(e.getSource()==btnLevelNameOutput) {
			// lname 입력 콤보박스 외에는  기본으로 비워놓고 로직 수행 
						txtcid.setText("");
						txtctel.setText("");
						txtcname.setText("");
						txtcpoint.setText("");
						txtcamount.setText("");
						String lname = comjob.getSelectedItem().toString();
						if(lname.length()==0) {
							txtPool.setText("원하는 등급을 선택하시고 검색하세요");
							return;
						}
						
						ArrayList<CustomerDto> customer = cdao.lnameGetCustomer(lname);
						if(customer.size()!=0) {//1명출력
							txtPool.setText("ID\t전화\t\t이름\t포인트\t구매누적액\t고객레벨\t레벨업을위한추가구매액\n");
							txtPool.append("\t\t--------------------------------------------------------------------------------------\n");
							for(CustomerDto c : customer) {
								txtPool.append(c.toString());
							}
							txtPool.append("총" + customer.size() + "명");
						}else {// 동명이인
							txtPool.setText("해당 레벨의 고객의 고객이 검색되지 않습니다. 회원가입 해주세요 ");
						}
						
		}else if(e.getSource()==btnAllOutput) {
			txtcid.setText("");
			txtctel.setText("");
			txtcname.setText("");
			txtcpoint.setText("");
			txtcamount.setText("");
			comjob.setSelectedItem("");
			
			
			ArrayList<CustomerDto> customer = cdao.getCustomer();
			if(customer.size()!=0) {//1명출력
				txtPool.setText("ID\t전화\t\t이름\t포인트\t구매누적액\t고객레벨\t레벨업을위한추가구매액\n");
				txtPool.append("\t\t--------------------------------------------------------------------------------------\n");
				for(CustomerDto c : customer) {
					txtPool.append(c.toString());
				}
				txtPool.append("총" + customer.size() + "명");
			}else {// 동명이인
				txtPool.setText("등록된 고객이 없습니다. 회원가입 해주세요 ");
			}
			
			
		}else if(e.getSource()==btnInsert) {
			txtcid.setText("");
			txtcpoint.setText("1000");
			txtcamount.setText("");
			comjob.setSelectedItem("NORMAL"); //초기값에서 설정해주기
	
			String ctel = txtctel.getText().trim();
			String cname = txtcname.getText().trim();
			if((ctel.length()<8 && ctel.indexOf('-')!=-1)||cname.length()<2) {
				txtPool.setText("전화번호는 8자리 이상 이름은 2글자 이상 입력하세요");
				return;
			
			}
			int result = cdao.insertCustomer(ctel, cname);
			if(result==CustomerDao.SUCCESS) {
				txtPool.setText("회원가입 감사합니다. 포인트 1000점을 회원가입선물로 드립니다");
			}
		
		}else if(e.getSource()==btnCTelUpdate) { //번호수정 
//			String cidStr = txtcid.getText().trim();
//			String ctel = txtctel.getText().trim();
//			int cid = Integer.parseInt(cidStr);
			int cid; 
			String ctel;
			try {
				cid = Integer.parseInt(txtcid.getText().trim());
				ctel = txtctel.getText().trim();
				if(ctel.length()<8) {
					txtPool.setText("변경할 전화번호를 확인해주세요");
					return;
				}
			} catch (Exception e2) {
				txtPool.setText("유효한 고객 ID로 검색후 수정하세요");
				return;
			}		
			int result = cdao.updateCustomer(cid, ctel);
			if(result==CustomerDao.SUCCESS) {
				txtPool.setText("전화번호가 수정되었습니다");
			}
			
			
		}else if(e.getSource()==btnDelete) {
			txtcid.setText("");
			txtcname.setText("");
			txtcpoint.setText("");
			txtcamount.setText("");
			comjob.setSelectedItem("");
			
			String ctel = txtctel.getText().trim();
				if(ctel.equals("")) {
					txtPool.setText("탈퇴할 전화번호를 확인해주세요");
					return;
				}
			int result = cdao.deleteCustomer(ctel);
			if(result == CustomerDao.SUCCESS) {
				txtPool.setText(ctel+"님의 회원탈퇴가 완료되었습니다");
				txtctel.setText("");
			}else {
				txtPool.setText("등록된 전화번호가 아니여서 탈퇴 진행 불가합니다.");
			}
			
			
		}else if(e.getSource()==btnExit) {
			setVisible(false);
			dispose();
			System.exit(0);
		}
			

	}
	public static void main(String[] args) {
		new SuperMngGUI("슈퍼마켓 관리");
	}

}
