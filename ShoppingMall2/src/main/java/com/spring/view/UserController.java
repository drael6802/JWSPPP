package com.spring.view;


import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.biz.BoardService;
import com.spring.biz.CartService;
import com.spring.biz.LikeService;
import com.spring.biz.UserService;
import com.spring.biz.vo.BoardVO;
import com.spring.biz.vo.LikeVO;
import com.spring.biz.vo.UserVO;
import com.spring.biz.vo.buyVO;

@Controller
public class UserController {
	@Resource(name = "UserService")
	UserService userService;
	
	@Resource(name = "CartService")
	CartService cartService;
	
	@Resource(name = "LikeService")
	LikeService likeService;
	
	@Resource(name = "BoardService")
	BoardService boardService;
	
	String viewPage = "viewPage";
	String adminPage = "adminPage";
	String viewTemplate = "/jsp/Template_main.jsp";
	String adminViewTemplate = "/jsp/user_admin.jsp";
	String userPageTemplate = "/jsp/user_page_template.jsp";
	
	//로그인 폼 이동
	@RequestMapping(value = "/userLogin.do")
	public String userLogin(Model model ) {
		model.addAttribute(viewPage, "user_login.jsp");
		return viewTemplate;
	}

	//로그인 폼 프로세스
	@RequestMapping(value = "/userLoginProc.do")
	public String userLoginProc(Model model , UserVO vo , HttpSession session) {
		model.addAttribute(viewPage, "user_login.jsp");
		
		vo = userService.loginUser(vo);

			if (vo != null) {
				session.setAttribute("userInfo", vo);
				return "templateMain.do";
			}
		return viewTemplate;
	}
	
	//로그아웃 프로세스 logout.do
	@RequestMapping(value = "/userLogout.do")
	public String userLogout(Model model , HttpSession session) {
		session.invalidate();
		return "templateMain.do";
	}
	
	//회원가입 폼 이동
	@RequestMapping(value = "/userJoin.do")
	public String userJoin(Model model ) {
		model.addAttribute(viewPage, "user_join.jsp");
		return viewTemplate;
	}
	
	//회원가입 ID 중복체크 프로세스
	@ResponseBody
	@RequestMapping(value = "/idCheck.do")
	public String idCheck(UserVO vo) {
		vo = userService.idChcek(vo);
		
		if (vo == null || "".equals(vo)) {
			return null;
		}else {
			return vo.getUserId();
		}
	}
	
	//emailChcek 이메일 중복체크
	@ResponseBody
	@RequestMapping(value = "/emailChcek.do")
	public int emailChcek(Model model , UserVO vo ) {
		vo = userService.emailChcek(vo);
		
		if (vo == null || "".equals(vo)) {
			return 1;
		}else {
			return 0;
		}
		
	}
	
	//회원가입 폼 프로세스
	@ResponseBody
	@RequestMapping(value = "/userJoinProc.do")
	public int userJoinProc(Model model , UserVO vo ) {
		int result = userService.insertUser(vo);
		return result;
	}

	//유저 마이페이지 폼 user_info.jsp
	@RequestMapping(value = "/userPage.do")
	public String userPage(Model model ,buyVO buyVO, LikeVO likeVO , BoardVO boardVO , HttpSession session) {
		
		//구매 목록 리스트
		buyVO.setBuyState("mini");
		List<buyVO> buyList = cartService.buyList(buyVO);
		//좋아요 표시 리스트
		likeVO.setUserId(((UserVO)(session.getAttribute("userInfo"))).getUserId());
		likeVO.setLikeViewState("mini");
		List<LikeVO> likeList = likeService.selectLikeStateYList(likeVO);
		//리뷰 리스트
		boardVO.setUserId(((UserVO)(session.getAttribute("userInfo"))).getUserId());
		boardVO.setBoardCategoryCode(3);
		boardVO.setBoardViewState("mini");
		List<BoardVO> boardList = boardService.selectBoardList(boardVO);
				
		model.addAttribute("boardList" , boardList);
		model.addAttribute("likeList" , likeList);
		model.addAttribute("buyList" , buyList);
		model.addAttribute(viewPage, "user_page_main.jsp");
		return userPageTemplate;
	}
	
