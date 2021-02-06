package kr.or.ddit.cfms.dao;

import java.util.List;

import kr.or.ddit.cfms.vo.CFMSBoardlistVO;

public interface ICFMSBoardDao {
	
	// 공지사항 가져오는 메서드
	public List<CFMSBoardlistVO> getAllBoardlist();
	// 공지사항 선택 게시물 조회 메서드
	public List<CFMSBoardlistVO> getDetailBoardlist(CFMSBoardlistVO vo);
	// 공지사항 게시물 수정하는 메서드
	public int updateBoard(CFMSBoardlistVO vo);
	// 공지사항 게시물 수정하는 메서드
	public int insertBoard(CFMSBoardlistVO vo);
	// 공지사항 게시물 등록하는 메서드
	public int deleteBoard(int seq);
	// FAQ 게시물 등록하는 메서드
	public int insertFaqBoard(CFMSBoardlistVO vo);
}
