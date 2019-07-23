package com.spring.biz;

import java.util.List;

import com.spring.biz.vo.CartVO;
import com.spring.biz.vo.ItemVO;
import com.spring.biz.vo.buyVO;


public interface CartService {
		//카트 리스트
		public List<CartVO> selectCartList(CartVO vo);
		
		//카트 인서트
		public int insertCart (List<CartVO> CartVOList , CartVO cartVO);
		//카트 인서트시 중복 일떄 수량 업데이트
		
		//카트 수량 업데이트
		public int updateCartCount (CartVO cartVO);
		
		//카트 삭제 업데이트
		public int deleteCart (CartVO cartVO);
		
		//카트 바이리스트 업데이트 및 삭제
		public int insetBuyList (CartVO cartVO , buyVO buyVO , ItemVO itemVO);
		
		//카드 수량 업데이트
		public int cartCountUpate(CartVO cartVO);
		
		//카드 수량 업데이트
		public List<buyVO> buyList(buyVO buyVO);
		
		//바로구매
		public int baroInsetBuyList ( buyVO buyVO , ItemVO itemVO);
		
		//장바구니 카운트
		public int buyCount ( buyVO buyVO);

}