	// 구매 내역 상세보기 buyListInfo
	@RequestMapping(value = "/buyListInfo.do")
	public String buyListInfo(Model model ,buyVO buyVO, LikeVO likeVO , BoardVO boardVO , HttpSession session) {
		
		if (buyVO.getPageIndex() == 0 ) {
			buyVO.setPageIndex(1);						
		} 
		
		//구매 목록 리스트
		buyVO.setUserId(((UserVO)session.getAttribute("userInfo")).getUserId());
		List<buyVO> buyList = cartService.buyList(buyVO);
		model.addAttribute("buyList" , buyList);
		
		int buyCount = cartService.buyCount(buyVO);
		
		int totalPage = buyCount / 10;
		if (buyCount % 10 != 0 ) {
			totalPage++;
		}
		
		model.addAttribute("pageIndex", buyVO.getPageIndex());
		model.addAttribute("totalPage", totalPage);
		model.addAttribute(viewPage, "user_page_list.jsp");
		return userPageTemplate;
	}
	// 좋아요 표시 상품 상세 보기 
	@RequestMapping(value = "/likeListInfo.do")
	public String likeListInfo(Model model ,buyVO buyVO, LikeVO likeVO , BoardVO boardVO , HttpSession session) {
		
		if (likeVO.getPageIndex() == 0 ) {
			likeVO.setPageIndex(1);						
		} 
		
		//좋아요 표시 리스트
		likeVO.setUserId(((UserVO)(session.getAttribute("userInfo"))).getUserId());
		List<LikeVO> likeList = likeService.selectLikeStateYList(likeVO);
		
		int likeCount = likeService.selectLikeCount(likeVO);
		
		int totalPage = likeCount / 10;
		
		if (likeCount % 10 != 0) {
			totalPage++;
		}
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("likeList" , likeList);
		model.addAttribute("pageIndex", likeVO.getPageIndex());
		model.addAttribute(viewPage, "user_page_list.jsp");
		return userPageTemplate;
	}
	// 리뷰글 상세보기
	@RequestMapping(value = "/reviewListInfo.do")
	public String reviewListInfo(Model model ,buyVO buyVO, LikeVO likeVO , BoardVO boardVO  , HttpSession session) {
		
		if (boardVO.getPageIndex() == 0 ) {
			boardVO.setPageIndex(1);						
		} 
		
		//리뷰 리스트
		boardVO.setUserId(((UserVO)(session.getAttribute("userInfo"))).getUserId());
		boardVO.setBoardCategoryCode(3);
		List<BoardVO> boardList = boardService.selectBoardList(boardVO);
		
		int boardCount = boardService.selectBoardCount(boardVO);
		
		int totalPage = boardCount / 10;
		
		if (boardCount % 10 != 0) {
			totalPage++;
		}
		
		model.addAttribute("pageIndex", boardVO.getPageIndex());
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("boardList" , boardList);
		model.addAttribute(viewPage, "user_page_list.jsp");
		return userPageTemplate;
	}

	//회원 정보 수정 폼
	@RequestMapping(value = "/userInfoUpdate.do")
	public String userInfoUpdate(Model model, UserVO vo) {
		model.addAttribute(viewPage, "user_page_infoUpdate.jsp");
		
		UserVO userInfo = userService.selectUserDetail(vo);
		model.addAttribute("userInfo", userInfo);
		return userPageTemplate;
	}
	
	//회원 정보 수정
	@RequestMapping(value = "/userInfoUpdateProc.do")
	public String userInfoUpdateProc(Model model) {
		model.addAttribute(viewPage, "user_page_infoUpdate.jsp");
		return userPageTemplate;
	}
	
	//회원 가입 성공 창 이동
	@RequestMapping(value = "/userJoinSuccess.do")
	public String userJoinSuccess(Model model) {
		model.addAttribute(viewPage, "user_join_success.jsp");
		return viewTemplate;
	}
	
	//idFind.do 아이디 찾기 팝업
	@RequestMapping(value = "/idFind.do")
	public String idFind() {
		return "/jsp/user_find_id.jsp";
	}
	
