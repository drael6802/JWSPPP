package com.spring.view;


import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.biz.BoardService;
import com.spring.biz.CategoryService;
import com.spring.biz.ItemService;
import com.spring.biz.UserService;
import com.spring.biz.vo.BoardVO;
import com.spring.biz.vo.UserVO;
import com.spring.biz.vo.buyVO;

@Controller
public class BoardController {
	@Resource(name = "UserService")
	UserService userService;
	
	@Resource(name = "CategoryService")
	CategoryService categoryService;

	@Resource(name = "ItemService")
	ItemService itemService;

	@Resource(name = "BoardService")
	BoardService boardService;
	
	String viewPage = "viewPage";
	String adminPage = "adminPage";
	String viewTemplate = "/jsp/Template_main.jsp";
	String adminViewTemplate = "/jsp/user_admin.jsp";
	
	//보드 인서트 
	@ResponseBody
	@RequestMapping(value = "/boardInset.do")
	public int boardInset(BoardVO boardVO , buyVO buyVO , HttpSession session) {
		
		buyVO.setUserId(((UserVO)session.getAttribute("userInfo")).getUserId());
		boardVO.setUserId(((UserVO)session.getAttribute("userInfo")).getUserId());
		int result = boardService.insertBoard(boardVO, buyVO);
		
		return result;
	}
	
	//보드 업데이트 reviewUpdate.do
	@ResponseBody
	@RequestMapping(value = "/reviewUpdate.do")
	public int reviewUpdate(BoardVO boardVO , buyVO buyVO , HttpSession session) {
		
		boardVO.setUserId(((UserVO)session.getAttribute("userInfo")).getUserId());
		int result = boardService.reviewUpdate(boardVO);
		
		return result;
	}
	
	// 고객센터 폼 이동
	@RequestMapping(value = "/serviceCenter.do")
	public String serviceCenter(Model model) {
		
		List<BoardVO> noticeList = boardService.selectMainNoticeList();
		model.addAttribute("noticeList", noticeList);
		
		model.addAttribute(viewPage, "serviceCenter.jsp");
		
		return viewTemplate;
	}
	
	// 서비스센터 메인 공지사항 더보기 - 팝업
	@RequestMapping(value = "/serviceMainListMore.do")
	public String serviceMainListMore(Model model, BoardVO vo, String pageIndex) {
		vo.setBoardCategoryCode(1);
		
		if (pageIndex == null || "".equals(pageIndex)) {
			vo.setPageIndex(1);						
		} else {
			vo.setPageIndex(Integer.parseInt(pageIndex));			
		}
		
		List<BoardVO> noticeListMore = boardService.selectBoardList(vo);
		model.addAttribute("noticeListMore", noticeListMore);
		
		int boardCount = boardService.selectBoardCount(vo);
		
		int totalPage = boardCount / 10;
		if (boardCount % 10 != 0 ) {
			totalPage++;
		}
		model.addAttribute("pageIndex", pageIndex);
		model.addAttribute("totalPage", totalPage);
		
		return "jsp/service_main_list_more.jsp";
	}

	// 서비스센터 메인 공지사항 상세보기 - 팝업
	@RequestMapping(value = "/noticeListDetail.do")
	public String noticeListDetail(Model model, BoardVO vo, String pageIndex) {
		BoardVO boardDetailVO = boardService.selectBoardDetail(vo);
		model.addAttribute("boardDetailVO", boardDetailVO);
		return "jsp/service_main_list_more_detail.jsp";
	}

	// 1:1상담신청 - 팝업
	@RequestMapping(value = "/adviceService.do")
	public String adviceService(Model model) {
		return "jsp/service_advice.jsp";
	}

	// 1:1상담신청 등록
	@RequestMapping(value = "/insertQuestion.do")
	public String insertQuestion(Model model, BoardVO vo, HttpSession session, String boardTitle1, String boardTitle2) {
		
		String userId = ((UserVO)session.getAttribute("userInfo")).getUserId();

		vo.setBoardCategoryCode(5);
		vo.setBoardTitle(boardTitle1+boardTitle2);
		vo.setUserId(userId);

		int result = boardService.insertQuestion(vo);
		model.addAttribute("result", result);
		
		return "jsp/service_advice_result.jsp";
	}
	

}
