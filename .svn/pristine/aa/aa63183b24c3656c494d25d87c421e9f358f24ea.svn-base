package kr.or.ddit.cfms.contoller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.cfms.service.CFMSServiceImpl;
import kr.or.ddit.cfms.service.ICFMSService;
import kr.or.ddit.cfms.vo.ChargeVO;

@WebServlet("/chargePoint.do")
public class ChargePoint extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		request.setCharacterEncoding("UTF-8");

		String userId = request.getParameter("id");
		int money = Integer.parseInt(request.getParameter("money"));

		ChargeVO vo = new ChargeVO();

		vo.setCus_id(userId);
		vo.setCha_pr(money);

		// 1.

		// 1.

		ICFMSService service = CFMSServiceImpl.getInstance();

		// 2.

		// 2.

		int cnt = service.insertPoint(vo);

		// 3.

		// 3.

		request.setAttribute("result", cnt);

		// 4.

		// 4.

		request.getRequestDispatcher("board/result.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
