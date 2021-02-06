package kr.or.ddit.cfms.contoller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.cfms.service.CustomerServiceImpl;
import kr.or.ddit.cfms.service.ICustomerService;
import kr.or.ddit.cfms.vo.CustomerVO;

@WebServlet("/adminUserInfo.do")
public class AdminUserInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ICustomerService cusService = CustomerServiceImpl.getInstance();
		List<CustomerVO> allCustomer = cusService.getAllCus();
		request.setAttribute("allcustomer", allCustomer);
		request.getRequestDispatcher("board/admin.jsp").forward(request, response);
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
