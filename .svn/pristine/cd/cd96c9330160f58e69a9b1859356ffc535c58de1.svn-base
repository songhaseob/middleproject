package kr.or.ddit.cfms.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.cfms.util.BuildedSqlMapClient;
import kr.or.ddit.cfms.vo.CustomerVO;

public class CustomerDaoImpl implements ICustomerDao{
	private SqlMapClient smc;
	
	private static CustomerDaoImpl dao;
	
	private CustomerDaoImpl() {
		smc = BuildedSqlMapClient.getSqlMapClient();
	}
	
	public static CustomerDaoImpl getInstance() {
		if(dao==null) dao = new CustomerDaoImpl();
		return dao;
	}
	
	
	@Override
	public List<CustomerVO> getAllCus() {
		List<CustomerVO> list = null;
		
		try {
			list = smc.queryForList("customer.getAllCus");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public CustomerVO userInfo(String userId) {
		CustomerVO vo = null;
		
		try {
			vo = (CustomerVO)smc.queryForObject("customer.userInfo", userId);
		} catch (SQLException e) {	
			e.printStackTrace();
		}
		
		return vo;
	}

	@Override
	public int updateCus(String selid) {
		int cnt = 0;
		
		try {
			cnt = smc.update("customer.updateCus", selid);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int updateCusnick(CustomerVO vo) {
		int cnt = 0;
		
		try {
			cnt = smc.update("customer.updateCusnick", vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int updateCuspass(CustomerVO vo) {
		int cnt = 0;
		
		try {
			cnt = smc.update("customer.updateCuspass", vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int updateCusmail(CustomerVO vo) {
		int cnt = 0;
		
		try {
			cnt = smc.update("customer.updateCusmail", vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int deleteCus(String cusid) {
		int cnt = 0;
		
		try {
			cnt = smc.delete("customer.deleteCus", cusid);
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return cnt;
	}
	
	

}
