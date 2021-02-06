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

/**
 * 공지사항을 처리하는 서블릿
 */
@WebServlet("/CFMSBoardFaqlist_admin.do")
public class CFMSBoardFaqlist_Admin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");

		ICFMSBoardService service = CFMSBoardServiceImpl.getInstance();

		List<CFMSBoardlistVO> list = service.getAllBoardlist();

		request.setAttribute("list", list);

		request.getRequestDispatcher("jsp/boardlist_admin.jsp").forward(request, response);
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");

		ICFMSBoardService service = CFMSBoardServiceImpl.getInstance();

		List<CFMSBoardlistVO> list = service.getAllBoardlist();

		request.setAttribute("list", list);

		request.getRequestDispatcher("jsp/boardlist_admin.jsp").forward(request, response);

	}

}
