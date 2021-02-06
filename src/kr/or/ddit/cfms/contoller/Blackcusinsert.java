package kr.or.ddit.cfms.contoller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.cfms.service.BlacklistServiceImpl;
import kr.or.ddit.cfms.service.IBlacklistService;
import kr.or.ddit.cfms.vo.BlackcusVO;

@WebServlet("/Blackcusinsert.do")
public class Blackcusinsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String reportedid = request.getParameter("reportedid");
		String cont = request.getParameter("cont");
		
		BlackcusVO vo = new BlackcusVO();
		
		vo.setCus_id(reportedid);
		vo.setBlk_rs(cont);
		
		IBlacklistService service = BlacklistServiceImpl.getInstance();
		
		int res = (Integer)service.insertBlackcus(vo);
		
		request.setAttribute("result", res);
		
		request.getRequestDispatcher("jsp/result.jsp").forward(request, response);
	
		
	}

}
