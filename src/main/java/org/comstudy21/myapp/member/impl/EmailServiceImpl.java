package org.comstudy21.myapp.member.impl;

import java.util.Properties;
import java.util.Random;

import javax.annotation.Resource;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.comstudy21.myapp.member.EmailService;
import org.comstudy21.myapp.member.MemberService;
import org.comstudy21.myapp.member.MemberVO;
import org.springframework.stereotype.Service;

@Service("emailService")
public class EmailServiceImpl implements EmailService {
	@Resource
	MemberService memberService;

	public void sendEmail(String sendGb, String email, String var) {

		String title = "";
		String msg = "";
		String var2 = "";
		String id = var;

		if (sendGb.equals("1")) {// 아이디찾기
			title = "DogVar 에서 귀하의 아이디를 송신하였습니다.";
			var2 = "아이디";
			msg += "귀하의 " + var2 + "는 </div> <div><H1>" + var + "</H1> 입니다.";

		} else {// 비번찾기
			var2 = "변경된 비밀번호";
			title = "Dogvar 에서 귀하의 초기화된 비밀번호를 송신하였습니다.";

			// 비번찾기를 위한 난수생성
			var = getRandomPassword(8);

			MemberVO vo = new MemberVO();
			vo.setId(id);
			vo.setPassword(var);
			msg += "귀하의 " + var2 + "는 " + var + "입니다.";
			memberService.updateMemberPwd(vo);
		}

		String host = "smtp.naver.com";
		final String user = "chang71892@naver.com";
		final String password = "jg92fl18wjdvlf";

		Properties props = new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", 465);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.ssl.trust", host);

		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, password);
			}
		});

		try {
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(user));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress("chang71892@naver.com"));
			message.setSubject(title);
			message.setText(msg);
			Transport.send(message);
			System.out.println("비밀번호 찾기 메일이 전송되었습니다");
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}

	public static String getRandomPassword(int length) {
		char[] charaters = { 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r',
				's', 't', 'u', 'v', 'w', 'x', 'y', 'z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9' };
		StringBuilder sb = new StringBuilder("");
		Random rn = new Random();
		for (int i = 0; i < length; i++) {
			sb.append(charaters[rn.nextInt(charaters.length)]);
		}
		return sb.toString();
	}
}