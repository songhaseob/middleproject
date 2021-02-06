package kr.or.ddit.cfms.contoller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Random;

import org.json.simple.JSONObject;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@WebServlet("/Sms")
public class Sms extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String api_key = "NCSO84P8OV8CL2LC";
		String api_secret = "0EVDBPVNWPT5K4S8FKIWXEYDK0VSXFD8";
		Message coolsms = new Message(api_key, api_secret);

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
		
		String num = Brandom1+Brandom2+Brandom3+Brandom4;

		String tel = request.getParameter("tel");
		String telcode = request.getParameter("telcode");

		request.setAttribute("num", num);
		request.setAttribute("telcode", telcode);

		System.out.println(tel);
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("to", tel); // 수신전화번호
		params.put("from", "01029937927"); // 발신전화번호.
		params.put("type", "SMS");
		params.put("text", "인증코드 : " + num +" 입니다");
		params.put("app_version", "test app 1.2"); // application name and version

		try {
			JSONObject obj = (JSONObject) coolsms.send(params);
			System.out.println(obj.toString());
		} catch (CoolsmsException e) {
			System.out.println(e.getMessage());
			System.out.println(e.getCode());
		}

		request.getRequestDispatcher("jsp/Sms.jsp").forward(request, response);

	}

}
