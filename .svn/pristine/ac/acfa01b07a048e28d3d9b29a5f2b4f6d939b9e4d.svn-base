package kr.or.ddit.cfms.contoller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.cfms.service.CFMSBoardServiceImpl;
import kr.or.ddit.cfms.service.ICFMSBoardService;
import kr.or.ddit.cfms.vo.CFMSBoardlistVO;


@WebServlet("/admin_board_delete.do")
public class CFMSBoardlist_admin_delete extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int seq = Integer.parseInt(request.getParameter("seq"));
		
		ICFMSBoardService service = CFMSBoardServiceImpl.getInstance();
		
		int cnt = service.deleteBoard(seq);
		
		request.setAttribute("result", cnt);
		
		request.getRequestDispatcher("jsp/result.jsp").forward(request, response);
		
		
	 
		
	}

}
