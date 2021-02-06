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
 * Servlet implementation class CustomerService_FAQ
 */
@WebServlet("/customerService_FAQ.do")
public class CustomerService_FAQ extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		// 0. 
		String id = request.getParameter("id");
		
		// 1.
		ICFMSService service = CFMSServiceImpl.getInstance();
		
		// 2. 
		CustomerVO resultCvo = service.userInfo(id);	
		
		// 3.
		request.setAttribute("userinfo", resultCvo);
		
		// 4. 
		request.getRequestDispatcher("board/sub_board_FAQ.jsp").forward(request, response);	
		
		// 5.
		//request.getRequestDispatcher("member/memberList.jsp(jsp������ �̸�)").forward(request, response);	�̰� ���ͷ� �����°�	

	}

	

}
