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


@WebServlet("/admin_board_insert.do")
public class CFMSBoardlist_admin_insert extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		
		String title = request.getParameter("title");
		String content = request.getParameter("cont");
		String date = request.getParameter("date");

		CFMSBoardlistVO vo = new CFMSBoardlistVO();
		
		vo.setTitle(title);
		vo.setCont(content);
		vo.setWr_dt(date);
		
		ICFMSBoardService service = CFMSBoardServiceImpl.getInstance();
		
		int cnt = service.insertBoard(vo);
		
		request.setAttribute("result", cnt);
		
		request.getRequestDispatcher("jsp/result.jsp").forward(request, response);
	 
		
	}

}
