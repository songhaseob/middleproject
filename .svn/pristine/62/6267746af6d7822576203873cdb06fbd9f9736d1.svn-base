package kr.or.ddit.cfms.service;

import java.util.List;

import kr.or.ddit.cfms.dao.CFMSBoardDaoimpl;
import kr.or.ddit.cfms.dao.ICFMSBoardDao;
import kr.or.ddit.cfms.vo.CFMSBoardlistVO;

public class CFMSBoardServiceImpl implements ICFMSBoardService{
	private ICFMSBoardDao dao;
	
	private static CFMSBoardServiceImpl service;
	
	private CFMSBoardServiceImpl() {
		dao = CFMSBoardDaoimpl.getInstance();
	}
	
	public static CFMSBoardServiceImpl getInstance() {
		if(service==null) service = new CFMSBoardServiceImpl();
		return service;
	}

	@Override
	public List<CFMSBoardlistVO> getAllBoardlist() {
		return dao.getAllBoardlist();
	}

	@Override
	public List<CFMSBoardlistVO> getDetailBoardlist(CFMSBoardlistVO vo) {
		return dao.getDetailBoardlist(vo);
	}

	@Override
	public int updateBoard(CFMSBoardlistVO vo) {
		
		return dao.updateBoard(vo);
	}
	@Override
	public int insertBoard(CFMSBoardlistVO vo) {
		
		return dao.insertBoard(vo);
	}

	@Override
	public int deleteBoard(int seq) {
		
		return dao.deleteBoard(seq);
	}

	@Override
	public int insertFaqBoard(CFMSBoardlistVO vo) {
		
		return dao.insertFaqBoard(vo);
	}
	
}
