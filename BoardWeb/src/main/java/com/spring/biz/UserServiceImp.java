package com.spring.biz;



import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.biz.vo.UserVO;

@Service("userService")
public class UserServiceImp implements UserService {
	@Autowired
	private SqlSessionTemplate sqlSession;
	//로그인
	@Override
	public UserVO login(UserVO vo) {
		UserVO result = sqlSession.selectOne("login", vo);
		return result;
	}
	//유저 정보 인포
	@Override
	public UserVO selectUserInfo(UserVO vo) {
		return  sqlSession.selectOne("selectUserInfo", vo);
	}

}
