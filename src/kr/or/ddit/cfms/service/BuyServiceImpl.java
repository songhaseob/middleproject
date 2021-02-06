package kr.or.ddit.cfms.service;

import java.util.List;

import kr.or.ddit.cfms.dao.BuydaoImpl;
import kr.or.ddit.cfms.dao.IBuydao;
import kr.or.ddit.cfms.vo.BuyVO;

public class BuyServiceImpl implements IBuyService{
	private IBuydao dao;
	
	private static BuyServiceImpl service;
	
	private BuyServiceImpl() {
		dao = BuydaoImpl.getInstance();
	}
	
	public static BuyServiceImpl getInstance() {
		if(service == null) service = new BuyServiceImpl();
		return service;
	}
	
	@Override
	public List<BuyVO> getAllbuy() {
		return dao.getAllbuy();
	}

}
