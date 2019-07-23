package com.spring.biz;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.biz.vo.Category02VO;
import com.spring.biz.vo.Category03VO;
import com.spring.biz.vo.CategoryVO;

@Service("CategoryService")
public class CategoryServiceImp implements CategoryService{
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//카테고리 리스트 출력
	@Override
	public List<CategoryVO> selectCategoryList(CategoryVO vo) {
		
		return sqlSession.selectList("selectCategoryList", vo);
	}

	//카테고리 02 리스트 출력
	@Override
	public List<Category02VO> selectCategory02List(Category02VO vo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("selectCategory02List", vo);
	}

	//카테고리 03 리스트 출력
	@Override
	public List<Category03VO> selectCategory03List(Category03VO vo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("selectCategory03List", vo);
	}

	//카테고리 모든 리스트 출력
	@Override
	public Category03VO selectCategoryAllList(Category03VO category03vo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("selectCategoryAllList", category03vo );
	}



	
	
}
