package com.spring.biz;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.biz.vo.TestVO;

@Service("TestSertvice")
public class TestServiceImp implements TestSertvice{
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//selectItemList
	@Override
	public List<TestVO> selectItemList(TestVO vo) {
		return sqlSession.selectList("selectItemList", vo);
	}

	@Override
	public int insertItem(TestVO vo) {
		return sqlSession.insert("insertItem", vo);
	}
	
}
