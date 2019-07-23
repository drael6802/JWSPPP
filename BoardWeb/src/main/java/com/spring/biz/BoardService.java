package com.spring.biz;

import java.util.List;

import com.spring.biz.vo.BoardVO;


public interface BoardService {
	//보드 리스트 출력
	public List<BoardVO> bardList(BoardVO vo);
	//보드 게시글 등록
	public int bardInsert(BoardVO vo);
	//보드 게시글 상세보기
	public BoardVO boardInfo(BoardVO vo);
	//보드 삭제 
	public int boardDelete(BoardVO vo);
	//보드 삭제 
	public int boardupdate(BoardVO vo);
	//조회수 
	public int boaedCount(BoardVO vo);
}
