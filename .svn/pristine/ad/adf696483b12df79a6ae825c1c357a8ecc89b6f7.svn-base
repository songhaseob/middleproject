package kr.or.ddit.cfms.contoller;

import java.io.IOException;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Mail")
public class Mail extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String mail = request.getParameter("mail");
		String mailcode = request.getParameter("mailcode");
		String a[] = { "0", "1", "2", "3", "4", "5", "6", "7", "8", "9" };
		String b[] = { "as", "bb", "cq", "dy", "ex", "fv", "gf", "ha", "ir", "jn", "kc", "lg", "mp", "ni", "ok", "pm", "qn", "rb", "sc",
				"tq", "ur", "vx", "wb", "xf", "yj", "za" };
		String c[] = { "AU", "BC", "CB", "DE", "Ed", "Fv", "Gr", "HQ", "IB", "Jb", "Ku", "L4", "M7", "Ng", "O2", "Pf", "Qq", "Rd", "Sv",
				"Th", "Ut", "Vm", "Wp", "Xf", "gY", "Zs" };
		String d[] = { "0", "1", "2", "3", "4", "5", "6", "7", "8", "9" };
		
		String Brandom1 = (a[new Random().nextInt(a.length)]);
		String Brandom2 = (b[new Random().nextInt(a.length)]);
		String Brandom3 = (c[new Random().nextInt(a.length)]);
		String Brandom4 = (d[new Random().nextInt(a.length)]);
		
		String code = Brandom1+Brandom2+Brandom3+Brandom4;

		request.setAttribute("code", code);
		request.setAttribute("mailcode", mailcode);

		String host = "smtp.naver.com";
		final String user = "dltnn95ngns0@naver.com";
		final String password = "gnstndl13545";

		String to = mail;

		Properties props = new Properties();

		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", "587");

		props.put("mail.smtp.auth", "true");

		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, password);
			}
		});

		try {

			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(user));

			message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

			// 제목
			message.setSubject("Gifti-Lijo 회원가입 이메일 인증");

			// 내용
			message.setText("인증번호는 " + code + " 입니다");

			Transport.send(message);

		} catch (MessagingException e) {
			e.printStackTrace();
		}

		request.getRequestDispatcher("jsp/Mail.jsp").forward(request, response);
	}

}
