package kr.or.ddit.cfms.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.cfms.util.BuildedSqlMapClient;
import kr.or.ddit.cfms.vo.ProductVO;

public class ProductDaoImpl implements IProductDao{
	private SqlMapClient smc;
	
	private static ProductDaoImpl dao;
	
	private ProductDaoImpl() {
		smc = BuildedSqlMapClient.getSqlMapClient();
	}
	
	public static ProductDaoImpl getInstance() {
		if(dao==null) dao = new ProductDaoImpl();
		return dao;
	}
		
	
	// 리스트넘버를 매개변수로 상품 정보를 리스트로 뽑는 메서드드드드다다
	@Override
	public List<ProductVO> getProdbynum(int num) {
		List<ProductVO> list = null;
		
		try {
			list = smc.queryForList("product.getProdbynum", num);
		} catch (SQLException e) {	
			e.printStackTrace();
		};
		return null;
	}

}
