package kr.or.ddit.cfms.contoller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.cfms.service.CFMSServiceImpl;
import kr.or.ddit.cfms.service.ICFMSService;
import kr.or.ddit.cfms.vo.BuyVO;
import kr.or.ddit.cfms.vo.CustomerVO;
import kr.or.ddit.cfms.vo.ProductVO;
import kr.or.ddit.cfms.vo.SelVO;
import org.json.simple.JSONObject;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;
import java.util.HashMap;


@WebServlet("/buyProduct.do")
public class BuyProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		
		request.setCharacterEncoding("UTF-8");
		
		String buyerId = request.getParameter("buyerId");
		String sellerId = request.getParameter("sellerId");
        int price = Integer.parseInt(request.getParameter("price"));
        int code = Integer.parseInt(request.getParameter("code"));
        String tel = request.getParameter("tel");
        
        ICFMSService service = CFMSServiceImpl.getInstance();
        
        ProductVO prodVo = service.getProduct(code);
        
        CustomerVO sellerCust = service.userInfo(sellerId);
        
        BuyVO buyVo = new BuyVO();
        buyVo.setCus_id(buyerId);
        buyVo.setList_num(code);
        buyVo.setPro_num(code);
        
        int cnt = service.buyProduct(buyVo);
        request.setAttribute("cnt", cnt);
        
        
        SelVO selVO = new SelVO();
        selVO.setCus_id(sellerId);
        selVO.setList_num(code);
        selVO.setPro_num(code);
        
        int cnt2 = service.selProduct(selVO);
        request.setAttribute("cnt2", cnt2);
        
        
        CustomerVO buyCustVo = new CustomerVO();
        buyCustVo.setCus_id(buyerId);
        buyCustVo.setPoint(price);
        int cnt3 = service.buyPoint(buyCustVo);
        request.setAttribute("cnt3", cnt3);
        
        CustomerVO selCustVo = new CustomerVO();
        selCustVo.setCus_id(sellerId);
        selCustVo.setPoint(price);
        int cnt4 = service.selPoint(selCustVo);
        request.setAttribute("cnt4", cnt4);
        
        int cnt5 = service.sellProductChange(code);
        request.setAttribute("cnt5", cnt5);
        
        int sum = cnt+cnt2+cnt3+cnt4+cnt5;
        
        String tel2 = sellerCust.getTel();
        
        if(sum==5) {
	        
	        String api_key = "NCSO84P8OV8CL2LC";
		    String api_secret = "0EVDBPVNWPT5K4S8FKIWXEYDK0VSXFD8";
		    Message coolsms = new Message(api_key, api_secret);
	
		    HashMap<String, String> params = new HashMap<String, String>();
		    params.put("to", tel);
		    params.put("from", "01029937927");
		    params.put("type", "MMS");
		    params.put("text", "저희 gifti-ILJO사이트를 이용해주셔서 감사합니다.\n구매하신 "+prodVo.getPro_nm()+" 상품 기프티콘 입니다.\n좋은하루 되세요 ^^");
		    params.put("app_version", "test app 1.2"); 
		    params.put("image", "D:/D_Other/uploadGift/"+code+".jpg");
	
		    try {
		      JSONObject obj = (JSONObject) coolsms.send(params);
		      System.out.println(obj.toString());
		    } catch (CoolsmsException e) {
		      System.out.println(e.getMessage());
		      System.out.println(e.getCode());
		    }
		    
		    
		    HashMap<String, String> params1 = new HashMap<String, String>();
		    params1.put("to", tel2);
		    params1.put("from", "01029937927");
		    params1.put("type", "SMS");
		    params1.put("text", "고객님께서 등록하신 "+prodVo.getPro_nm()+" 상품이 판매되었습니다.");
		    params1.put("app_version", "test app 1.2"); 
	
		    try {
		      JSONObject obj1 = (JSONObject) coolsms.send(params1);
		      System.out.println(obj1.toString());
		    } catch (CoolsmsException e) {
		      System.out.println(e.getMessage());
		      System.out.println(e.getCode());
		    }
        
        
        }
        
        
        request.getRequestDispatcher("jsp/buy_product.jsp").forward(request, response);
        
        
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
