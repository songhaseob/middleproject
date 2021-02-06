package kr.or.ddit.cfms.service;

import java.util.List;

import kr.or.ddit.cfms.vo.BuyVO;
import kr.or.ddit.cfms.vo.CategoryVO;
import kr.or.ddit.cfms.vo.ChargeVO;

import kr.or.ddit.cfms.vo.CustomerVO;
import kr.or.ddit.cfms.vo.DateVO;
import kr.or.ddit.cfms.vo.ProductVO;
import kr.or.ddit.cfms.vo.ProlistVO;
import kr.or.ddit.cfms.vo.SelVO;

public interface ICFMSService {

	public int insertPoint(ChargeVO charVO);

	// 회원가입정보 입력(경찬)
	public String insertUser(CustomerVO invo);

	// 로그인 (경찬)
	public CustomerVO login(CustomerVO cvo);

	// 가입 아이디 중복 검사겸 아이디 찾기 (경찬)
	public String cusId(String id);

	// 가입 닉네임 중복 검사 (경찬)
	public String cusNick(String nick);

	// 비번찾기 할때 힌트로하는거(경찬)
	public String findPass2(CustomerVO findPass2);

	// 아이디찾기 할때 필요한 이메일 (경찬)
	public String findId(String findId);

	// 비밀번호 찾기 할때 필요한거 (경찬)
	public String findPass(CustomerVO findPass);

	// 임시비밀번호 받으면 업데이트하는거(경찬)
	public int upPass(CustomerVO id);

	public int insertProlist(ProlistVO proVO);

	public int insertProduct(ProductVO proVO);

	public int checkProductNum();

	public List<ProlistVO> getAllProList();

	public List<ProductVO> getAllProdList();

	public ProductVO getProduct(int num);

	public ProlistVO getProList(int num);

	public CustomerVO userInfo(String userId);

	// 상품 구매(선중)
	public int buyProduct(BuyVO vo);

	// 상품 판매(선중)
	public int selProduct(SelVO vo);

	// 구매 회원 포인트 감소(선중)
	public int buyPoint(CustomerVO vo);

	// 판매 회원 포인트 증가(선중)
	public int selPoint(CustomerVO vo);

	// 상품 판매처리(선중)
	public int sellProductChange(int num);

	// 카테고리 기능(선중)
	public List<ProductVO> categoryProduct(CategoryVO vo);

	// 카테고리 기능(선중)
	public List<ProlistVO> categoryProlist(CategoryVO vo);

	// 검색기능(선중)
	public List<ProductVO> searchProduct(String search);

	// 검색기능(선중)
	public List<ProlistVO> searchProlist(String search);

	// 충전내역(선중)
	public List<ChargeVO> myPointInfo(String userId);

	// 일별조회(선중)
	public List<ChargeVO> dayChargeList(DateVO dateVo);

	// 주별조회(선중)
	public List<ChargeVO> weekChargeList(DateVO dateVo);

	// 월별조회(선중)
	public List<ChargeVO> monthChargeList(DateVO dateVo);

	// 년별조회(선중)
	public List<ChargeVO> yearChargeList(DateVO dateVo);

	// 기간별조회(선중)
	public List<ChargeVO> termChargeList(DateVO dateVo);

	// 일별 구매상품 조회(선중)
	public List<BuyVO> getDayBuy(DateVO dateVo);

	// 주별 구매상품 조회(선중)
	public List<BuyVO> getWeekBuy(DateVO dateVo);

	// 월별 구매상품 조회(선중)
	public List<BuyVO> getMonthBuy(DateVO dateVo);

	// 년별 구매상품 조회(선중)
	public List<BuyVO> getYearBuy(DateVO dateVo);

	// 일별 판매상품 조회(선중)
	public List<SelVO> getDaySel(DateVO dateVo);

	// 주별 판매상품 조회(선중)
	public List<SelVO> getWeekSel(DateVO dateVo);

	// 월별 판매상품 조회(선중)
	public List<SelVO> getMonthSel(DateVO dateVo);

	// 년별 판매상품 조회(선중)
	public List<SelVO> getYearSel(DateVO dateVo);

	// 구매 및 판매 상품목록조회(선중)
	public List<ProductVO> getPaymentProd(String data);

	// 기간별 상품 구매목록 조회(선중)
	public List<BuyVO> termBuyList(DateVO dateVo);

	// 기간별 상품 판매목록 조회(선중)
	public List<SelVO> termSelList(DateVO dateVo);

	// 상품삭제(선중)
	public int deleteProlist(int listNum);

	// 총 상품 구매목록 조회(선중)
	public List<BuyVO> allBuyList(String userId);

	// 총 상품 판매목록 조회(선중)
	public List<SelVO> allSelList(String userId);

	// 관리자 결제 일별조회(선중)
	public List<ChargeVO> adminDayChargeList(String date);

	// 관리자 결제 주별조회(선중)
	public List<ChargeVO> adminWeekChargeList(String date);

	// 관리자 결제 월별조회(선중)
	public List<ChargeVO> adminMonthChargeList(String date);

	// 관리자 결제 년별조회(선중)
	public List<ChargeVO> adminYearChargeList(String date);

	// 관리자 결제 기간별조회(선중)
	public List<ChargeVO> adminTermChargeList(DateVO dateVo);

	// 관리자 결제 총조회(선중)
	public List<ChargeVO> adminAllChargeList();

	// 유저 판매정보 가져오기(선중)
	public int userSelInfo(String userId);

	// 유저 신고횟수 가져오기(선중)
	public int userReportInfo(String userId);

	// 상품게시글 수정(선중)
	public int updateProlist(ProlistVO listVo);

	public int updateProdlist(ProductVO prodVo);

}
