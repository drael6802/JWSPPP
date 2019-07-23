package com.spring.view;


import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.spring.biz.BoardService;
import com.spring.biz.CategoryService;
import com.spring.biz.ItemService;
import com.spring.biz.UserService;
import com.spring.biz.vo.BoardVO;
import com.spring.biz.vo.Category02VO;
import com.spring.biz.vo.Category03VO;
import com.spring.biz.vo.CategoryVO;
import com.spring.biz.vo.ItemVO;
import com.spring.biz.vo.OptionsVO;
import com.spring.biz.vo.UserVO;

@Controller
public class AdminController {
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
	
	//관리자 페이지
	@RequestMapping(value = "/userAdmin.do")
	public String userAdmin(Model model) {
		return adminViewTemplate;
	}

	// 유저 관리 페이지
	@RequestMapping(value = "/userManager.do")
	public String userManager(Model model , UserVO vo) {
		
		if (vo.getSearchState() != null) {
			if (vo.getSearchState().equals("아이디")) {
				vo.setSearchState("id");
			}else {
				vo.setSearchState("name");
			}
		}
		
		model.addAttribute(viewPage, "user_manager.jsp");
		List<UserVO> userList = userService.selectUserIdList(vo);
		model.addAttribute("userList", userList);
		return adminViewTemplate;
	}

	// 유저 관리 디테일 페이지
	@RequestMapping(value = "/userManagerDetail.do")
	public String userManagerDetail(Model model, UserVO vo) {
		model.addAttribute(viewPage, "user_manager_detail.jsp");
		UserVO resultVO = userService.selectUserDetail(vo);
		model.addAttribute("userVO", resultVO);
		return adminViewTemplate;
	}

	//상품 관리 페이지
	@RequestMapping(value = "/itemManager.do")
	public String itemManager(Model model , ItemVO itemVO) {
		List<ItemVO> list =  itemService.selectItemList(itemVO);
		
		int totalPage = list.get(0).getTotalRowNum() / 10;
		if (totalPage % 10 != 0) {
			totalPage++;
		}
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("list", list);
		model.addAttribute(viewPage, "item_manager.jsp");
		return adminViewTemplate;
	}
	
	//아이템 추가 페이지
	@RequestMapping(value = "/itemRegistration.do")
	public String itemRegistration(Model model , CategoryVO vo) {
		List<CategoryVO> categoryList =  categoryService.selectCategoryList(vo);
		model.addAttribute("categoryList", categoryList);
		model.addAttribute(viewPage, "item_registration.jsp");
		return adminViewTemplate;
	}
	
	//카테고리 관리 페이지
	@RequestMapping(value = "/categoryManager.do")
	public String categoryManager(Model model, CategoryVO vo) {
		List<CategoryVO> categoryList =  categoryService.selectCategoryList(vo);
		model.addAttribute("categoryList", categoryList);
		model.addAttribute(viewPage, "category_registration.jsp");
		return adminViewTemplate;
	}
	
	//카테고리 02 ajax
	@ResponseBody
	@RequestMapping(value = "/category02.do")
	public List<Category02VO> category02(Model model , Category02VO vo) {
		List<Category02VO> category02List = categoryService.selectCategory02List(vo);
		return category02List;
	}
	//카테고리 02 ajax
	@ResponseBody
	@RequestMapping(value = "/category03.do")
	public List<Category03VO> category03(Model model , Category03VO vo) {
		List<Category03VO> category03List = categoryService.selectCategory03List(vo);
		return category03List;
	}

	//아이템 추가 페이지 프로세스 itemRegistration
	@RequestMapping(value = "/itemRegistrationProc.do" , method = RequestMethod.POST)
	public String itemRegistrationProc(Model model , HttpServletRequest request , ItemVO itemVO , OptionsVO optionsVO , Category03VO category03VO ) throws IOException {
		//이미지 업로드 경로
		String uploadPath = request.getSession().getServletContext().getRealPath("/img/");
		//이미지 업로드 처리
		MultipartFile uploadImageFile = itemVO.getItemImageFile();
		MultipartFile uploadItemThumbnailFile = itemVO.getItemThumbnailFile();
		
		if (!uploadImageFile.isEmpty() && !uploadItemThumbnailFile.isEmpty()) {
			String imageFileName = uploadImageFile.getOriginalFilename();
			String thumbnailFileName = uploadItemThumbnailFile.getOriginalFilename();
			
			uploadImageFile.transferTo(new File(uploadPath + imageFileName));
			uploadItemThumbnailFile.transferTo(new File(uploadPath + thumbnailFileName));
			
			itemVO.setItemImage(imageFileName);
			itemVO.setItemThumbnail(thumbnailFileName);
		}
		
		// 상품 등록
		int result = itemService.insertItem(itemVO, optionsVO);
		
		model.addAttribute(viewPage, "bonobono.jsp");
		return adminViewTemplate;
	}
	
	//보드 관리 페이지 폼
	@RequestMapping(value = "/boardManager.do")
	public String boardManager(Model model, BoardVO vo) {
		model.addAttribute(viewPage, "board_manager.jsp");

		vo.setBoardCategoryCode(1);
		
		if (vo.getPageIndex() == 0 ) {
			vo.setPageIndex(1);						
		} 
		
		List<BoardVO> noticeList = boardService.selectBoardList(vo);
		model.addAttribute("noticeList", noticeList);
		
        int boardCount = boardService.selectBoardCount(vo);
		
		int totalPage = boardCount / 10;
		
		if (boardCount % 10 != 0) {
			totalPage++;
		}
		model.addAttribute("pageIndex", vo.getPageIndex());		
		model.addAttribute("totalPage", totalPage);

		List<BoardVO> QnAList = boardService.inquiryBoardList();
		model.addAttribute("QnAList", QnAList);
		
		
		return adminViewTemplate;
	}
	
	
	//공지사항 등록
	@ResponseBody
	@RequestMapping(value = "/inquiryInsert.do")
	public int inquiryInsert(Model model, BoardVO vo) {
		int result = boardService.insertInquiry(vo);
		return result;
	}
	
	//공지사항 등록
	@RequestMapping(value = "/insertNotice.do")
	public String insertNotice(Model model, BoardVO vo, HttpSession session) {
		UserVO userInfo = (UserVO)session.getAttribute("userInfo");
		
		vo.setUserId(userInfo.getUserId());
		vo.setBoardCategoryCode(1);
		boardService.insertNotice(vo);
		
		return "/boardManager.do";
	}
	
	//상품 삭제 
	@RequestMapping(value = "/deleteItem.do")
	public String deleteItem(Model model, ItemVO itemVO, HttpSession session) {
		
		itemService.deleteItem(itemVO);
		return itemManager(model, itemVO);
	}
	
	// 공지사항 수정 업데이트 
	@ResponseBody
	@RequestMapping(value = "/updateNotice.do")
	public int updateBoardContent(Model model, BoardVO boardVO, HttpSession session) {
		
		int result = boardService.updateNotice(boardVO);
		return result;
		}


}
