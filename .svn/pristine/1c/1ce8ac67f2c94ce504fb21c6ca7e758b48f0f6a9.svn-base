package kr.or.ddit.cfms.service;

import java.util.List;

import kr.or.ddit.cfms.dao.CustomerDaoImpl;
import kr.or.ddit.cfms.dao.ICustomerDao;
import kr.or.ddit.cfms.vo.CustomerVO;

public class CustomerServiceImpl implements ICustomerService{
	private ICustomerDao dao;
	
	private static CustomerServiceImpl service;
	
	private CustomerServiceImpl() {
		dao = CustomerDaoImpl.getInstance();
	}
	
	public static CustomerServiceImpl getInstance() {
		if(service==null) service = new CustomerServiceImpl();
		return service;
	}
	
	@Override
	public List<CustomerVO> getAllCus() {
		return dao.getAllCus();
	}

	// 유저정보 가져와버리기 
	@Override
	public CustomerVO userInfo(String userId) {
		
		return dao.userInfo(userId);
	}

	// 신고횟수 업데이트하는 메서드
	@Override
	public int updateCus(String selid) {
		return dao.updateCus(selid);
	}

	@Override
	public int updateCusnick(CustomerVO vo) {
		return dao.updateCusnick(vo);
	}

	@Override
	public int updateCuspass(CustomerVO vo) {
		return dao.updateCuspass(vo);
	}

	@Override
	public int updateCusmail(CustomerVO vo) {
		return dao.updateCusmail(vo);
	}

	@Override
	public int deleteCus(String cusid) {
		
		return dao.deleteCus(cusid);
	}

}
