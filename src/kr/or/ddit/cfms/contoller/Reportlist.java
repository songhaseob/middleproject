package kr.or.ddit.cfms.contoller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.cfms.service.BlacklistServiceImpl;
import kr.or.ddit.cfms.service.IBlacklistService;
import kr.or.ddit.cfms.vo.BlackListVO;

@WebServlet("/Reportlist.do")
public class Reportlist extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		IBlacklistService service = BlacklistServiceImpl.getInstance();
		
		// 신고 게시판을 위한 블랙리스트 정보 리스트
		List<BlackListVO> list = service.getAllblacklist();
		
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("board/admin_report.jsp").forward(request, response);
	
	}
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		IBlacklistService service = BlacklistServiceImpl.getInstance();
		
		// 신고 게시판을 위한 블랙리스트 정보 리스트
		List<BlackListVO> list = service.getAllblacklist();
		
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("board/admin_report.jsp").forward(request, response);
		
	}

}
