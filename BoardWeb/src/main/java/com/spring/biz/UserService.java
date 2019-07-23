package com.spring.biz;

import com.spring.biz.vo.UserVO;

public interface UserService {
	//로그인
	public UserVO login(UserVO vo);
	//유저 정보 인포
	public UserVO selectUserInfo(UserVO vo);
}
