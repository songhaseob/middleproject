package kr.or.ddit.cfms.service;

import java.util.List;

import kr.or.ddit.cfms.dao.IProductDao;
import kr.or.ddit.cfms.dao.ProductDaoImpl;
import kr.or.ddit.cfms.vo.ProductVO;

public class ProductServiceImpl implements IProductService{
	private IProductDao dao;
	
	private static ProductServiceImpl service;
	
	private ProductServiceImpl() {
		dao = ProductDaoImpl.getInstance();
	}
	
	public static ProductServiceImpl getInstance() {
		if(service == null) service = new ProductServiceImpl();
		return service;
	}
		
	
	
	// 리스트 넘버를 매개변수로 상품을 리스트로 뽑는 메서드드드드드드드드드드드드다다ㅏ두다다다 <수훈>
	@Override
	public List<ProductVO> getProdbynum(int num) {
		
		return dao.getProdbynum(num);
	}

}
