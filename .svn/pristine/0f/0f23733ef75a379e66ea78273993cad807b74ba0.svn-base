package kr.or.ddit.cfms.contoller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import kr.or.ddit.cfms.service.CFMSServiceImpl;
import kr.or.ddit.cfms.service.ICFMSService;
import kr.or.ddit.cfms.vo.CategoryVO;
import kr.or.ddit.cfms.vo.CustomerVO;
import kr.or.ddit.cfms.vo.ProductVO;
import kr.or.ddit.cfms.vo.ProlistVO;

@WebServlet("/category.do")
public class Category extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("utf-8");
		
		String[] category = request.getParameterValues("Category");
		String[] brand = request.getParameterValues("Brand");
		String[] price = request.getParameterValues("Price");
		String userId = request.getParameter("id");

		if(category==null&&brand==null&&price==null) {
			
			ICFMSService service = CFMSServiceImpl.getInstance();

			CustomerVO resultCvo = service.userInfo(userId);
			
			request.setAttribute("userinfo", resultCvo);
			
			
			
			String end = request.getParameter("endnum");
			
			int endNum = 0;
			
			if(end==null) {
			
				endNum = 12;
			}else {
			
				endNum = Integer.parseInt(end);
			}
			
			
			
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
			
			
		}else {
		
			List<String> checkCate = new ArrayList<>();
			if(category!=null) {
				for(int i=0;i<category.length; i++) {
					checkCate.add(category[i]);
				}
			}
			
			List<String> checkBrand = new ArrayList<>();
			if(brand!=null) {
				for(int i=0;i<brand.length; i++) {
					checkBrand.add(brand[i]);
				}
			}
			
			List<String> checkPrice = new ArrayList<>();
			if(price!=null) {
				for(int i=0;i<price.length; i++) {
					checkPrice.add(price[i]);
				}
			}
			
			
			
			request.setAttribute("category", checkCate);
			
			request.setAttribute("brand", checkBrand);
			
			request.setAttribute("price", checkPrice);
			
			CategoryVO cateVo = new CategoryVO();
			String queryCategory = "";
			if(category!=null) {
				for(int i=0;i<category.length;i++) {
					if(i>0) {
						queryCategory+=",";
					}
					queryCategory += "'"+category[i]+"'";
				}
				cateVo.setCategoey(queryCategory);
				
			}else {
				cateVo.setCategoey("'베이커리/도넛','커피/음료','편의점','피자/치킨','패스트푸드'");
			}
			
			
			System.out.println(cateVo.getCategoey());
			String queryBrand = "";
			if(brand!=null) {
				for(int i=0;i<brand.length;i++) {
					if(i>0) {
						queryBrand+=",";
					}
					queryBrand += "'"+brand[i]+"'";
				}
				cateVo.setBrand(queryBrand);
			}else {
				cateVo.setBrand("'파리바게트','던킨','스타벅스','메가커피','GS25','이마트24','BBQ','도미노피자','맥도날드','서브웨이'");
			}
			
			
			
			
			
			
			ICFMSService service = CFMSServiceImpl.getInstance();
	
			CustomerVO resultCvo = service.userInfo(userId);
			
			request.setAttribute("userinfo", resultCvo);
			
		
			List<ProlistVO> cateProlist = service.categoryProlist(cateVo);
			
			List<ProductVO> cateProd = service.categoryProduct(cateVo);
		
			List<ProlistVO> cateProlistPrice = new ArrayList<>();
			
			List<ProductVO> cateProdPrice = new ArrayList<>();
			
			if(price!=null) {
				for(int i = 0; i<price.length; i++) {
					if(price[i].equals("3000")) {
						for(int j=0; j<cateProd.size(); j++) {
							if(cateProd.get(j).getPro_pr()<3000) {
								cateProdPrice.add(cateProd.get(j)); 
								cateProlistPrice.add(cateProlist.get(j));
							}
						}
					}
					if(price[i].equals("5000")) {
						for(int j=0; j<cateProd.size(); j++) {
							if(cateProd.get(j).getPro_pr()>=3000&&cateProd.get(j).getPro_pr()<5000) {
								cateProdPrice.add(cateProd.get(j)); 
								cateProlistPrice.add(cateProlist.get(j));
							}
						}
					}
					if(price[i].equals("10000")) {
						for(int j=0; j<cateProd.size(); j++) {
							if(cateProd.get(j).getPro_pr()>=5000&&cateProd.get(j).getPro_pr()<10000) {
								cateProdPrice.add(cateProd.get(j)); 
								cateProlistPrice.add(cateProlist.get(j));
							}
						}
					}	
					if(price[i].equals("30000")) {
						for(int j=0; j<cateProd.size(); j++) {
							if(cateProd.get(j).getPro_pr()>=10000&&cateProd.get(j).getPro_pr()<30000) {
								cateProdPrice.add(cateProd.get(j)); 
								cateProlistPrice.add(cateProlist.get(j));
							}
						}	
					}
					if(price[i].equals("50000")) {
						for(int j=0; j<cateProd.size(); j++) {
							if(cateProd.get(j).getPro_pr()>=30000) {
								cateProdPrice.add(cateProd.get(j)); 
								cateProlistPrice.add(cateProlist.get(j));
							}
						}	
					}
							
				}
				
				request.setAttribute("prolist", cateProlistPrice);
				
				
				request.setAttribute("prodlist", cateProdPrice);
				
			}else {
				
				request.setAttribute("prolist", cateProlist);
				
				
				request.setAttribute("prodlist", cateProd);
			
			}
			
			

			int zero = 0;
			request.setAttribute("endnum", zero);
			
		}
		
		request.getRequestDispatcher("board/main_join.jsp").forward(request, response);
		

		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