	//idFind.do 비밀번호 찾기 팝업
	@RequestMapping(value = "/passFind.do")
	public String passFind() {
		return "/jsp/user_find_pass.jsp";
	}
	
	// 아이디 찾기
	@ResponseBody
	@RequestMapping(value = "/idFindProc.do")
	public UserVO idFindProc(UserVO userVO ,Model model) {
		userVO = userService.idFind(userVO);
		return userVO;
	}
	
	// 아이디 찾기
	@ResponseBody
	@RequestMapping(value = "/passFindProc.do")
	public UserVO passFindProc(UserVO userVO ,Model model) {
		userVO = userService.idFind(userVO);
		return userVO;
	}
	
	//유저 페이지 좋아요 딜리트 
	@RequestMapping(value = "/deleteLike.do") 
	public String deleteLike(Model model , LikeVO likeVO ,BoardVO boardVO, buyVO buyVO , HttpSession session) {
		likeVO.setUserId(((UserVO)(session.getAttribute("userInfo"))).getUserId());
		likeVO = likeService.insertLike(likeVO);
		userPage(model, buyVO, likeVO, boardVO, session);
	  	return userPageTemplate; 
	  }
	
	//비밀번호 체크
	@ResponseBody
	@RequestMapping(value = "/PasswordCheck.do")
	public int PasswordCheck(UserVO userVO , HttpSession session ) {
		userVO.setUserId(((UserVO)(session.getAttribute("userInfo"))).getUserId());
		userVO = userService.loginUser(userVO);
		if (userVO == null) {
			return 1;
		}else {
			return 0;
		}
	}
	
	//비밀번호 번경
	@ResponseBody
	@RequestMapping(value = "/PasswordUpdate.do")
	public int PasswordUpdate(UserVO userVO , HttpSession session ) {
		userVO.setUserId(((UserVO)(session.getAttribute("userInfo"))).getUserId());
		int result = userService.PasswordUpdate(userVO);
		return result;
	}
	
	//주소 변경 업데이트
	@ResponseBody
	@RequestMapping(value = "/addressUpdate.do")
	public int addressUpdate(UserVO userVO , HttpSession session ) {
		
		userVO.setUserId(((UserVO)(session.getAttribute("userInfo"))).getUserId());
		int result = userService.addressUpdate(userVO);
			return result;
	}
	
	// 내가 한 질문 모아보기
	@RequestMapping(value = "/inquiryBoardList.do")
	public String inquiryBoard(Model model, BoardVO vo, HttpSession session) {
		
		String userId = ((UserVO)session.getAttribute("userInfo")).getUserId();
		vo.setUserId(userId);
		vo.setBoardCategoryCode(5);
		
		List<BoardVO>inquiryBoardList = boardService.selectUserPageList(vo);
		model.addAttribute("inquiryBoardList", inquiryBoardList);
		
		model.addAttribute(viewPage, "user_inquiry_board_list.jsp");
		
		return userPageTemplate;
	}

	// 1:1질문 삭제
	@ResponseBody
	@RequestMapping(value = "/deleteQuestion.do")
	public int deleteQuestion(BoardVO vo , String boardCodes) {
		System.out.println(boardCodes);
		String[] questionCodes = boardCodes.split(",");
		
		List<BoardVO> boardList = new ArrayList<>();
		
		for (int i = 0; i < questionCodes.length; i++) {
			vo = new BoardVO();
			
			vo.setBoardCode(Integer.parseInt(questionCodes[i]));
			boardList.add(vo);
			
			vo.setBoardList(boardList);
		}
		
		int result = boardService.deleteQuestion(vo);
		
		return result;
	}

	// 1:1질문 수정
	@ResponseBody
	@RequestMapping(value = "/updateQuestion.do")
	public int updateQuestion(BoardVO vo) {
		int result = boardService.updateQuestion(vo);
		return result;
	}
	
	// 회원 삭제
	@ResponseBody
	@RequestMapping(value = "/userDel.do")
	public int userDel(UserVO vo , HttpSession session) {
		vo.setUserId(((UserVO)session.getAttribute("userInfo")).getUserId());
		int result = userService.userDel(vo);
		session.invalidate();
		return result;
	}
}
