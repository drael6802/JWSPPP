package com.spring.biz;

import java.util.List;

import com.spring.biz.vo.BoardVO;
import com.spring.biz.vo.buyVO;

public interface BoardService {
	// 보드리스트(페이징 10개 기준)
	public List<BoardVO> selectBoardList(BoardVO vo);
	
	// 보드카테고리 코드맞는 게시글 수를 카운트
	public int selectBoardCount(BoardVO vo);

	// 고객센터 메인 공지사항
	public List<BoardVO> selectMainNoticeList();

	// 고객센터 메인 FaQ
	public List<BoardVO> selectMainFaQList();
	
	// 유저페이지 아이디별 리스트
	public List<BoardVO> selectUserPageList(BoardVO vo);

	// 1:1질문 리스트(관리자시점)
	public List<BoardVO> inquiryBoardList();

	// 공지사항 등록
	public int insertNotice(BoardVO vo);	
	
	// 공지사항 상세보기
	public BoardVO selectBoardDetail(BoardVO vo);
	
	// 리뷰 보드 업데이트
	public int updateNotice(BoardVO vo);
	
	// 게시글 인서트 
	public int insertBoard(BoardVO boardVO ,  buyVO buyVO );
	
	// 보드 삭제
	public int boardDelete(BoardVO vo);
	
	// 리뷰 별점 평균
	public double selectBoardScoreAVG(BoardVO vo);	
	
	// 리뷰 보드 업데이트
	public int reviewUpdate(BoardVO vo);

	// 1:1질문 등록
	public int insertQuestion(BoardVO vo);

	// 1:1질문 삭제
	public int deleteQuestion(BoardVO vo);

	// 1:1질문 질문수정
	public int updateQuestion(BoardVO vo);

	// 1:1질문 답변등록 및 답변 수정
	public int insertInquiry(BoardVO vo);
	
}
