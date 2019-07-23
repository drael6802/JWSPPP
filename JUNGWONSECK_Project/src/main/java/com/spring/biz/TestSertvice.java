package com.spring.biz;

import java.util.List;

import com.spring.biz.vo.TestVO;


public interface TestSertvice {
	
	public List<TestVO> selectItemList(TestVO vo);
	
	public int insertItem(TestVO vo);
}
