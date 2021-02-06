package kr.or.ddit.cfms.contoller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.cfms.service.CustomerServiceImpl;

import kr.or.ddit.cfms.service.ICustomerService;

@WebServlet("/CustomerOut.do")
public class CustomerOut extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String cusid = request.getParameter("id");
		
		ICustomerService service = CustomerServiceImpl.getInstance();
		
		int cnt = service.deleteCus(cusid);
		
		request.setAttribute("result", cnt);
		
		request.getRequestDispatcher("jsp/result.jsp").forward(request, response);
		
		
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String cusid = request.getParameter("id");
		
		ICustomerService service = CustomerServiceImpl.getInstance();
		
		int cnt = service.deleteCus(cusid);
		
		request.setAttribute("result", cnt);
		
		request.getRequestDispatcher("jsp/result.jsp").forward(request, response);
		
	}

}
