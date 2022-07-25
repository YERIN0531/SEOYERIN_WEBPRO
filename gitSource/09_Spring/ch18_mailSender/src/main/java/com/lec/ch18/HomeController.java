package com.lec.ch18;

import java.util.Locale;

import javax.mail.Message;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
@Controller
public class HomeController {

	@Autowired
	private JavaMailSender mailSender;
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		return "join";
	}
	@RequestMapping(value="textMail", method=RequestMethod.GET)
	public String textMail(String name, String email, Model model) {
		SimpleMailMessage message = new SimpleMailMessage();
		message.setFrom("tjqud531@gmail.com"); // 관리자 메일 주소(보내는 사람 메일) 
		message.setTo(email); // 받는 사람 메일 여기서 email은 아까 파라미터로 전달된 이메일
		message.setSubject("[TEXT 가입인사]" + name + "님 회원가입 감사합니다"); //메일제목 
		String content = name + "님 회원가입 감사합니다\n <h1>태그 안 먹음 </h1>";
		message.setText(content); // 메일 본문 내용
		
		mailSender.send(message);
		model.addAttribute("mailSendResult", "TEXT메일이 발송되었습니다");
		return "sendResult";
	}
	@RequestMapping(value="htmlMail", method= RequestMethod.GET)
	public String htmlMail(final String name, final String email, Model model) {
		// name에게 email 주소로 
		MimeMessagePreparator message = new MimeMessagePreparator() {
			String content="<div style=\"width:500px; margin: 0 auto; text-align: center\">\n" + 
					"	<h1 style=\"color:blue;\">"+name+"님 회원가입 감사합니다</h1>\n" + 
					"	<div>\n" + 
					"		<p>아무개 사이트에서만 쓰실 수 있는 감사쿠폰을 드립니다</p>\n" + 
					"		<p>\n" + 
					"		<img src=\"http://localhost:8090/ch18/resources/coupon.jpg\">\n" + 
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
				mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(email));// 받는 메일
				mimeMessage.setFrom(new InternetAddress("tjqud531@gmail.com")); // 보내는 메일 
				mimeMessage.setSubject("[HTML가입인사]" + name+ "님 회원가입 감사합니다");
				mimeMessage.setText(content, "utf-8", "html");
			}
		};
		mailSender.send(message);
		model.addAttribute("mailSendResult", "HTML메일이 발송되었습니다");
		return "sendResult";
	}
	
}



