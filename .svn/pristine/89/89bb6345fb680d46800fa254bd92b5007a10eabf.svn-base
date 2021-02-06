package kr.or.ddit.cfms.contoller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.cfms.service.BlacklistServiceImpl;
import kr.or.ddit.cfms.service.CFMSServiceImpl;
import kr.or.ddit.cfms.service.CustomerServiceImpl;
import kr.or.ddit.cfms.service.IBlacklistService;
import kr.or.ddit.cfms.service.ICFMSService;
import kr.or.ddit.cfms.service.ICustomerService;
import kr.or.ddit.cfms.vo.BlackListVO;
import kr.or.ddit.cfms.vo.BlackcusVO;
import kr.or.ddit.cfms.vo.CustomerVO;

@WebServlet("/blacklistview.do")
public class Blacklistview extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
			
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		
		String cusid = request.getParameter("id");
		
		// id를 매개변수로 블랙리스트 뽑아오기
		IBlacklistService service = BlacklistServiceImpl.getInstance();
		ICFMSService service1 = CFMSServiceImpl.getInstance();
		
		BlackListVO vo = service.getBlacklist(cusid);
		// id를 매개변수로 블랙회원 뽑아오기 
		BlackcusVO vo1 = service.getBlackcus(cusid);
		// id를 매개변수로 회원 뽑아오기
		CustomerVO vo2 = service1.userInfo(cusid);
				
		request.setAttribute("vo2", vo2);
		
		request.setAttribute("vo", vo);
		request.setAttribute("vo1", vo1);
		
		request.getRequestDispatcher("board/admin_black_detail.jsp").forward(request, response);
		
	
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
	
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		
		String cusid = request.getParameter("id");
		
		IBlacklistService service = BlacklistServiceImpl.getInstance();
		
		ICFMSService service1 = CFMSServiceImpl.getInstance();
		
		// id를 매개변수로 블랙리스트 뽑아오기

		BlackListVO vo = service.getBlacklist(cusid);
		// id를 매개변수로 블랙회원 뽑아오기 
		BlackcusVO vo1 = service.getBlackcus(cusid);
		
		// id를 매개변수로 회원 뽑아오기
		CustomerVO vo2 = service1.userInfo(cusid);
		
		request.setAttribute("vo2", vo2);
		request.setAttribute("vo", vo);
		request.setAttribute("vo1", vo1);
		
		request.getRequestDispatcher("board/admin_black_detail.jsp").forward(request, response);
		
	}

}
