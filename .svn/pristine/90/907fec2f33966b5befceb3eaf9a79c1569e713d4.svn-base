package kr.or.ddit.cfms.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.cfms.dao.CFMSDaoImpl;
import kr.or.ddit.cfms.dao.ICFMSDao;
import kr.or.ddit.cfms.vo.BuyVO;
import kr.or.ddit.cfms.vo.CategoryVO;
import kr.or.ddit.cfms.vo.ChargeVO;
import kr.or.ddit.cfms.vo.CustomerVO;
import kr.or.ddit.cfms.vo.DateVO;
import kr.or.ddit.cfms.vo.ProductVO;
import kr.or.ddit.cfms.vo.ProlistVO;
import kr.or.ddit.cfms.vo.SelVO;

public class CFMSServiceImpl implements ICFMSService {
	private ICFMSDao dao; // DAO객체가 저장될 변수 선언
	private static CFMSServiceImpl service; // 1번

	// 생성자 - 2번
	// public MemberServiceImpl() {
	private CFMSServiceImpl() {
		// dao = new MemberDaoImpl();
		dao = CFMSDaoImpl.getInstance();
	}

	// 3번
	public static CFMSServiceImpl getInstance() {
		if (service == null)
			service = new CFMSServiceImpl();
		return service;
	}

