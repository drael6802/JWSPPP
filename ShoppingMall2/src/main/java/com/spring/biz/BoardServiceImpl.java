package com.spring.biz;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.biz.vo.BoardVO;
import com.spring.biz.vo.buyVO;

@Service("BoardService")
public class BoardServiceImpl implements BoardService {
	@Autowired
	private SqlSessionTemplate sqlSession;

	// 보드리스트
	@Override
	public List<BoardVO> selectBoardList(BoardVO vo) {
		
		return sqlSession.selectList("selectBoardList", vo);
	}

	// 보드 COUNT
	@Override
	public int selectBoardCount(BoardVO vo) {
		return sqlSession.selectOne("selectBoardCount", vo);
	}

	// 고객센터 메인 공지사항
	@Override
	public List<BoardVO> selectMainNoticeList() {
		return sqlSession.selectList("selectMainNoticeList");
	}

	// 고객센터 메인 FaQ
	@Override
	public List<BoardVO> selectMainFaQList() {
		return sqlSession.selectList("selectMainFaQList");
	}

	// 공지사항 등록
	@Override
	public int insertNotice(BoardVO vo) {
		return sqlSession.insert("insertBoard", vo);
	}

	// 공지사항 상세보기
	@Override
	public BoardVO selectBoardDetail(BoardVO vo) {
		return sqlSession.selectOne("selectBoardDetail", vo);
	}
	
	// 게시글 인서트
	@Override
	@Transactional(rollbackFor = Exception.class)
	public int insertBoard(BoardVO boardVO , buyVO buyVO) {
		sqlSession.update("updateBoardReviewState", buyVO);
		return sqlSession.insert("insertBoard", boardVO);
	}

	// 보드삭제
	@Override
	public int boardDelete(BoardVO vo) {
		return sqlSession.delete("deleteBoard", vo);
	}

	// 리뷰 별점 평균
	@Override
	public double selectBoardScoreAVG(BoardVO vo) {
		return sqlSession.selectOne("selectBoardScoreAVG", vo);
	}

	//리뷰 업데이트
	@Override 
	public int reviewUpdate(BoardVO vo) {
		return sqlSession.update("reviewUpdate", vo);
	}

	// 1:1질문 등록
	@Override
	public int insertQuestion(BoardVO vo) {
		return sqlSession.insert("insertQuestion", vo);
	}
	
	//공지사항 업데이트
	@Override
	public int updateNotice(BoardVO vo) {
		return sqlSession.update("updateNotice", vo);
	}

	// 유저페이지 아이디별 리스트
	@Override
	public List<BoardVO> selectUserPageList(BoardVO vo) {
		return sqlSession.selectList("selectUserPageList", vo);
	}

	// 1:1질문 리스트(관리자시점)
	@Override
	public List<BoardVO> inquiryBoardList() {
		return sqlSession.selectList("inquiryBoardList");
	}

	// 1:1질문 답변등록
	@Override
	public int insertInquiry(BoardVO vo) {
		return sqlSession.update("insertInquiry", vo);
	}

	// 1:1질문 삭제
	@Override
	public int deleteQuestion(BoardVO vo) {
		return sqlSession.delete("deleteBoard", vo);
	}

	// 1:1질문 질문수정
	@Override
	public int updateQuestion(BoardVO vo) {
		return sqlSession.update("updateQuestion", vo);
	}
}
