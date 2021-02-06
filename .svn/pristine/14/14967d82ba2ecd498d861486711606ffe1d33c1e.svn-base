package kr.or.ddit.cfms.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.cfms.util.BuildedSqlMapClient;
import kr.or.ddit.cfms.vo.BuyVO;
import kr.or.ddit.cfms.vo.CategoryVO;
import kr.or.ddit.cfms.vo.ChargeVO;
import kr.or.ddit.cfms.vo.CustomerVO;
import kr.or.ddit.cfms.vo.DateVO;
import kr.or.ddit.cfms.vo.ProductVO;
import kr.or.ddit.cfms.vo.ProlistVO;
import kr.or.ddit.cfms.vo.SelVO;

public class CFMSDaoImpl implements ICFMSDao {
	private SqlMapClient smc; // iBatis용 sqlMapClient객체 변수 선언

	// 1번
	private static CFMSDaoImpl dao;

	// 2번
	// DAO의 생성자에서 iBatis환경 설정과 sqlMapClient객체를 생성한다.
	private CFMSDaoImpl() {

		smc = BuildedSqlMapClient.getSqlMapClient();
	}

	// 3번
	public static CFMSDaoImpl getInstance() {
		if (dao == null)
			dao = new CFMSDaoImpl();
		return dao;
	}

	@Override
	public int insertPoint(ChargeVO charVO) throws SQLException {
		int cnt = 0;
		Object obj = smc.insert("cfms.insertPoint", charVO);
		if (obj == null) {

			cnt = smc.update("cfms.updatePoint", charVO);

		} else {
			cnt = 0;
		}

		return cnt;
	}

