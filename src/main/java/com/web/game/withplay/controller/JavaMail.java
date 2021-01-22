package com.web.game.withplay.controller;

import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;


import com.web.game.member.model.MemberBean;
import com.web.game.withplay.model.WithPlay;

public class JavaMail {
	private String userName = "xicnen@gmail.com";
	private String password = "stveoixqpqvbzcqh";
	private String customer = "" ;
	private String subject = "親愛的GameBar會員訂單通知";
//	private String PasswordSet = "http://localhost:8080/GameWebSpringMVC/src/main/webapp/WEB-INF/views/member/MemberPasswordSet";
//	private Integer No = null ;  
//	private String txt = "請點選下面網址更改密碼<br><a href=\"" + "http://localhost:8080/GameWebSpringMVC/member/forget/PasswordSet?"+No + "\">點擊我</a>";
	private String txt = "";

	 @SuppressWarnings("static-access")
	 public void SendMail(Integer total,String sGame,WithPlay wp,MemberBean mb) {
		System.out.println("傳進來的iNo=");
		txt="<h3 style='font-size:40px;'>"+"親愛的"+mb.getsEname()+"</h3><br><div style='font-size:32px;'>您在陪玩師<span style='font-weight:bold;color:#FA006E;'>"+wp.getsNickname()+"</span>下訂"+sGame+"陪玩已成功花費總金額<span style='font-weight:bold;color:#FA006E;'>$"+total+"</span><br>感您的支持。</div>";
		customer = mb.getsEmail();
		Properties prop = new Properties();
		prop.setProperty("mail.transport.protocol", "smtp");

		// Host:smtp.gmail.com
		prop.setProperty("mail.host", "smtp.gmail.com");

		// host port 465
		prop.put("mail.smtp.port", "465");

//		寄件者帳號需要驗證需要安全資料傳輸層 (SSL)：是
		prop.put("mail.smtp.auth", "true");

//		需要傳輸層安全性 (TLS)：是 (如果可用)
		prop.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");

//		安全資料傳輸層 (SSL) 通訊埠：465
		prop.put("mail.smtp.socketFactory.port", "465");

		prop.put("mail.debug", "true");

		// 透過類別
//		Session session = Session.getDefaultInstance(prop, new Authenticator() {
//
//			@Override
//			protected PasswordAuthentication getPasswordAuthentication() {
//				return new PasswordAuthentication(userName, password);
//			}
//			
//			
//		});

		// 一般Class
		Auth auth = new Auth(userName, password);
		Session session = Session.getDefaultInstance(prop, auth);

		MimeMessage message = new MimeMessage(session);

		try {
			// 寄件者
//				message.setSender(new InternetAddress(userName));

			InternetAddress sender = new InternetAddress(userName);
			message.setSender(sender);

			// 收件者
			message.setRecipient(RecipientType.TO, new InternetAddress(customer));
			// 標題
			message.setSubject(subject);
			// 內容
			message.setContent(txt, "text/html;charset=utf-8");

			Transport transport = session.getTransport();
			System.out.println("txt="+txt);
			transport.send(message);
			System.out.println("成功寄出");
			transport.close();

		} catch (AddressException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();
		}

	}

	class Auth extends Authenticator {

		private String userName;
		private String password;

		public Auth(String userName, String password) {
			this.userName = userName;
			this.password = password;

		}

		@Override
		protected PasswordAuthentication getPasswordAuthentication() {
			PasswordAuthentication pa = new PasswordAuthentication(userName, password);
			return pa;
		}

	}

	
}
