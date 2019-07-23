package com.study.aop;

import org.springframework.stereotype.Service;

@Service("boardService")
public class BoardServiceImpl implements BoardService {
	
	
	@Override
	public void getSelectBoardList(String str) {
		System.out.println("게시글 리스트 조회 = " + str);
	}

	@Override
	public int insertBoardList() {
		System.out.println("게시글 등록");
		return 1;
		
	}

	@Override
	public void delelteBoardList() {
		System.out.println("게시글 삭제");
		
	}

	@Override
	public void delelteBoardList2() {
		System.out.println("게시글 삭제2");
		
	}

	@Override
	public void delelteBoardList3() {
		System.out.println("게시글 삭제3");
		
	}

}
