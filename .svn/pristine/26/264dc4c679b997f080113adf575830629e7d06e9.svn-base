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

/**
 * Servlet implementation class FindPass2
 */
@WebServlet("/FindPass2")
public class FindPass2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("utf-8");
		
		String userHint1 = request.getParameter("hint");
		String userHint2 = request.getParameter("hint2");
		String userId = request.getParameter("id");
		
		
		ICFMSService service = CFMSServiceImpl.getInstance();
		
		CustomerVO vo = new CustomerVO();
		

		vo.setCus_id(userId);
		vo.setPass_hint(userHint1);
		vo.setAnswer(userHint2);
		
		
		
		String resId = service.findPass2(vo);
		
		request.setAttribute("resId", resId);
		
		request.getRequestDispatcher("jsp/findPass2.jsp").forward(request, response);
	}

}
