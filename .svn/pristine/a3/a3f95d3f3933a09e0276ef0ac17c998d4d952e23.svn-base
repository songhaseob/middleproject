package kr.or.ddit.cfms.contoller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.cfms.service.BuyServiceImpl;
import kr.or.ddit.cfms.service.CFMSServiceImpl;
import kr.or.ddit.cfms.service.CustomerServiceImpl;
import kr.or.ddit.cfms.service.IBuyService;
import kr.or.ddit.cfms.service.ICFMSService;
import kr.or.ddit.cfms.service.ICustomerService;
import kr.or.ddit.cfms.vo.BuyVO;
import kr.or.ddit.cfms.vo.CustomerVO;
import kr.or.ddit.cfms.vo.ProductVO;

@WebServlet("/Customerlist.do")
public class Customerlist extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		ICustomerService service = CustomerServiceImpl.getInstance();
		// customer 정보 뽑아오는 리스트
		List<CustomerVO> list = service.getAllCus();
		
		// 회원리스트
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("board/admin.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		ICustomerService service = CustomerServiceImpl.getInstance();
		
		List<CustomerVO> list = service.getAllCus();
		
		// 구매리스트뽑기 
		IBuyService service1 = BuyServiceImpl.getInstance();
				
		List<BuyVO> list1 = service1.getAllbuy(); 
				
		// 구매리스트
		request.setAttribute("list1", list1);
		// 회원리스트
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("board/admin.jsp").forward(request, response);
		
		
		
	}

}
