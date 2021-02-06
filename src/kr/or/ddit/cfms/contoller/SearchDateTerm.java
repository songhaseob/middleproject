package kr.or.ddit.cfms.contoller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
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

@WebServlet("/searchDateTerm.do")
public class SearchDateTerm extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		ICFMSService service = CFMSServiceImpl.getInstance();
		
		String userId = request.getParameter("id");
		String startDate = request.getParameter("startdate");
		String endDate = request.getParameter("enddate");
		
	
		DateVO dateVo = new DateVO();
		dateVo.setStartdate(startDate);
		dateVo.setEnddate(endDate);
		dateVo.setCus_id(userId);
		
		
		CustomerVO resultCvo = service.userInfo(userId);	
		
        
        request.setAttribute("tabinfo", "mypoint");
		request.setAttribute("userinfo", resultCvo);
		
		List<ChargeVO> charList = service.myPointInfo(userId);
		request.setAttribute("charlist", charList);
		
		
		List<ChargeVO> charList1 = service.termChargeList(dateVo);
		request.setAttribute("datelist", charList1);
		
		request.getRequestDispatcher("board/sub_mypage.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
