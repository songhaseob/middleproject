package kr.or.ddit.cfms.contoller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.cfms.dao.BlacklistdaoImpl;
import kr.or.ddit.cfms.dao.IBlacklistdao;
import kr.or.ddit.cfms.service.BuyServiceImpl;
import kr.or.ddit.cfms.service.CFMSServiceImpl;
import kr.or.ddit.cfms.service.CustomerServiceImpl;
import kr.or.ddit.cfms.service.IBuyService;
import kr.or.ddit.cfms.service.ICFMSService;
import kr.or.ddit.cfms.service.ICustomerService;
import kr.or.ddit.cfms.vo.BlackcusVO;
import kr.or.ddit.cfms.vo.BuyVO;
import kr.or.ddit.cfms.vo.CustomerVO;
import kr.or.ddit.cfms.vo.ProductVO;
import kr.or.ddit.cfms.vo.ProlistVO;

@WebServlet("/SessionLoginServlet.do")
public class SessionLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String contextPath = request.getContextPath();

		HttpSession session = request.getSession();

		String userid = request.getParameter("uname");
		String pass = request.getParameter("psw");
		
		String end = request.getParameter("endnum");
		
		int endNum = 0;
		
		if(end==null) {
		
			endNum = 12;
		}else {
		
			endNum = Integer.parseInt(end);
		}
		
		
		
		CustomerVO cvo = new CustomerVO();
		cvo.setCus_id(userid);
		cvo.setPass(pass);

		ICFMSService service = CFMSServiceImpl.getInstance();

		ICustomerService cusService = CustomerServiceImpl.getInstance();
		
		IBlacklistdao blackcusService = BlacklistdaoImpl.getInstance();
		
		CustomerVO resultCvo = service.login(cvo);
		
		String url = null;
		
		//로그인 후 페이지 이동 수정(선중)
		if (resultCvo == null) {
			
			url = "jsp/fail_login.jsp";
			//response.sendRedirect(contextPath + "/test/test3.html");
		} else {
			BlackcusVO blackCus = blackcusService.getBlackcus(cvo.getCus_id());
			if(blackCus!=null) {
				
				
				
				url = "board/blacklist.jsp";
				
			}else {
			
				if(resultCvo.getCus_id().equals("admin")) {
					url = "board/admin.jsp";
					List<CustomerVO> allCustomer = cusService.getAllCus();
					request.setAttribute("allcustomer", allCustomer);
					
					
					
					
				}else {
					url = "board/main_join.jsp";
					List<ProlistVO> prolist = service.getAllProList(); 
					
					List<ProlistVO> prolist2 = new ArrayList<>();
					
					if(prolist.size()>endNum) {
						for(int i = 0; i<endNum; i++) {
							prolist2.add(prolist.get(i));
						}
					}else {
						for(int i = 0; i<prolist.size(); i++) {
							prolist2.add(prolist.get(i));
						}
					}
					
					request.setAttribute("prolist", prolist2);
					
					List<ProductVO> prodlist = service.getAllProdList();
					
					List<ProductVO> prodlist2 = new ArrayList<>();
					
					if(prodlist.size()>endNum) {
						for(int i = 0; i<endNum; i++) {
							prodlist2.add(prodlist.get(i));
						}
					}else {
						for(int i = 0; i<prodlist.size(); i++) {
							prodlist2.add(prodlist.get(i));
						}
					}
					
					request.setAttribute("prodlist", prodlist2);
					
					request.setAttribute("endnum", endNum);
					
					request.setAttribute("userinfo", resultCvo);
					
					session.setAttribute("USER", resultCvo);
					//response.sendRedirect(contextPath + "/board/main_join.jsp");
				}
			}
		}

		
		request.getRequestDispatcher(url).forward(request, response);
	}

}
