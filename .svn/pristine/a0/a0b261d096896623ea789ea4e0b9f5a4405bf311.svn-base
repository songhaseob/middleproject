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

@WebServlet("/adminSales.do")
public class AdminSales extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		ICFMSService service = CFMSServiceImpl.getInstance();
		
		String date = request.getParameter("date");
			
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

        Calendar c1 = Calendar.getInstance();
        
        String strToday = sdf.format(c1.getTime());
        
        List<ChargeVO> totalList = service.adminAllChargeList();
		
		request.setAttribute("totallist", totalList);
		
		if(date!=null) {
			if(date.equals("1일")) {
				List<ChargeVO> charList1 =  service.adminDayChargeList(strToday);
				request.setAttribute("datelist", charList1);
			}else if(date.equals("1주일")) {
				List<ChargeVO> charList1 =  service.adminWeekChargeList(strToday);
				request.setAttribute("datelist", charList1);
			}else if(date.equals("1개월")) {
				List<ChargeVO> charList1 =  service.adminMonthChargeList(strToday);
				request.setAttribute("datelist", charList1);
			}else if(date.equals("1년")) {
				List<ChargeVO> charList1 =  service.adminYearChargeList(strToday);
				request.setAttribute("datelist", charList1);
			}
			
		}
		
		request.getRequestDispatcher("board/admin_sales.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
