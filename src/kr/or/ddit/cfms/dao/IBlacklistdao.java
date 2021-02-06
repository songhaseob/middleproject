package kr.or.ddit.cfms.dao;

import java.util.List;

import kr.or.ddit.cfms.vo.BlackListVO;
import kr.or.ddit.cfms.vo.BlackcusVO;

public interface IBlacklistdao {
	
	// 블랙리스트 정보를 가져오는 메서드
	public List<BlackListVO> getAllblacklist();
	
	// 블랙리스트회원 정보를 가져옴
	public List<BlackcusVO> getAllblackcus();
	
	// 블랙리스트 회원 정보 하나 가져오기 
	public BlackListVO getBlacklist(String cusid);
	
	// 블랙리스트 정보를 하나 가져옴
	public BlackcusVO getBlackcus(String cusid);
	
	// 블랙리스트에 인서트 해버리기
	public int insertBlacklist(BlackListVO vo);
	
	// 삭제해버리기
	public int deleteBlacklist(String listnum);
	
	// 블랙회원에 인서트 해버리기
	public int insertBlackcus(BlackcusVO vo);
	
	// 블랙회원을 일반회원으로 변경하는 메서드
	public int deleteBlackcus(String cus_id);
	

}
