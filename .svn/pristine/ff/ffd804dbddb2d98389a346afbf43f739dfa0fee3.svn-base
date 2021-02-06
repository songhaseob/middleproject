package kr.or.ddit.cfms.contoller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.cfms.service.BlacklistServiceImpl;
import kr.or.ddit.cfms.service.IBlacklistService;
import kr.or.ddit.cfms.vo.BlackListVO;

@WebServlet("/Reportdetailview.do")
public class Reportdetailview extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String numlist = request.getParameter("id");
		
		IBlacklistService service = BlacklistServiceImpl.getInstance();
		
		BlackListVO vo = service.getBlacklist(numlist);
		
		request.setAttribute("vo", vo);
		
		request.getRequestDispatcher("board/admin_report_detail.jsp").forward(request, response);
		
	}

}
