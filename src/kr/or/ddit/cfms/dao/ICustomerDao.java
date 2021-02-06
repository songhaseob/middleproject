package kr.or.ddit.cfms.dao;

import java.util.List;

import kr.or.ddit.cfms.vo.CustomerVO;

public interface ICustomerDao {
	
	// 회원 정보를 가져오는 메서드 (이수훈)
	public List<CustomerVO> getAllCus();
	
	// 유저 정보를 가져오는 메서드 (이수훈)
	public CustomerVO userInfo(String userId);
	
	// 신고횟수를 업데이트 하는 메서드(이수훈)
	public int updateCus(String selid);
	
	// 회원의 닉네임을 수정하는 메서드(이수훈)
	public int updateCusnick(CustomerVO vo);
	
	// 회원의 비밀번호를 수정하는 메서드(이수훈)
	public int updateCuspass(CustomerVO vo);
	
	// 회원의 이메일을 수정하는 메서드(이수훈)
	public int updateCusmail(CustomerVO vo);
	
	// 회원 탈퇴 때려버리는 메서드 이수훈수이
	public int deleteCus(String cusid);
	
	
}
