package kr.or.ddit.cfms.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.cfms.util.BuildedSqlMapClient;
import kr.or.ddit.cfms.vo.BuyVO;

public class BuydaoImpl implements IBuydao {
	static SqlMapClient smc;
	
	private static BuydaoImpl dao;
	
	private BuydaoImpl() {
		smc = BuildedSqlMapClient.getSqlMapClient();
	}
	
	public static BuydaoImpl getInstance() {
		if(dao==null) dao = new BuydaoImpl();
		return dao;
	}
	
	
	@Override
	public List<BuyVO> getAllbuy() {
		List<BuyVO> list = null;
		
		try {
			list = smc.queryForList("buy.getAllbuy");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

}
