package com.spring.biz;

import java.util.List;

import com.spring.biz.vo.ItemVO;
import com.spring.biz.vo.OptionsVO;


public interface ItemService {
	
	//상품 리스트
	public List<ItemVO> selectItemList(ItemVO vo);
	
	public int rowNumCount(ItemVO itemVO);
	
	//NVL 코드 셀렉트
	public ItemVO selectItemNVL(ItemVO vo);
	
	//상품 인서트
	public int insertItem(ItemVO itemVO , OptionsVO optionsVO );

	//상품 상세보기
	public ItemVO selectItemInfo(ItemVO itemVO );
	
	//상품 업데이트
	public int itemUpdate(ItemVO itemVO );
	
	//상품 삭제
	public int deleteItem(ItemVO itemVO );

	
}
