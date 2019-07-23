package com.spring.biz;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.biz.vo.CartVO;
import com.spring.biz.vo.ItemVO;
import com.spring.biz.vo.buyVO;

@Service("CartService")
public class CartServiceImp implements CartService {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//카트 리스트
	@Override
	public List<CartVO> selectCartList(CartVO vo) {
		return sqlSession.selectList("selectCartList" , vo);
	}
	
	//카트 인서트 && 수량 얻데이트
	public int insertCart(List<CartVO> CartVOList , CartVO cartVO ) {
			//카트 셀렉트 
		CartVO result01 = sqlSession.selectOne("selectCartCheck", cartVO);
		if (result01 == null ) {
			//카트 셀렉트 값이 0이면 카트 인서트
			System.out.println("카트 인서트");
			return sqlSession.insert("insertCart", CartVOList) ;
		}else {
			//카트 인서트 값이 0이 아니라면 카트 수량 업데이트 
			System.out.println("카트 수량 업데이트 ");
			return sqlSession.update("updateCartCoynt", CartVOList); 
		}
	}
	
	//카드 딜리트 
	@Override
	public int deleteCart(CartVO cartVO) {
		return sqlSession.delete("deleteCart", cartVO);
	}

	//카트 카운트 업데이트
	@Override
	public int updateCartCount(CartVO cartVO) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	//카트 바이리스트 인서트 및 삭제
	@Override
	@Transactional(rollbackFor = Exception.class)
	public int insetBuyList(CartVO cartVO , buyVO buyVO , ItemVO itemVO) {
		//카드 리스트 셀렉트
		buyVO.setCartVOList(selectCartList(cartVO));
		//구매 리스트 인서트
		int result1 = sqlSession.insert("insertbuyList", buyVO);
		//아이템 재고 업데이트
		int result2 =sqlSession.update("updateItemSales", buyVO);
		//카드 리스트 삭제
		int result3 = deleteCart(cartVO);
		if (result1 != 0 && result2 != 0 && result3 != 0) {
			return result1 + result2 + result3 ;
		}else {
			return 0;
		}
	}
	
	//카트 수량 업데이트 
	public int cartCountUpate(CartVO cartVO) {
		return sqlSession.update("cartCountUpate", cartVO);
	}
	
	//바이 리스트
	@Override
	public List<buyVO> buyList(buyVO buyVO) {
		return sqlSession.selectList("selectBuyList", buyVO);
	}

	//바로 구매 baroInsetBuyList
	@Override
	@Transactional(rollbackFor = Exception.class)
	public int baroInsetBuyList(buyVO buyVO, ItemVO itemVO) {
		//바로구매 인서트
		int result1 = sqlSession.insert("baroInsertbuyList", buyVO);
		//아이템 재고 업데이트
		int result2 = sqlSession.update("updateItemSalesBuyVOList", buyVO);
		return result1 + result2;
	}
	
	// 리스트 개수
	@Override
	public int buyCount(buyVO buyVO) {
		
		return sqlSession.selectOne("selectBuyCount", buyVO);
	}


}
