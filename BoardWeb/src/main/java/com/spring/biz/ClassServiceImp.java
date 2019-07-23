package com.spring.biz;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.biz.vo.ClassVO;

@Service("ClassService")
public class ClassServiceImp implements ClassService {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//
	public List<ClassVO> selectLsitCalss() {
		return sqlSession.selectList("selectListClass", new ClassVO());
	}

}
