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
import kr.or.ddit.cfms.vo.CFMSBoardlistVO;
import kr.or.ddit.cfms.vo.CustomerVO;

@WebServlet("/Blacklistinsert.do")
public class Blacklistinsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String title = request.getParameter("title");
		String cont = request.getParameter("cont");
		String reportedid = request.getParameter("reportedid");
		String userid = request.getParameter("userid");
		String writer = request.getParameter("writer");
		String selid = request.getParameter("selid");
		
		int prodnum = Integer.parseInt(request.getParameter("prodnum"));
		
		BlackListVO vo = new BlackListVO();
		
		vo.setTitle(title);
		vo.setWriter(writer);
		vo.setCont(cont);
		vo.setReported_cus(reportedid);
		vo.setCus_id(userid);
		vo.setProd_num(prodnum);
		
		IBlacklistService service = BlacklistServiceImpl.getInstance();
		ICustomerService service1 = CustomerServiceImpl.getInstance();

		// 신고내역 update 하는 메서드
		int cnt = service1.updateCus(selid);

		// 블랙리스트에 인서트하는 부분 
		int res = service.insertBlacklist(vo);
		
		request.setAttribute("cnt", cnt);
		request.setAttribute("result", res);
		
		request.getRequestDispatcher("jsp/resultblacklist.jsp").forward(request, response);
			
		
	}

}
