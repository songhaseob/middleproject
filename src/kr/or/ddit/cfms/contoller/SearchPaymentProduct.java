package kr.or.ddit.cfms.contoller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.cfms.service.CFMSServiceImpl;
import kr.or.ddit.cfms.service.ICFMSService;
import kr.or.ddit.cfms.vo.BuyVO;
import kr.or.ddit.cfms.vo.ChargeVO;
import kr.or.ddit.cfms.vo.CustomerVO;
import kr.or.ddit.cfms.vo.DateVO;
import kr.or.ddit.cfms.vo.ProductVO;
import kr.or.ddit.cfms.vo.SelVO;

@WebServlet("/searchPaymentProduct.do")
public class SearchPaymentProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		ICFMSService service = CFMSServiceImpl.getInstance();
		
		String userId = request.getParameter("id");
		String payDate = request.getParameter("paydate");
		
		
		CustomerVO resultCvo = service.userInfo(userId);	
		
		request.setAttribute("tabinfo", "mybuy");
		request.setAttribute("userinfo", resultCvo);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

        Calendar c1 = Calendar.getInstance();
        
        String strToday = sdf.format(c1.getTime());
        
        DateVO dateVo = new DateVO();
        dateVo.setCus_id(userId);
        dateVo.setStartdate(strToday);
        
        List<BuyVO> buyList = null;
        List<SelVO> selList = null;
        List<ProductVO> buyProdList = null;
        List<ProductVO> selProdList = null;
        
        if(payDate!=null) {
        	if(payDate.equals("1일")) {
				buyList = service.getWeekBuy(dateVo);
				selList = service.getWeekSel(dateVo);
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
			}else if(payDate.equals("1주일")) {
				buyList = service.getWeekBuy(dateVo);
				selList = service.getWeekSel(dateVo);
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
			}else if(payDate.equals("1개월")) {
				buyList = service.getMonthBuy(dateVo);
				selList = service.getMonthSel(dateVo);
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
				
			}else if(payDate.equals("1년")) {
				buyList = service.getYearBuy(dateVo);
				selList = service.getYearSel(dateVo);
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
			}
			
		}
        
        request.setAttribute("buylist", buyList);
		request.setAttribute("sellist", selList);
		request.setAttribute("buyprodlist", buyProdList);
		request.setAttribute("selprodlist", selProdList);
		
		request.getRequestDispatcher("board/sub_mypage.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
