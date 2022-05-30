package com.lec.ex21lastEx;
// 1. ���̵� �˻�    : CID,CTEL,CNAME,POINT,AMOUNT,LNAME,FORLEVELUP
// 2. �� 4�ڸ� �˻� : CID,CTEL,CNAME,POINT,AMOUNT,LNAME,FORLEVELUP
// 3. ���̸��˻�  : CID,CTEL,CNAME,POINT,AMOUNT,LNAME,FORLEVELUP
// 4. ����Ʈ�αݾ�  : CID,AMOUNT --dto �ȸ����
// 5. ��ǰ����	: CID,AMOUNT --dto �ȸ����
// 6. ��޺����	: CID,CTEL,CNAME,POINT,AMOUNT,LNAME,FORLEVELUP
// 7. ��ü���	: CID,CTEL,CNAME,POINT,AMOUNT,LNAME,FORLEVELUP
// 8. ȸ�������Է�  : CTEL,CNAME --dto �ȸ����
// 9. ��ȣ����	: CID, CTEL --dto �ȸ���� 
// 10.ȸ��Ż��	: CTEL
public class CustomerDto {
	
	//customer 
	private int cid;
	private String ctel;
	private String cname;
	private int point;
	private int amount;
	//cus_level 
	private String lname;
	private int forlevelup;
	
	//�˻�
	public CustomerDto(int cid, String ctel, String cname, int point, int amount, String lname, int forlevelup) {
		this.cid = cid;
		this.ctel = ctel;
		this.cname = cname;
		this.point = point;
		this.amount = amount;
		this.lname = lname;
		this.forlevelup = forlevelup;
	}
	@Override
	public String toString() {
		return cid+"\t"+ctel+"\t\t"+cname+"\t"+point+"\t"+amount+"\t"+lname+"\t"+forlevelup+"\n";
	}
	
	
	
	
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public String getCtel() {
		return ctel;
	}
	public void setCtel(String ctel) {
		this.ctel = ctel;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public String getLname() {
		return lname;
	}
	public void setLname(String lname) {
		this.lname = lname;
	}
	public int getForlevelup() {
		return forlevelup;
	}
	public void setForlevelup(int forlevelup) {
		this.forlevelup = forlevelup;
	}
		
	

}
