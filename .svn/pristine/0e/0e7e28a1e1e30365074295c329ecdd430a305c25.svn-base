package kr.or.ddit.cfms.contoller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.cfms.service.CFMSServiceImpl;
import kr.or.ddit.cfms.service.ICFMSService;
import kr.or.ddit.cfms.vo.CustomerVO;

@WebServlet("/FindId")
public class FindId extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("utf-8");
		
		String userMail = request.getParameter("mail");
		System.out.println(userMail);
		ICFMSService service = CFMSServiceImpl.getInstance();
		
		String resId = service.findId(userMail);
		
		request.setAttribute("resId", resId);
		System.out.println(resId);
		request.getRequestDispatcher("jsp/finId.jsp").forward(request, response);

	}

}
