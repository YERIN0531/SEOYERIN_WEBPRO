package com.lec.ex21lastEx;
// 1. 아이디 검색    : CID,CTEL,CNAME,POINT,AMOUNT,LNAME,FORLEVELUP
// 2. 폰 4자리 검색 : CID,CTEL,CNAME,POINT,AMOUNT,LNAME,FORLEVELUP
// 3. 고객이름검색  : CID,CTEL,CNAME,POINT,AMOUNT,LNAME,FORLEVELUP
// 4. 포인트로금액  : CID,AMOUNT --dto 안만들거
// 5. 물품구매	: CID,AMOUNT --dto 안만들거
// 6. 등급별출력	: CID,CTEL,CNAME,POINT,AMOUNT,LNAME,FORLEVELUP
// 7. 전체출력	: CID,CTEL,CNAME,POINT,AMOUNT,LNAME,FORLEVELUP
// 8. 회원가입입력  : CTEL,CNAME --dto 안만들거
// 9. 번호수정	: CID, CTEL --dto 안만들거 
// 10.회원탈퇴	: CTEL
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
	
	//검색
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
