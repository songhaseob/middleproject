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


@WebServlet("/admin_board_select.do")
public class CFMSBoardlist_admin_select extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		
		
		
		CFMSBoardlistVO vo = new CFMSBoardlistVO();
		
		vo.setList_num(Integer.valueOf(request.getParameter("seq")));
	
		
		
		ICFMSBoardService service = CFMSBoardServiceImpl.getInstance();
		
		List<CFMSBoardlistVO> list = service.getDetailBoardlist(vo);
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("jsp/boardlist_admin_mod.jsp").forward(request, response);
	 
		
	}

}
