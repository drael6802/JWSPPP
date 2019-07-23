package com.spring.biz;

import java.util.List;

import com.spring.biz.vo.UserVO;

public interface UserService {
	
	//회원 조회
	public List<UserVO> selectUserIdList(UserVO vo);
	//회원 가입
	public int insertUser(UserVO vo);
	//회원 로그인
	public UserVO loginUser(UserVO vo);
	//회원 아이디 체크
	public UserVO idChcek(UserVO vo);
	//회원 아이디 체크
	public UserVO selectUserDetail(UserVO vo);
	//회원 아이디 찾기 
	public UserVO idFind (UserVO vo);
	//회원 아이디 찾기 
	public UserVO emailChcek (UserVO vo);
	//회원 비밀번호 변경
	public int PasswordUpdate (UserVO vo);
	//회원 주소 변경
	public int addressUpdate (UserVO vo);
}
