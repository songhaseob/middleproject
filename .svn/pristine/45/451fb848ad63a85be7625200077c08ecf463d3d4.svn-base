package kr.or.ddit.cfms.contoller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.cfms.service.CFMSServiceImpl;
import kr.or.ddit.cfms.service.ICFMSService;
import kr.or.ddit.cfms.vo.CustomerVO;
import kr.or.ddit.cfms.vo.ProductVO;
import kr.or.ddit.cfms.vo.ProlistVO;

@WebServlet("/searchProduct.do")
public class SearchProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String search = request.getParameter("search");
		String userId = request.getParameter("id");
		
		ICFMSService service = CFMSServiceImpl.getInstance();
		
		CustomerVO resultCvo = service.userInfo(userId);
		
		request.setAttribute("userinfo", resultCvo);
		
		if(!"".equals(search)) {
		
			
			
			
			List<ProductVO> prodList = service.searchProduct(search);
			request.setAttribute("prodlist", prodList);
			
			
			List<ProlistVO> proList = service.searchProlist(search);
			request.setAttribute("prolist", proList);
			
			int zero = 0;
			request.setAttribute("endnum", zero);
		}else if("".equals(search)){
			int endNum = 12;
			
			List<ProlistVO> prolist = service.getAllProList(); 
			
			
			List<ProlistVO> prolist2 = new ArrayList<>();
			
			List<ProductVO> prodlist = service.getAllProdList();
			
			
			List<ProductVO> prodlist2 = new ArrayList<>();
			
			
			if(prolist.size()>endNum) {
				for(int i = 0; i<endNum; i++) {
					prolist2.add(prolist.get(i));
				}
			}else {
				for(int i = 0; i<prolist.size(); i++) {
					prolist2.add(prolist.get(i));
				}
			}
			
			
			
			
			if(prodlist.size()>endNum) {
				for(int i = 0; i<endNum; i++) {
					prodlist2.add(prodlist.get(i));
				}
			}else {
				for(int i = 0; i<prodlist.size(); i++) {
					prodlist2.add(prodlist.get(i));
				}
			}
			
			request.setAttribute("prolist", prolist2);
			
			request.setAttribute("prodlist", prodlist2);
		
			request.setAttribute("endnum", endNum);
		
		}
		
		
		request.getRequestDispatcher("board/main_join.jsp").forward(request, response);
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
