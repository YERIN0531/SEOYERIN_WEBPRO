package com.lec.ch19.service;

import javax.servlet.http.HttpSession;

import com.lec.ch19.dto.Member;

public interface MemberService {

//	public int idConfirm(String mid);
//	public int joinMember(Member member);
//	public Member getDetailMember(String mid);
//	public int modifyMember(Member member);
	
	public int idConfirm(String mid);
	
	//데이터 베이스에 저장하고, 회원가입 하는 건 Member member(dao)에서 구현. 
	//아이디 넘길라면 request에서 session 받아왔음. 하지만 여기선 request 객체가 파라미터가 안들어감
	//컨트롤러에서 request 객체 받아와서 여기서 뿌려줘도 되지만 , 처음부터 session을 받아와도 됨
	//따라서 service 매개변수에는 httpSession 담아주기 
	public int joinMember(Member member, HttpSession httpSession);
	
	//detail은 id만 주고, 이 멤버가 있니? 라고 할 것. 있으면 중복. 없으면 pw 받기 pw 가 틀리면 틀렸다 이런것 까지 detail에서 가능 
	//로그인 하는 로직(로그인 성공유무 뿌려주기 위해 return 타입 String으로 해주기)
	// mid와 mpw 받아서 적절하게 getdetail에 뿌려주기
	public String loginCheck(String mid, String mpw, HttpSession httpSession);
	
	public Member getDetailMember(String mid);//필요없을수도 있지만 일단 써 놓기 
	
	//modifyMember session 처리 해줘야됨 - 얘는 컨트롤러단에서 처리 
	// 여기다 session 처리해버리면 저장한 다음에 다시 넘어가고 좀 복잡 할 수 있음 
	public int modifyMember(Member member);
	
	
	
	
	
}
