package kr.or.ddit.cfms.contoller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.cfms.service.BlacklistServiceImpl;
import kr.or.ddit.cfms.service.CustomerServiceImpl;
import kr.or.ddit.cfms.service.IBlacklistService;
import kr.or.ddit.cfms.service.ICustomerService;
import kr.or.ddit.cfms.vo.BlackListVO;
import kr.or.ddit.cfms.vo.BlackcusVO;
import kr.or.ddit.cfms.vo.CustomerVO;

@WebServlet("/Blackcuslist.do")
public class Blackcuslist extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		
		
		IBlacklistService service = BlacklistServiceImpl.getInstance();
		
		// 블랙리스트 테이블 정보 가져오기
		List<BlackListVO> list1 = service.getAllblacklist();
		
		// 블랙리스트 회원 정보 가져오기
		List<BlackcusVO> list = service.getAllblackcus();
		
		ICustomerService service2 = CustomerServiceImpl.getInstance();
		// 회원 정보 가져오기
		List<CustomerVO> list2 = service2.getAllCus();
		
		request.setAttribute("list2", list2);
		request.setAttribute("list", list);
		request.setAttribute("list1", list1);
		
		request.getRequestDispatcher("board/admin_black_list.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		
		IBlacklistService service = BlacklistServiceImpl.getInstance();
		
		List<BlackcusVO> list = service.getAllblackcus();
		
		// 블랙리스트 테이블 정보 가져오기
		List<BlackListVO> list1 = service.getAllblacklist();
		
		ICustomerService service2 = CustomerServiceImpl.getInstance();
		// 회원 정보 가져오기
		List<CustomerVO> list2 = service2.getAllCus();
		
		request.setAttribute("list2", list2);
		
		request.setAttribute("list", list);
		request.setAttribute("list1", list1);
		
		request.getRequestDispatcher("board/admin_black_list.jsp").forward(request, response);
		
		
	}

}
