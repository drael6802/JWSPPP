package com.spring.view;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.biz.BoardService;
import com.spring.biz.UserService;
import com.spring.biz.vo.BoardVO;
import com.spring.biz.vo.UserVO;

@Controller
public class BoardController {
	@Resource(name = "boardService")
	BoardService boardService;
	
	@Resource(name = "userService")
	UserService userService;
	
	// 검색 목록 조건 설정
	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap(BoardVO boardVO) {
		Map<String, String> conditionMap = new HashMap<String, String>();
		System.out.println("ModelAttribute ===>Map");
		
		conditionMap.put("내용", "CONTENT");
		conditionMap.put("제목", "TITLE");
		conditionMap.put("날짜", "DATE");
		return conditionMap;
	}
	
	//리스트 검색
		@RequestMapping(value = "/boardList.do")
		public String boardMapList( BoardVO boardVO , Model model ) {
			//null check
			if (boardVO.getSearchCondition() == null) {
				boardVO.setSearchCondition("TITLE");
			}
			if (boardVO.getSearchKeyword() == null) {
				boardVO.setSearchKeyword("");
			}
			System.out.println("log : "+boardVO);
			model.addAttribute("list", boardService.bardList(boardVO));
			
			return "/jsp/board_list.jsp";
		}
	
		//리스트
//		@RequestMapping(value = "/boardList.do")
//		public String boardList(@ModelAttribute("boardVO") UserVO vo , Model model, HttpSession session) {
//			List<BoardVO> list = boardService.bardList();
//			model.addAttribute("list", list);
//			return "/jsp/board_list.jsp";
//		}
		
	//보드 인서트
	@RequestMapping(value = "/boardInsert.do")
	public String boardInsert(UserVO userVO ,Model model ,HttpSession session) {
		userVO.setId((String) session.getAttribute("id"));
		userVO = userService.selectUserInfo(userVO);
		model.addAttribute("userVO", userVO);
		return "/jsp/board_insert.jsp";
	}
	
	//보드 인서트 프로세스
	@RequestMapping(value = "/boardInsertProc.do")
	public String boardInsertProc(BoardVO boardVO) {
		boardService.bardInsert(boardVO);
		return "/boardList.do";
	}
	
	//보드 인포 상세보기
	@RequestMapping(value = "/boardInfo.do")
	public String boardInfo(@ModelAttribute("boardVO") BoardVO boardVO ,Model model) {
		boardService.boaedCount(boardVO);
		boardVO = boardService.boardInfo(boardVO);
		
//		SimpleDateFormat new_format = new SimpleDateFormat("yyyy.MM.dd");  
//		Date date= boardVO.getRegDate();
//		  // 날짜 형식을 원하는 타입으로 변경한다.   
//        String new_date = new_format.format(date);  
//          
//        // 결과를 출력한다.  
//        System.out.println(new_date);  
//        
//        boardVO.setRegDate(Date.valueOf(new_date));
		
		model.addAttribute("boardVO", boardVO);
		return "/jsp/board_Info.jsp";
	}
	//deleteBoard.do 보드 삭제 이동
	@RequestMapping(value = "/deleteBoard.do")
	public String deleteBoard(@ModelAttribute("boardVO") BoardVO boardVO ,Model model) {
		System.out.println("삭제");
		boardService.boardDelete(boardVO);
		return "/boardList.do";
	}
	//updateBoard.do 수정 폼 이동
	@RequestMapping(value = "/updateBoard.do")
	public String updateBoard(@ModelAttribute("boardVO") BoardVO boardVO ,Model model) {
		System.out.println("수정");
		boardVO = boardService.boardInfo(boardVO);
		model.addAttribute("boardVO", boardVO);
		return "/boardList.do";
	}
	//수정 폼 프로세서
	@RequestMapping(value = "/updateBoardProc.do")
	public String updateBoardProc(@ModelAttribute("boardVO") BoardVO boardVO ,Model model) {
		boardService.boardupdate(boardVO);
		return "/boardList.do";
	}
}
