package kr.or.ddit.cfms.contoller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.cfms.service.CFMSBoardServiceImpl;
import kr.or.ddit.cfms.service.CFMSServiceImpl;
import kr.or.ddit.cfms.service.ICFMSBoardService;
import kr.or.ddit.cfms.service.ICFMSService;
import kr.or.ddit.cfms.vo.CFMSBoardlistVO;
import kr.or.ddit.cfms.vo.CustomerVO;
import kr.or.ddit.cfms.vo.ProductVO;
import kr.or.ddit.cfms.vo.ProlistVO;

@WebServlet("/productView.do")
public class ProductView extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num = Integer.parseInt(request.getParameter("num"));
		String userId = request.getParameter("id");
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		
		
		ICFMSService service = CFMSServiceImpl.getInstance();
		
		
		
		ProductVO vo = service.getProduct(num);
		
		request.setAttribute("product", vo);
		
		ProlistVO vo2 = service.getProList(num);
		
		request.setAttribute("prolist", vo2);
		
		CustomerVO resultCvo = service.userInfo(userId);
		
		request.setAttribute("userinfo", resultCvo);
		String seller = vo2.getCus_id();
		int rep = service.userReportInfo(seller);
		
		int selc = service.userSelInfo(seller);
		
		request.setAttribute("report", rep);
		
		request.setAttribute("selinfo", selc);

		
		
		request.getRequestDispatcher("board/sub_product.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
