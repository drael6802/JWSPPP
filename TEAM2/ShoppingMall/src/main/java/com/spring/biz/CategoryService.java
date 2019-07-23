package com.spring.biz;

import java.util.List;

import com.spring.biz.vo.Category02VO;
import com.spring.biz.vo.Category03VO;
import com.spring.biz.vo.CategoryVO;

public interface CategoryService {
	//카테고리 리스트 출력
	public List<CategoryVO> selectCategoryList(CategoryVO vo);
	
	//카테고리 02 리스트 출력
	public List<Category02VO> selectCategory02List(Category02VO vo);
	
	//카테고리 03 리스트 출력
	public List<Category03VO> selectCategory03List(Category03VO vo);
	
	//카테고리 모든 리스트 출력
	public Category03VO selectCategoryAllList(Category03VO category03VO);
}
