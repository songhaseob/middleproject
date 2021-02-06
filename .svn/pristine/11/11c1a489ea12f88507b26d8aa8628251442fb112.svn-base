package kr.or.ddit.cfms.contoller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.cfms.service.CFMSServiceImpl;
import kr.or.ddit.cfms.service.CustomerServiceImpl;
import kr.or.ddit.cfms.service.ICFMSService;
import kr.or.ddit.cfms.vo.CustomerVO;

/**
 * Servlet implementation class CustomerService
 */
@WebServlet("/customerService.do")
public class CustomerService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		// 0. 클라이언트 요청 (전송)시 전송되는 데이터를 받는다.
		String id = request.getParameter("id");
		
		System.out.println(id);
		// 1. service 객체 얻어 오기
		ICFMSService service = CFMSServiceImpl.getInstance();
		
		// 2. service 메소드를 호출한다. - 결과를 받는다. (여기선 list!! 리턴리스트한거!)
		CustomerVO resultCvo = service.userInfo(id);	
		System.out.println(resultCvo.getCus_id());
		
		// 3. request객체에 결과를 저장한다. 
		request.setAttribute("userinfo", resultCvo);
		
		// 4. 결과로 출력하거나 json데이터를 생성한다. - 이건 jsp응답페이지에서 한다. - 컨트롤러에서 받은 결과를 ajax로 다시 보내줄 json을 만드는데 그게 jsp파일로 되어있음
		//위에 키를 이용해서 jsp로 가는거야
		request.getRequestDispatcher("board/sub_board.jsp").forward(request, response);	
		
		// 5. jsp페이지로 forward한다.
		//request.getRequestDispatcher("member/memberList.jsp(jsp페이지 이름)").forward(request, response);	이걸 게터로 꺼내온거	

		
		
	}

	

}
