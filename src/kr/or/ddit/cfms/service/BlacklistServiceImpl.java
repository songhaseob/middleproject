package kr.or.ddit.cfms.service;

import java.util.List;

import kr.or.ddit.cfms.dao.BlacklistdaoImpl;
import kr.or.ddit.cfms.dao.IBlacklistdao;
import kr.or.ddit.cfms.vo.BlackListVO;
import kr.or.ddit.cfms.vo.BlackcusVO;

public class BlacklistServiceImpl implements IBlacklistService{
	private IBlacklistdao dao;
	
	private static BlacklistServiceImpl service;
	
	private BlacklistServiceImpl() {
		dao = BlacklistdaoImpl.getInstance();
	}
	
	public static BlacklistServiceImpl getInstance() {
		if(service == null) service = new BlacklistServiceImpl();
		return service;
	}
	
	@Override
	public List<BlackListVO> getAllblacklist() {
		
		return dao.getAllblacklist();
	}

	@Override
	public List<BlackcusVO> getAllblackcus() {
		
		return dao.getAllblackcus();
	}

	@Override
	public BlackListVO getBlacklist(String cusid) {
		return dao.getBlacklist(cusid);
	}

	@Override
	public BlackcusVO getBlackcus(String cusid) {
		return dao.getBlackcus(cusid);
		
	}

	@Override
	public int insertBlacklist(BlackListVO vo) {
		
		return dao.insertBlacklist(vo);
	}

	@Override
	public int deleteBlacklist(String listnum) {
		return dao.deleteBlacklist(listnum);
	}

	@Override
	public int insertBlackcus(BlackcusVO vo) {
		
		return dao.insertBlackcus(vo);
	}

	@Override
	public int deleteBlackcus(String cus_id) {
	
		return dao.deleteBlackcus(cus_id);
	}

	

}
