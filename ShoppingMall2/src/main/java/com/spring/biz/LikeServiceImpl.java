package com.spring.biz;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.biz.vo.LikeVO;

@Service("LikeService")
public class LikeServiceImpl implements LikeService {
	@Autowired
	private SqlSessionTemplate sqlSession;

	//좋아요 셀렉트
	@Override
	public LikeVO selectLike(LikeVO likeVO) {
		LikeVO result = sqlSession.selectOne("selectLike" , likeVO);
		return result;
	}

	//인서트 및 업데이트
	@Override
	@Transactional(rollbackFor = Exception.class)
	public LikeVO insertLike(LikeVO likeVO) {
		LikeVO likeVO2 = selectLike(likeVO);
		if (likeVO2 == null) {
			sqlSession.insert("insertLike", likeVO);
		}else if(likeVO2 != null) {
			String likeState = likeVO2.getLikeState();
			if (likeState.equals("Y")) {
				likeVO.setLikeState("N");
				
			}else if(likeState.equals("N")) {
				likeVO.setLikeState("Y");
			}
			
			sqlSession.update("updateLike" , likeVO);
		
		}
		likeVO = selectLike(likeVO);
		
		return likeVO;
	}

	//리스트 출력
	@Override
	public List<LikeVO> selectLikeStateYList(LikeVO likeVO) {
		
		return sqlSession.selectList("selectLikeStateYList", likeVO);
	}
	
	//좋아요 카운트
	@Override
	public int selectLikeCount(LikeVO likeVO) {
		
		return sqlSession.selectOne("selectLikeCount", likeVO);
	}

}
