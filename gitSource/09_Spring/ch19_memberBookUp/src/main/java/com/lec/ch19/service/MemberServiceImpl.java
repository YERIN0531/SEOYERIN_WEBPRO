package com.lec.ch19.service;
import javax.mail.Message;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Service;

import com.lec.ch19.dao.MemberDao;
import com.lec.ch19.dto.Member;
@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDao memberDao;
	@Autowired
	//join할때 메일 보내기 필요하기 때문에 mailSender 빈도 가지고와주기 
	private JavaMailSenderImpl mailSender;
	
	
	@Override
	public int idConfirm(String mid) {
		return memberDao.idConfirm(mid);
	}

	@Override
	public int joinMember(final Member member, HttpSession httpSession) {
		// member.getMname()에게 메일보내기, member insert하기, session에 mid attribute 추가하기
		// 메일보내기
		MimeMessagePreparator message = new MimeMessagePreparator() {
			String content="<div style=\"width:500px; margin: 0 auto; text-align: center\">\n" + 
					"	<h1 style=\"color:blue;\">"+member.getMname()+"님 회원가입 감사합니다</h1>\n" + 
					"	<div>\n" + 
					"		<p>아무개 사이트에서만 쓰실 수 있는 감사쿠폰을 드립니다</p>\n" + 
					"		<p>\n" + 
					"		<img src=\"http://localhost:8090/ch19/img/coupon.jpg\">\n" + 
					"		</p>\n" + 
					"	</div>\n" + 
					"	<div>\n" + 
					"		<p style=\"color:red;\">빨간 글씨 부분</p>\n" + 
					"		<p style=\"color:blue;\">파랑 글씨 부분</p>\n" + 
					"		<img src=\"https://t1.daumcdn.net/daumtop_chanel/op/20200723055344399.png\">\n" + 
					"	</div>\n" + 
					"	<p>서울시 어떤구 XX로 00 **빌딩 402</p>\n" + 
					"</div>";
			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				mimeMessage.setRecipient(Message.RecipientType.TO,
										 new InternetAddress(member.getMmail()));//받는 메일
				mimeMessage.setFrom(new InternetAddress("tjqud531@gmail.com"));  //보내는 메일
				mimeMessage.setSubject(member.getMname()+"님 회원가입 감사합니다(쿠폰동봉)");
				mimeMessage.setText(content, "utf-8", "html");
			}
		};
		mailSender.send(message); //메일발송
		httpSession.setAttribute("mid", member.getMid()); //세션에 mid 속성 추가
		return memberDao.joinMember(member); //member insert 
		// 회원가입에 실패했을 경우 controller에 if 추가하는 방법 , mybatis 상위버전을 씀으로써 try-catch해주기 , dao먼저 받고, 그 결과값이 0이면 뭐해라 이런식으로 해주기
	}

	@Override
	public String loginCheck(String mid, String mpw, HttpSession httpSession) {
		String result = "로그인 성공";
		Member member = memberDao.getDetailMember(mid);
		if(member == null) {
			result = "유효하지 않은 아이디입니다";
		}else if(!mpw.equals(member.getMpw())) {
			result = "비밀번호가 맞지 않습니다";
		}else {
			//로그인 성공 
			httpSession.setAttribute("member", member);
			httpSession.setAttribute("mid", mid);
		}
		return result;
	}

	@Override
	public Member getDetailMember(String mid) {
		return memberDao.getDetailMember(mid);
	}

	@Override
	public int modifyMember(Member member) {
		return memberDao.modifyMember(member);
	}
}
