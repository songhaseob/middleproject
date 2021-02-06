package kr.or.ddit.cfms.contoller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.cfms.service.CustomerServiceImpl;
import kr.or.ddit.cfms.service.ICustomerService;
import kr.or.ddit.cfms.vo.CustomerVO;

@WebServlet("/CustomerMypageUpdate.do")
public class CustomerMypageUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String cusid = request.getParameter("id");		// 아이디 값
		String check = request.getParameter("check");	// 구분값
		String nicknm = request.getParameter("Upnick"); // 수정할 닉네임
		String pass = request.getParameter("Uppass");	// 수정할 비밀번호
		String mail = request.getParameter("Upmail");	// 수정할 이메일
		
		ICustomerService service = CustomerServiceImpl.getInstance();
		
		CustomerVO vo = service.userInfo(cusid);
		
		request.setAttribute("tabinfo", "myInfoupdate");
		request.setAttribute("userinfo", vo);
		
		int cnt = 0;
		
		if(check != null) {
			if(check.equals("닉네임변경")) {
				CustomerVO vo1 = new CustomerVO();
				vo1.setNicknm(nicknm);
				vo1.setCus_id(cusid);
				cnt = service.updateCusnick(vo1);
				request.setAttribute("result", cnt);
				
			}else if(check.equals("비밀번호변경")) {
				CustomerVO vo1 = new CustomerVO();
				vo1.setPass(pass);
				vo1.setCus_id(cusid);
				cnt = service.updateCuspass(vo1);
				request.setAttribute("result", cnt);
				
			}else if(check.equals("이메일변경")) {
				CustomerVO vo1 = new CustomerVO();
				vo1.setEmail(mail);
				vo1.setCus_id(cusid);
				cnt = service.updateCusmail(vo1);
				request.setAttribute("result", cnt);
				
			}
		}
		
		request.getRequestDispatcher("board/sub_mypage.jsp").forward(request, response);
		
		
		
		
		
		
		
	}

}
