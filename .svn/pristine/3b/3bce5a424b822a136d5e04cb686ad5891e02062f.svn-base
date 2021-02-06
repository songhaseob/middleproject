package kr.or.ddit.cfms.contoller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.cfms.service.CFMSServiceImpl;
import kr.or.ddit.cfms.service.ICFMSService;
import kr.or.ddit.cfms.vo.ChargeVO;
import kr.or.ddit.cfms.vo.CustomerVO;
import kr.or.ddit.cfms.vo.DateVO;

@WebServlet("/adminSalesTerm.do")
public class AdminSalesTerm extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		ICFMSService service = CFMSServiceImpl.getInstance();
		
		String startDate = request.getParameter("startdate");
		String endDate = request.getParameter("enddate");
		
	
		List<ChargeVO> totalList = service.adminAllChargeList();
		
		request.setAttribute("totallist", totalList);
		
		DateVO dateVo = new DateVO();
		dateVo.setStartdate(startDate);
		dateVo.setEnddate(endDate);
		
		
		
		List<ChargeVO> charList1 = service.adminTermChargeList(dateVo);
		request.setAttribute("datelist", charList1);
		
		request.getRequestDispatcher("board/admin_sales.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
