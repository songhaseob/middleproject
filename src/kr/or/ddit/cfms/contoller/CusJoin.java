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
 
@WebServlet("/CusJoin")
public class CusJoin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		String nicknm = request.getParameter("nicknm");
		String tel = request.getParameter("tel");
		String pass_hint = request.getParameter("pass_hint");
		String email = request.getParameter("email");
		String answer = request.getParameter("answer");
		
		CustomerVO vo = new CustomerVO();
		
		vo.setCus_id(id);
		vo.setPass(pass);
		vo.setNicknm(nicknm);
		vo.setTel(tel);
		vo.setPass_hint(pass_hint);
		vo.setEmail(email);
		vo.setAnswer(answer);
		
		System.out.println(id);
		System.out.println(pass);
		System.out.println(nicknm);
		System.out.println(tel);
		System.out.println(pass_hint);
		System.out.println(email);
		System.out.println(answer);
		
		ICFMSService service = CFMSServiceImpl.getInstance();
		
		String resId = service.insertUser(vo);
		
		request.setAttribute("resId", resId);
		
		request.getRequestDispatcher("jsp/nuserJoin.jsp").forward(request, response);
		
	}

}
