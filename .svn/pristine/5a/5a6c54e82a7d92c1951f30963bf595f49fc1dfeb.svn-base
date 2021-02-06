package kr.or.ddit.cfms.contoller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.cfms.service.BuyServiceImpl;
import kr.or.ddit.cfms.service.CFMSServiceImpl;
import kr.or.ddit.cfms.service.CustomerServiceImpl;
import kr.or.ddit.cfms.service.IBuyService;
import kr.or.ddit.cfms.service.ICFMSService;
import kr.or.ddit.cfms.service.ICustomerService;
import kr.or.ddit.cfms.service.IProductService;
import kr.or.ddit.cfms.service.ProductServiceImpl;
import kr.or.ddit.cfms.vo.BuyVO;
import kr.or.ddit.cfms.vo.CustomerVO;
import kr.or.ddit.cfms.vo.ProductVO;
import kr.or.ddit.cfms.vo.SelVO;

@WebServlet("/cusView.do")
public class CusView extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String cusid = request.getParameter("id");
		// 회원 정보 가져오는 객체
		ICFMSService service = CFMSServiceImpl.getInstance();
		
		CustomerVO vo = service.userInfo(cusid);
		
		CustomerVO resultCvo = service.userInfo(cusid);	
		
		request.setAttribute("userinfo", resultCvo);
		
		//ICFMSService service1 = CFMSServiceImpl.getInstance();
		// 구매리스트 뽑는 객체
		String userId = vo.getCus_id();
				
		List<BuyVO> buyList = null;
        List<SelVO> selList = null;
        List<ProductVO> buyProdList = null;
        List<ProductVO> selProdList = null;
        
       
		buyList = service.allBuyList(userId);
		selList = service.allSelList(userId);
		String buyProd = "";
		String selProd = "";
		if(buyList!=null) {
			for(int i=0;i<buyList.size();i++) {
				if(i>0) {
					buyProd+=",";
				}
				buyProd += buyList.get(i).getPro_num();
			}
		}
		if(selList!=null) {
			for(int i=0;i<selList.size();i++) {
				if(i>0) {
					selProd+=",";
				}
				selProd += selList.get(i).getPro_num();
			}	
		}
		buyProdList = service.getPaymentProd(buyProd);
		selProdList = service.getPaymentProd(selProd);
		
		
		
		request.setAttribute("buylist", buyList);
		request.setAttribute("sellist", selList);
		request.setAttribute("buyprodlist", buyProdList);
		request.setAttribute("selprodlist", selProdList);
		
		request.getRequestDispatcher("board/admin_userinfo.jsp").forward(request, response);
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	
	}

}