	@Override
	public int insertPoint(ChargeVO charVO) {
		int cnt = 0;

		try {
			cnt = dao.insertPoint(charVO);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return cnt;
	}

	// 로그인 (경찬)
	@Override
	public CustomerVO login(CustomerVO vo) {
		return dao.login(vo);
	}

	// 아이디 중복체크 (경찬)
	@Override
	public String cusId(String id) {
		return dao.cusId(id);
	}

	// 닉네임 중복체크 (경찬)
	@Override
	public String cusNick(String nick) {
		return dao.cusNick(nick);
	}

	@Override
	public int insertProlist(ProlistVO proVO) {
		return dao.insertProlist(proVO);
	}

	@Override
	public int insertProduct(ProductVO proVO) {
		return dao.insertProduct(proVO);
	}

	@Override
	public int checkProductNum() {
		int res = 0;

		try {
			res = dao.checkProductNum();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public List<ProlistVO> getAllProList() {
		List<ProlistVO> list = null;

		try {
			list = dao.getAllProList();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<ProductVO> getAllProdList() {
		List<ProductVO> list = null;

		try {
			list = dao.getAllProdList();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public ProductVO getProduct(int num) {
		ProductVO vo = null;

		try {
			vo = dao.getProduct(num);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return vo;
	}

	@Override
	public ProlistVO getProList(int num) {
		ProlistVO vo = null;

		try {
			vo = dao.getProList(num);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return vo;
	}

	// 유저정보가져오기(선중)
	@Override
	public CustomerVO userInfo(String userId) {

		return dao.userInfo(userId);
	}

	@Override
	public int buyProduct(BuyVO vo) {
		// TODO Auto-generated method stub
		return dao.buyProduct(vo);
	}

	@Override
	public int selProduct(SelVO vo) {
		// TODO Auto-generated method stub
		return dao.selProduct(vo);
	}

	@Override
	public int buyPoint(CustomerVO vo) {
		// TODO Auto-generated method stub
		return dao.buyPoint(vo);
	}

	@Override
	public int selPoint(CustomerVO vo) {
		// TODO Auto-generated method stub
		return dao.selPoint(vo);
	}

	@Override
	public int sellProductChange(int num) {
		// TODO Auto-generated method stub
		return dao.sellProductChange(num);
	}

	@Override
	public List<ProductVO> categoryProduct(CategoryVO vo) {
		// TODO Auto-generated method stub
		return dao.categoryProduct(vo);
	}

	@Override
	public List<ProlistVO> categoryProlist(CategoryVO vo) {
		// TODO Auto-generated method stub
		return dao.categoryProlist(vo);
	}

	@Override
	public List<ProductVO> searchProduct(String search) {
		// TODO Auto-generated method stub
		return dao.searchProduct(search);
	}

	@Override
	public List<ProlistVO> searchProlist(String search) {
		// TODO Auto-generated method stub
		return dao.searchProlist(search);
	}

	@Override
	public List<ChargeVO> myPointInfo(String userId) {
		// TODO Auto-generated method stub
		return dao.myPointInfo(userId);
	}

	@Override
	public List<ChargeVO> dayChargeList(DateVO dateVo) {
		// TODO Auto-generated method stub
		return dao.dayChargeList(dateVo);
	}

	@Override
	public List<ChargeVO> weekChargeList(DateVO dateVo) {
		// TODO Auto-generated method stub
		return dao.weekChargeList(dateVo);
	}

	@Override
	public List<ChargeVO> monthChargeList(DateVO dateVo) {
		// TODO Auto-generated method stub
		return dao.monthChargeList(dateVo);
	}

	@Override
	public List<ChargeVO> yearChargeList(DateVO dateVo) {
		// TODO Auto-generated method stub
		return dao.yearChargeList(dateVo);
	}

	@Override
	public List<ChargeVO> termChargeList(DateVO dateVo) {
		// TODO Auto-generated method stub
		return dao.termChargeList(dateVo);
	}

	// 회원가입 정보 입력(경찬)
	@Override
	public String insertUser(CustomerVO invo) {
		return dao.insertUser(invo);
	}
	
	// 아이디찾기 할때 필요한 이메일 (경찬)
	@Override
	public String findId(String findId) {
		 
		return dao.findId(findId);
	}
	
	// 비밀번호 찾기 할때 필요한거 (경찬)
	@Override
	public String findPass(CustomerVO findPass) {
		return dao.findPass(findPass);
	}

	@Override
	public int upPass(CustomerVO id) {
		return dao.upPass(id);
	}
	@Override
	public List<BuyVO> getDayBuy(DateVO dateVo) {
		// TODO Auto-generated method stub
		return dao.getDayBuy(dateVo);
	}

	@Override
	public List<BuyVO> getWeekBuy(DateVO dateVo) {
		// TODO Auto-generated method stub
		return dao.getWeekBuy(dateVo);
	}

	@Override
	public List<BuyVO> getMonthBuy(DateVO dateVo) {
		// TODO Auto-generated method stub
		return dao.getMonthBuy(dateVo);
	}

	@Override
	public List<BuyVO> getYearBuy(DateVO dateVo) {
		// TODO Auto-generated method stub
		return dao.getYearBuy(dateVo);
	}

	@Override
	public List<SelVO> getDaySel(DateVO dateVo) {
		// TODO Auto-generated method stub
		return dao.getDaySel(dateVo);
	}

	@Override
	public List<SelVO> getWeekSel(DateVO dateVo) {
		// TODO Auto-generated method stub
		return dao.getWeekSel(dateVo);
	}

	@Override
	public List<SelVO> getMonthSel(DateVO dateVo) {
		// TODO Auto-generated method stub
		return dao.getMonthSel(dateVo);
	}

	@Override
	public List<SelVO> getYearSel(DateVO dateVo) {
		// TODO Auto-generated method stub
		return dao.getYearSel(dateVo);
	}

	@Override
	public List<ProductVO> getPaymentProd(String data) {
		// TODO Auto-generated method stub
		return dao.getPaymentProd(data);
	}

	@Override
	public List<BuyVO> termBuyList(DateVO dateVo) {
		// TODO Auto-generated method stub
		return dao.termBuyList(dateVo);
	}

	@Override
	public List<SelVO> termSelList(DateVO dateVo) {
		// TODO Auto-generated method stub
		return dao.termSelList(dateVo);
	}

	@Override
	public int deleteProlist(int listNum) {
		// TODO Auto-generated method stub
		return dao.deleteProlist(listNum);
	}

	@Override
	public List<ChargeVO> adminDayChargeList(String date) {
		// TODO Auto-generated method stub
		return dao.adminDayChargeList(date);
	}

	@Override
	public List<ChargeVO> adminWeekChargeList(String date) {
		// TODO Auto-generated method stub
		return dao.adminWeekChargeList(date);
	}

	@Override
	public List<ChargeVO> adminMonthChargeList(String date) {
		// TODO Auto-generated method stub
		return dao.adminMonthChargeList(date);
	}

	@Override
	public List<ChargeVO> adminYearChargeList(String date) {
		// TODO Auto-generated method stub
		return dao.adminYearChargeList(date);
	}

	@Override
	public List<ChargeVO> adminTermChargeList(DateVO dateVo) {
		// TODO Auto-generated method stub
		return dao.adminTermChargeList(dateVo);
	}

	@Override
	public List<ChargeVO> adminAllChargeList() {
		// TODO Auto-generated method stub
		return dao.adminAllChargeList();
	}

	@Override
	public int userSelInfo(String userId) {
		// TODO Auto-generated method stub
		return dao.userSelInfo(userId);
	}

	@Override
	public int userReportInfo(String userId) {
		// TODO Auto-generated method stub
		return dao.userReportInfo(userId);
	}

	@Override
	public int updateProlist(ProlistVO listVo) {
		// TODO Auto-generated method stub
		return dao.updateProlist(listVo);
	}

	@Override
	public int updateProdlist(ProductVO prodVo) {
		// TODO Auto-generated method stub
		return dao.updateProdlist(prodVo);
	}

	@Override
	public List<BuyVO> allBuyList(String userId) {
		// TODO Auto-generated method stub
		return dao.allBuyList(userId);
	}

	@Override
	public List<SelVO> allSelList(String userId) {
		// TODO Auto-generated method stub
		return dao.allSelList(userId);
	}

	@Override
	public String findPass2(CustomerVO findPass2) {
		return dao.findPass2(findPass2);
	}

}
