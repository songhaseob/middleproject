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

@WebServlet("/searchMyInfo.do")
public class SearchMyInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		ICFMSService service = CFMSServiceImpl.getInstance();
		
		String userId = request.getParameter("id");
		String tabs = request.getParameter("tabs");
		
		CustomerVO resultCvo = service.userInfo(userId);	
		
		request.setAttribute("userinfo", resultCvo);
		
		request.setAttribute("tabinfo", tabs);
		
		if(tabs!=null) {
			if(tabs.equals("mybuy")) {
				
			}else if(tabs.equals("mypoint")) {
				
				List<ChargeVO> charList = service.myPointInfo(userId);
				request.setAttribute("charlist", charList);
				
			}else if(tabs.equals("myInfoupdate")) {
				
			}
		}
		
		request.getRequestDispatcher("board/sub_mypage.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
