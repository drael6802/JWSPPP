package com.spring.biz;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.biz.vo.BoardVO;

@Service("boardService")
public class BoardServiceImp implements BoardService {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//보드 리스트 출력ㄴ
	public List<BoardVO> bardList(BoardVO vo) {
		return sqlSession.selectList("selectBoardList" , vo);
	}
	//보드 게시글 등록
	public int bardInsert(BoardVO vo) {
		return sqlSession.insert("insertBoard", vo);
	}
	//보드 게시글 상세보기
	@Override
	public BoardVO boardInfo(BoardVO vo) {
		return sqlSession.selectOne("selectBoardInfo", vo);
	}
	//보드 게기글 삭제
	@Override
	public int boardDelete(BoardVO vo) {
		return sqlSession.delete("deleteBoard", vo);
	}
	
	//updateBoard 보드 게시글 수정 업데이트 
	public int boardupdate(BoardVO vo) {
		return sqlSession.update("updateBoard", vo);
	}
	//조회수
	@Override
	public int boaedCount(BoardVO vo) {
		return sqlSession.update("updateContent", vo);
	}

}
