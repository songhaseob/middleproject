package kr.or.ddit.cfms.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.cfms.util.BuildedSqlMapClient;
import kr.or.ddit.cfms.vo.BlackListVO;
import kr.or.ddit.cfms.vo.BlackcusVO;

public class BlacklistdaoImpl implements IBlacklistdao{
	private SqlMapClient smc;
	
	private static BlacklistdaoImpl dao;
	
	private BlacklistdaoImpl() {
		smc = BuildedSqlMapClient.getSqlMapClient();
	}
	
	public static BlacklistdaoImpl getInstance() {
		if(dao == null) dao = new BlacklistdaoImpl();
		return dao;
	}
	
	@Override
	public List<BlackListVO> getAllblacklist() {
		List<BlackListVO> list = null;
		
		try {
			list = smc.queryForList("blacklist.getAllblacklist");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<BlackcusVO> getAllblackcus() {
		List<BlackcusVO> list = null;
		
		try {
			list = smc.queryForList("blackcus.getAllblackcus");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public BlackListVO getBlacklist(String cusid) {
		BlackListVO listvo = null;
		
		try {
			listvo = (BlackListVO)smc.queryForObject("blacklist.getBlacklist", cusid);
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return listvo;
	}

	@Override
	public BlackcusVO getBlackcus(String cusid) {
		BlackcusVO listvo = null;
		
		try {
			listvo = (BlackcusVO)smc.queryForObject("blackcus.getBlackcus", cusid);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return listvo;
	}

	@Override
	public int insertBlacklist(BlackListVO vo) {
		int cnt = 0;
		
		try {
			Object obj = smc.insert("blacklist.insertBlacklist", vo);
			if(obj == null) {
				cnt = 1;
			}else {
				cnt = 0;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int deleteBlacklist(String listnum) {
		int cnt = 0;
		
		try {
			cnt = smc.delete("blacklist.deleteBlacklist", listnum);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return cnt;
	}

	@Override
	public int insertBlackcus(BlackcusVO vo) {
		int cnt = 0;
		
		try {
			Object obj = smc.insert("blackcus.insertBlackcus", vo);
				if(obj == null) {
					cnt = 1;
				}else {
					cnt = 0;
				} 
		} catch (SQLException e) {
			e.printStackTrace();
		}	
		return cnt;
	}

	@Override
	public int deleteBlackcus(String cus_id) {
		int cnt = 0;
		
		try {
			cnt = smc.delete("blackcus.deleteBlackcus", cus_id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	

}
