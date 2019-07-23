package com.spring.biz;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.biz.vo.OptionsVO;

@Service("OptionsService")
public class OptionsServiceImp implements OptionsService {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//옵션 리스트
		public OptionsVO selectOptions(OptionsVO vo) {
			return sqlSession.selectOne("selectOptions", vo);
		}
}
