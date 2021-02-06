package kr.or.ddit.cfms.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.cfms.util.BuildedSqlMapClient;
import kr.or.ddit.cfms.vo.CFMSBoardlistVO;

public class CFMSBoardDaoimpl implements ICFMSBoardDao{
	private SqlMapClient smc;

	private static CFMSBoardDaoimpl dao;
	
	private CFMSBoardDaoimpl() {
		smc = BuildedSqlMapClient.getSqlMapClient();
	}
	
	public static CFMSBoardDaoimpl getInstance() {
		if(dao==null) dao = new CFMSBoardDaoimpl();
		return dao;
	}
	
	@Override
	public List<CFMSBoardlistVO> getAllBoardlist(){
		List<CFMSBoardlistVO> list = null;
		
		try {
			list = smc.queryForList("boardlist.getAllBoardlist");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	
		return list;
	}
	
	@Override
	public List<CFMSBoardlistVO> getDetailBoardlist(CFMSBoardlistVO vo){
		List<CFMSBoardlistVO> list = null;
		
		try {
			list = smc.queryForList("boardlist.getDetailBoardlist",vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	
		return list;
	}

	@Override
	public int updateBoard(CFMSBoardlistVO vo) {
		int cnt = 0;
		
		try {
			cnt = smc.update("boardlist.updateBoard", vo);
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return cnt;
	}
	

	@Override
	public int insertBoard(CFMSBoardlistVO vo) {
		int cnt = 0;
		
		try {
			cnt = smc.update("boardlist.insertBoard", vo);
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return cnt;
	}

	@Override
	public int deleteBoard(int seq) {
		int cnt =0;
		
		try {
			cnt = smc.delete("boardlist.deleteBoard",seq);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return cnt;
	}

	@Override
	public int insertFaqBoard(CFMSBoardlistVO vo) {
		int cnt = 0;
		
		try {
			
			Object obj = smc.insert("boardlist.insertFaqBoard", vo);
			if(obj==null) {
				cnt = 1;
			}else {
				cnt = 0;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
	}

}
