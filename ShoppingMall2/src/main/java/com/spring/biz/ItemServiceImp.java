package com.spring.biz;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.biz.vo.Category03VO;
import com.spring.biz.vo.ItemVO;
import com.spring.biz.vo.OptionsVO;

@Service("ItemService")
public class ItemServiceImp implements ItemService {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//상품 리스트 
	@Override
	public List<ItemVO> selectItemList(ItemVO itemVO) {
		if (itemVO.getPageIndex() == 0) {
			itemVO.setPageIndex(1);
		}
		return sqlSession.selectList("selectItemList" , itemVO);
	}
	
	//로우넘 카운트
	public int rowNumCount(ItemVO itemVO) {
		
		return sqlSession.selectOne("rowNumCount", itemVO);
		
	}
	
	//상품 인서트
	@Override
	@Transactional(rollbackFor = Exception.class)
	public int insertItem(ItemVO itemVO, OptionsVO optionsVO ) {
		int boogunItemcodeNVL = sqlSession.selectOne("boogunItemcodeNVL");
		int boogunOptionscodeNVL = sqlSession.selectOne("boogunOptionscodeNVL");
		
		itemVO.setItemCode(boogunItemcodeNVL);
		itemVO.setOptionsCode(boogunOptionscodeNVL);
		System.out.println(itemVO.toString());
		System.out.println(optionsVO.toString());
		int result01 = sqlSession.insert("insertItem" , itemVO);
		int result02 = 0;
		if (optionsVO.getOptions01() != null) {
			optionsVO.setItemCode(boogunItemcodeNVL);
			optionsVO.setOptionsCode(boogunOptionscodeNVL);
			result02 = sqlSession.insert("insertOptions" , optionsVO);
		}
		return result02 + result01;
	}
	//NVL 코드 셀렉트
	@Override
	public ItemVO selectItemNVL(ItemVO vo) {
		return sqlSession.selectOne("selectItemNVL", vo);
	}
	
	//상품 상세보기 
	@Override
	@Transactional(rollbackFor = Exception.class)
	public ItemVO selectItemInfo(ItemVO itemVO) {
		itemVO = sqlSession.selectOne("selectItemInfo", itemVO);
		if (itemVO != null) {
			sqlSession.update("updateView", itemVO);
			return  itemVO ;
		}
		return null ;
	}
	
	//삭품 삭제
	@Override
	public int deleteItem(ItemVO itemVO) {
		return sqlSession.update("deleteItem", itemVO);
	}
	//상품 업데이트
	@Override
	public int itemUpdate(ItemVO itemVO) {
		return sqlSession.update("itemUpdate", itemVO);
	}
	
	
	
}
