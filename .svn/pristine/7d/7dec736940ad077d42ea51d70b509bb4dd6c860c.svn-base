package kr.or.ddit.cfms.contoller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.cfms.service.CFMSServiceImpl;
import kr.or.ddit.cfms.service.ICFMSService;
import kr.or.ddit.cfms.vo.CustomerVO;

@WebServlet("/IdCheck")
public class IdCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// 0. 클라이언트 전송시 데이터 받는다 - 입력한 아이디
		String inputId = request.getParameter("id");
		// 1. service객체 얻기
		ICFMSService service = CFMSServiceImpl.getInstance();
		// 2. service메서드 호출 - 결과값 얻기
		String resId = service.cusId(inputId);
		// 3. 결과값을 request에 저장
		request.setAttribute("resId", resId);
		// 4. jsp로 forward
		request.getRequestDispatcher("jsp/idCheck.jsp").forward(request, response);
	}

}
