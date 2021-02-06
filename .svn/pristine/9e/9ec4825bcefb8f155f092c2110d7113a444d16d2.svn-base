package kr.or.ddit.cfms.contoller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.cfms.service.CustomerServiceImpl;
import kr.or.ddit.cfms.service.ICustomerService;
import kr.or.ddit.cfms.vo.CustomerVO;

@WebServlet("/Customerupdatecnt.do")
public class Customerupdatecnt extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		ICustomerService service = CustomerServiceImpl.getInstance();
		
		CustomerVO vo = new CustomerVO();
		
		int reportcnt = 0;
		
		vo.setReport_cnt(reportcnt);
		
		
		
	}

}
