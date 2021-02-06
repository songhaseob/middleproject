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

import kr.or.ddit.cfms.service.CFMSServiceImpl;
import kr.or.ddit.cfms.service.ICFMSService;
import kr.or.ddit.cfms.vo.CustomerVO;

@WebServlet("/FindPass")
public class FindPass extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("utf-8");
		
		String userMail = request.getParameter("mail");
		String userId = request.getParameter("id");
		
		ICFMSService service = CFMSServiceImpl.getInstance();
		
		CustomerVO vo = new CustomerVO();
		
		vo.setCus_id(userId);
		vo.setEmail(userMail);
		
		String resId = service.findPass(vo);
		
		request.setAttribute("resId", resId);
		//메일 시작
		if(resId!=null) {
		
			String a[] = { "06", "14", "22", "37", "49", "52", "69", "70", "48", "96" };
			String b[] = { "asbt", "bbre", "cbcq", "dafy", "eerx", "fbfv", "gqwf", "hsfa", "ipor", "jngn", "kvcc", "lgka", "gfmp", "nwei", "obvk", "pqwm", "qzmn", "rdfb", "sjhc",
					"ttrq", "uwer", "vnhx", "wsdb", "xhtf", "ywej", "zhga" };
			String c[] = { "ABBU", "BEBC", "CBRB", "DQWE", "EJHd", "FKJv", "GVCr", "HEWQ", "ISHB", "JYUb", "KMQu", "L3D4", "MNG7", "NASg", "OFG2", "P12f", "QFGq", "RHGd", "SMDv",
					"TQ2h", "UR3t", "VY5m", "WU6p", "XI7f", "gS4Y", "ZNGs" };
			String d[] = { "0", "1", "2", "3", "4", "5", "6", "7", "8", "9" };
			
			String Brandom1 = (a[new Random().nextInt(a.length)]);
			String Brandom2 = (b[new Random().nextInt(a.length)]);
			String Brandom3 = (c[new Random().nextInt(a.length)]);
			String Brandom4 = (d[new Random().nextInt(a.length)]);
			
			String code = Brandom1+Brandom2+Brandom3+Brandom4;

			String host = "smtp.naver.com";
			final String user = "dltnn95ngns0@naver.com";
			final String password = "gnstndl13545";

			String to = userMail;

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
				message.setSubject("Gifti-Lijo 임시비밀번호입니다.");

				// 내용
				message.setText("임시비밀번호는 " + code + " 입니다");

				Transport.send(message);

			} catch (MessagingException e) {
				e.printStackTrace();
			}	
			
			vo.setPass(code);
			service.upPass(vo);
			
		} 
		
		request.getRequestDispatcher("jsp/findPass.jsp").forward(request, response);
		
		
	}

}
