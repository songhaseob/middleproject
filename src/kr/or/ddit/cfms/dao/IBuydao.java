package kr.or.ddit.cfms.dao;

import java.util.List;

import kr.or.ddit.cfms.vo.BuyVO;

public interface IBuydao {
	
	// 구매리스트 뽑아오는 메서드 (이수훈)
		public List<BuyVO> getAllbuy();

}
