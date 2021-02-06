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
import kr.or.ddit.cfms.vo.ProductVO;
import kr.or.ddit.cfms.vo.ProlistVO;


@WebServlet("/mainPage.do")
public class MainPage extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public MainPage() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ICFMSService service = CFMSServiceImpl.getInstance();
		

		
		int endNum = 12;
		
		
		
		
	
		
		List<ProlistVO> prolist = service.getAllProList(); 
		
		
		List<ProlistVO> prolist2 = new ArrayList<>();
		
		List<ProductVO> prodlist = service.getAllProdList();
		
		
		List<ProductVO> prodlist2 = new ArrayList<>();
		
		if(prolist!=null) {
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
		
		
		}
		
		request.setAttribute("prolist", prolist2);
		
		request.setAttribute("prodlist", prodlist2);
		
		request.setAttribute("endnum", endNum);
	  
		request.getRequestDispatcher("board/main.jsp").forward(request, response);
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