	// 로그인 (경찬)
	@Override
	public CustomerVO login(CustomerVO vo) {
		CustomerVO resId = null;

		try {
			resId = (CustomerVO) smc.queryForObject("cfms.loginid", vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return resId;
	}

	// 아이디 중복체크 (경찬)
	@Override
	public String cusId(String id) {
		String resId = null;

		try {
			resId = (String) smc.queryForObject("cfms.cusId", id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return resId;
	}

	// 닉네임 중복체크 (경찬)
	@Override
	public String cusNick(String nick) {
		String resId = null;

		try {
			resId = (String) smc.queryForObject("cfms.cusNick", nick);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return resId;
	}

	@Override
	public int insertProlist(ProlistVO proVO){
		int cnt = 0;
		Object obj;
		try {
			obj = smc.insert("prolist.insertProlist", proVO);
			if (obj == null) {
				cnt = 1;

			} else {
				cnt = 0;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		

		return cnt;
	}

	@Override
	public int insertProduct(ProductVO proVO){
		int cnt = 0;
		Object obj;
		try {
			obj = smc.insert("product.insertProduct", proVO);
			
			if (obj == null) {
				cnt = 1;

			} else {
				cnt = 0;
			}

			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return cnt;
	}

	@Override
	public int checkProductNum() throws SQLException {

		return (Integer) smc.queryForObject("product.checkProductNum");

	}

	@Override
	public List<ProlistVO> getAllProList() throws SQLException {
		// TODO Auto-generated method stub
		return smc.queryForList("prolist.getAllProList");
	}

	@Override
	public List<ProductVO> getAllProdList() throws SQLException {
		// TODO Auto-generated method stub
		return smc.queryForList("product.getAllProdList");
	}

	@Override
	public ProductVO getProduct(int num) throws SQLException {
		
		return (ProductVO)smc.queryForObject("product.getProduct",num);
	}

	@Override
	public ProlistVO getProList(int num) throws SQLException {
		return (ProlistVO)smc.queryForObject("prolist.getProList",num);
	}

	@Override
	public CustomerVO userInfo(String userId){
		
		CustomerVO vo = null;
		
		try {
			vo = (CustomerVO)smc.queryForObject("cfms.userInfo", userId);
		} catch (SQLException e) {
			vo = null;
			e.printStackTrace();
		}	
		
		return vo;
	}

	@Override
	public int buyProduct(BuyVO vo) {
		int cnt = 0;
		
		try {
			Object obj = smc.insert("buy.buyProduct", vo);
			if(obj==null) {
				cnt = 1;
			}else {
				cnt = 0;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
				
		return cnt;
	}

	@Override
	public int selProduct(SelVO vo) {
		int cnt = 0;
		
		try {
			Object obj = smc.insert("sel.selProduct", vo);
			if(obj==null) {
				cnt = 1;
			}else {
				cnt = 0;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
				
		return cnt;
	}

	@Override
	public int buyPoint(CustomerVO vo) {
		int cnt =0;
		
		try {
			cnt = smc.update("cfms.buyPoint",vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
		return cnt;
	}

	@Override
	public int selPoint(CustomerVO vo) {
		int cnt =0;
		
		try {
			cnt = smc.update("cfms.selPoint",vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
		return cnt;
	}

	@Override
	public int sellProductChange(int num) {
		int cnt =0;
		
		try {
			cnt = smc.update("prolist.sellProductChange",num);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
		return cnt;
	}

	@Override
	public List<ProductVO> categoryProduct(CategoryVO vo) {
		// TODO Auto-generated method stub
		List<ProductVO> list = null;
		
		try {
			list = smc.queryForList("product.categoryProduct",vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<ProlistVO> categoryProlist(CategoryVO vo) {
		// TODO Auto-generated method stub
		List<ProlistVO> list = null;
		
		try {
			list = smc.queryForList("prolist.categoryProlist",vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<ProductVO> searchProduct(String search) {
		List<ProductVO> list = null;
		
		try {
			list = smc.queryForList("product.searchProduct",search);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<ProlistVO> searchProlist(String search) {
		// TODO Auto-generated method stub
		List<ProlistVO> list = null;
		
		try {
			list = smc.queryForList("prolist.searchProlist",search);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<ChargeVO> myPointInfo(String userId) {
		List<ChargeVO> list = null;
		
		try {
			list = smc.queryForList("cfms.myPointInfo", userId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<ChargeVO> dayChargeList(DateVO dateVo) {
		List<ChargeVO> list = null;
		
		try {
			list = smc.queryForList("cfms.dayChargeList", dateVo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<ChargeVO> weekChargeList(DateVO dateVo) {
		List<ChargeVO> list = null;
		
		try {
			list = smc.queryForList("cfms.weekChargeList", dateVo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<ChargeVO> monthChargeList(DateVO dateVo) {
		List<ChargeVO> list = null;
		
		try {
			list = smc.queryForList("cfms.monthChargeList", dateVo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<ChargeVO> yearChargeList(DateVO dateVo) {
		List<ChargeVO> list = null;
		
		try {
			list = smc.queryForList("cfms.yearChargeList", dateVo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<ChargeVO> termChargeList(DateVO dateVo) {
		List<ChargeVO> list = null;
		
		try {
			list = smc.queryForList("cfms.termChargeList", dateVo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}

	//회원가입 정보 입력(경찬)
	@Override
	public String insertUser(CustomerVO invo) {
		String resId = null;

		try {
			resId = (String) smc.insert("cfms.insertUser", invo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return resId;
	}
	
	// 아이디찾기 할때 필요한 이메일 (경찬)
	@Override
	public String findId(String findId) {
		String resId = null;

		try {
			resId = (String) smc.queryForObject("cfms.findId", findId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return resId;
	}

	// 비밀번호 찾기 할때 필요한거 (경찬)
	@Override
	public String findPass(CustomerVO findPass) {
		String resId = null;

		try {
			resId = (String) smc.queryForObject("cfms.findPass", findPass);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return resId;
	}

	@Override
	public int upPass(CustomerVO id) {
		int resId = 0;

		try {
			resId = smc.update("cfms.upPass", id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return resId;
	}

	@Override
	public List<BuyVO> getDayBuy(DateVO dateVo) {
		 List<BuyVO> list = null;
		 
		 try {
			list = smc.queryForList("buy.getDayBuy",dateVo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
				 
		return list;
	}

	@Override
	public List<BuyVO> getWeekBuy(DateVO dateVo) {
		 List<BuyVO> list = null;
		 
		 try {
			list = smc.queryForList("buy.getWeekBuy",dateVo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
				 
		return list;
	}

	@Override
	public List<BuyVO> getMonthBuy(DateVO dateVo) {
		 List<BuyVO> list = null;
		 
		 try {
			list = smc.queryForList("buy.getMonthBuy",dateVo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
				 
		return list;
	}

	@Override
	public List<BuyVO> getYearBuy(DateVO dateVo) {
		 List<BuyVO> list = null;
		 
		 try {
			list = smc.queryForList("buy.getYearBuy",dateVo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
				 
		return list;
	}

	@Override
	public List<SelVO> getDaySel(DateVO dateVo) {
		List<SelVO> list = null;
		
		try {
			list = smc.queryForList("sel.getDaySel",dateVo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<SelVO> getWeekSel(DateVO dateVo) {
		List<SelVO> list = null;
		
		try {
			list = smc.queryForList("sel.getWeekSel",dateVo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<SelVO> getMonthSel(DateVO dateVo) {
		List<SelVO> list = null;
		
		try {
			list = smc.queryForList("sel.getMonthSel",dateVo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<SelVO> getYearSel(DateVO dateVo) {
		List<SelVO> list = null;
		
		try {
			list = smc.queryForList("sel.getYearSel",dateVo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<ProductVO> getPaymentProd(String data) {
		List<ProductVO> list = null;
		
		try {
			list = smc.queryForList("product.getPaymentProd",data);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<BuyVO> termBuyList(DateVO dateVo) {
		List<BuyVO> list = null;
		
		try {
			list = smc.queryForList("buy.termBuyList",dateVo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<SelVO> termSelList(DateVO dateVo) {
		List<SelVO> list = null;
		
		try {
			list = smc.queryForList("sel.termSelList",dateVo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
	
	@Override
	public List<BuyVO> allBuyList(String userId) {
		List<BuyVO> list = null;
		
		try {
			list = smc.queryForList("buy.allBuyList",userId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<SelVO> allSelList(String userId) {
		List<SelVO> list = null;
		
		try {
			list = smc.queryForList("sel.allSelList",userId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
	
	
	
	

	@Override
	public int deleteProlist(int listNum) {
		int cnt = 0;
		
		try {
			cnt = smc.delete("prolist.deleteProlist",listNum);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return cnt;
	}

	@Override
	public List<ChargeVO> adminDayChargeList(String date) {
		List<ChargeVO> list = null;
		
		try {
			list = smc.queryForList("cfms.adminDayChargeList", date);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<ChargeVO> adminWeekChargeList(String date) {
		List<ChargeVO> list = null;
		
		try {
			list = smc.queryForList("cfms.adminWeekChargeList", date);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<ChargeVO> adminMonthChargeList(String date) {
		List<ChargeVO> list = null;
		
		try {
			list = smc.queryForList("cfms.adminMonthChargeList", date);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<ChargeVO> adminYearChargeList(String date) {
		List<ChargeVO> list = null;
		
		try {
			list = smc.queryForList("cfms.adminYearChargeList", date);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<ChargeVO> adminTermChargeList(DateVO dateVo) {
		List<ChargeVO> list = null;
		
		try {
			list = smc.queryForList("cfms.adminTermChargeList", dateVo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<ChargeVO> adminAllChargeList() {
		List<ChargeVO> list = null;
		
		try {
			list = smc.queryForList("cfms.adminAllChargeList");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int userSelInfo(String userId) {
		int cnt = 0;
		
		try {
			cnt = (Integer)smc.queryForObject("sel.userSelInfo",userId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return cnt;
	}

	@Override
	public int userReportInfo(String userId) {
		int cnt = 0;
		
		try {
			cnt = (Integer)smc.queryForObject("customer.userReportInfo",userId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return cnt;
	}

	@Override
	public int updateProlist(ProlistVO listVo) {
		int cnt = 0;
		
		try {
			cnt = smc.update("prolist.updateProlist",listVo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return cnt;
	}

	@Override
	public int updateProdlist(ProductVO prodVo) {
		int cnt = 0;
		
		try {
			cnt = smc.update("product.updateProdlist",prodVo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return cnt;
	}

	// 비번 찾기할때 힌트로 하는거 (경찬)
	@Override
	public String findPass2(CustomerVO findPass2) {
		String resId = null;

		try {
			resId = (String) smc.queryForObject("cfms.findPass2", findPass2);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return resId;
	}



}
