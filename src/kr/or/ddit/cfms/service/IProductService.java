package kr.or.ddit.cfms.service;

import java.util.List;

import kr.or.ddit.cfms.vo.ProductVO;

public interface IProductService {
	
	// 게시글 번호를 매개값으로 상품 리스트를 가져오는 메서드
	List<ProductVO> getProdbynum(int num);

}
