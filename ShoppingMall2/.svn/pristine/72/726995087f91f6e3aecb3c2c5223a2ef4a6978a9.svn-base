package com.spring.biz;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.biz.vo.UserVO;

@Service("UserService")
public class UserServiceImp implements UserService {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//회원 가입
	@Override
	@Transactional(rollbackFor = Exception.class)
	public int insertUser(UserVO vo) {
		UserVO result = idChcek(vo);
		System.out.println("==>" + result);
		if (result == null) {
			return sqlSession.insert("insertUser", vo);
		}else {
			return 0;
		}

	}
	//회원 로그인
	@Override
	public UserVO loginUser(UserVO vo) {
		return sqlSession.selectOne("selectLogin" , vo);
		
	}
	//회원 아이디 체크
	@Override
	public UserVO idChcek(UserVO vo) {
		return sqlSession.selectOne("selectIdChcek", vo);
	}
	//회원 조회
	public List<UserVO> selectUserIdList(UserVO vo) {
		if (vo.getPageIndex() == 0) {
			vo.setPageIndex(1);
		}
		return sqlSession.selectList("selectUserIdList" , vo);
	}
	//회원 조회 디테일
	@Override
	public UserVO selectUserDetail(UserVO vo) {
		return sqlSession.selectOne("selectUserDetail", vo);
	}
	@Override
	public UserVO idFind(UserVO vo) {
		return sqlSession.selectOne("selectIdFind", vo);
	}
	@Override
	public UserVO emailChcek(UserVO vo) {
		return sqlSession.selectOne("selectEmailChcek", vo);
	}
	//비밀번호 변경
	@Override
	public int PasswordUpdate(UserVO vo) {
		return sqlSession.update("PasswordUpdate", vo);
	}
	//회원 주소 변경
	@Override
	public int addressUpdate(UserVO vo) {
		return sqlSession.update("addressUpdate", vo);
	}
}
