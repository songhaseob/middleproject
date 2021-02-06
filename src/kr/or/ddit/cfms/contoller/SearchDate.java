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

@WebServlet("/searchDate.do")
public class SearchDate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		ICFMSService service = CFMSServiceImpl.getInstance();
		
		String userId = request.getParameter("id");
		String date = request.getParameter("date");
		
		CustomerVO resultCvo = service.userInfo(userId);	
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

        Calendar c1 = Calendar.getInstance();
        
        String strToday = sdf.format(c1.getTime());
        
        request.setAttribute("tabinfo", "mypoint");
		request.setAttribute("userinfo", resultCvo);
		
		List<ChargeVO> charList = service.myPointInfo(userId);
		request.setAttribute("charlist", charList);
		
		DateVO dateVo = new DateVO();
		dateVo.setCus_id(userId);
		dateVo.setStartdate(strToday);
		
		if(date!=null) {
			if(date.equals("1일")) {
				List<ChargeVO> charList1 =  service.dayChargeList(dateVo);
				request.setAttribute("datelist", charList1);
			}else if(date.equals("1주일")) {
				List<ChargeVO> charList1 =  service.weekChargeList(dateVo);
				request.setAttribute("datelist", charList1);
			}else if(date.equals("1개월")) {
				List<ChargeVO> charList1 =  service.monthChargeList(dateVo);
				request.setAttribute("datelist", charList1);
			}else if(date.equals("1년")) {
				List<ChargeVO> charList1 =  service.yearChargeList(dateVo);
				request.setAttribute("datelist", charList1);
			}
			
		}
		
		request.getRequestDispatcher("board/sub_mypage.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
