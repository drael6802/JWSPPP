package com.spring.view;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.biz.BoardService;
import com.spring.biz.CartService;
import com.spring.biz.CategoryService;
import com.spring.biz.ItemService;
import com.spring.biz.LikeService;
import com.spring.biz.OptionsService;
import com.spring.biz.UserService;
import com.spring.biz.vo.BoardVO;
import com.spring.biz.vo.CartVO;
import com.spring.biz.vo.Category02VO;
import com.spring.biz.vo.Category03VO;
import com.spring.biz.vo.CategoryVO;
import com.spring.biz.vo.ItemVO;
import com.spring.biz.vo.LikeVO;
import com.spring.biz.vo.OptionsVO;
import com.spring.biz.vo.UserVO;
import com.spring.biz.vo.buyVO;

@Controller
public class ItemController {
	@Resource(name = "UserService")
	UserService userService;

	@Resource(name = "ItemService")
	ItemService itemService;

	@Resource(name = "CartService")
	CartService cartService;
	
	@Resource(name = "OptionsService")
	OptionsService optionsService;
	
	@Resource(name = "CategoryService")
	CategoryService categoryService;
	
	@Resource(name = "LikeService")
	LikeService likeService;

	@Resource(name = "BoardService")
	BoardService boardService;

	String viewPage = "viewPage";
	String viewTemplate = "/jsp/Template_main.jsp";
	String subViewTemplate = "/jsp/Template_sub.jsp";



	// 카테고리 서치
	@RequestMapping(value = "/itemMenuCategory.do")
	public String samsungCategory(Model model, ItemVO itemVO) {
		
		if (itemVO.getPageIndex() == 0 ) {
			itemVO.setPageIndex(1);						
		} 
		
		List<ItemVO> itemList = itemService.selectItemList(itemVO);
		
		int totalPage = 0;
		
		if (itemList != null &&itemList.size()!=0 ) {
			totalPage = itemList.get(0).getTotalRowNum() / 10;
			if (totalPage % 10 != 0) {
				totalPage++;
			}
		}
		model.addAttribute("pageIndex", itemVO.getPageIndex());
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("itemList", itemList);
		model.addAttribute(viewPage, "item_list.jsp");
		return viewTemplate;
	}

	// 상품 상세보기 폼이동
	@RequestMapping(value = "/itemInfo.do")
	public String itemInfo(Model model, ItemVO itemVO , OptionsVO optionsVO , HttpSession session , HttpServletRequest request , HttpServletResponse response, BoardVO boardVO) throws UnsupportedEncodingException {

		//쿼리 담기		
		itemVO = itemService.selectItemInfo(itemVO);
		optionsVO = optionsService.selectOptions(optionsVO);

		//쿠키 생성
		String CommentThumbnail = URLEncoder.encode(itemVO.getItemThumbnail() , "UTF-8" );
		Cookie todayImageCookie = new Cookie("itemCode"+itemVO.getItemCode() , CommentThumbnail);
		todayImageCookie.setMaxAge(60*60);
		response.addCookie(todayImageCookie);
		todayImageCookie.setComment(CommentThumbnail);
		model.addAttribute("optionsVO", optionsVO);
		model.addAttribute("itemInfo", itemVO);
		
		// 리뷰
		boardVO.setBoardCategoryCode(4);
		int pageIndex = boardService.selectBoardCount(boardVO);
		boardVO.setPageIndex(pageIndex);		

		List<BoardVO> reviewList = boardService.selectBoardList(boardVO);
		model.addAttribute("reviewList", reviewList);
		
		// 별점 평균
		if (reviewList != null && reviewList.size() != 0) {
			double scoreAVG = boardService.selectBoardScoreAVG(boardVO);
			int starAVG = (int)Math.round(scoreAVG);
			
			model.addAttribute("scoreAVG", scoreAVG);
			model.addAttribute("starAVG", starAVG);			
		}
		

		model.addAttribute(viewPage, "item_info.jsp");
		return viewTemplate;
	}

	// 장바구니 이동 폼
	@RequestMapping(value = "/cartList.do")
	public String cartList(Model model, CartVO cartVO , HttpSession session) {
		List<CartVO> cartList = cartService.selectCartList(cartVO);
		model.addAttribute("cartList", cartList);
		
		model.addAttribute(viewPage, "cart_list.jsp");
		return viewTemplate;
	}
	
	
	// 장바구니 인서트
	@ResponseBody
	@RequestMapping(value = "/cartInsert.do")
	public String cartInsert( CartVO cartVO , String optionsArray ,String cartNumberCountArray ,String itemPriceCartArray ,int itemCode ,String itemThumbnail ,int itemDiscount , String itemName , String userId , int itemInventory) {
		
		String[] optionsArraySplit = optionsArray.split(",");
		String[] cartNumberCountArraySplit = cartNumberCountArray.split(",");
		String[] itemPriceCartArraySplit = itemPriceCartArray.split(",");
		List<CartVO> cartVOList = new ArrayList<>();
		
		for (int i = 0; i < optionsArraySplit.length; i++) {
			cartVO = new CartVO();
			cartVO.setOptions(optionsArraySplit[i]);
			cartVO.setItemCount(Integer.parseInt(cartNumberCountArraySplit[i]));
			cartVO.setItemPrice(Integer.parseInt(itemPriceCartArraySplit[i]));
			cartVO.setItemCode(itemCode);
			cartVO.setItemThumbnail(itemThumbnail);
			cartVO.setItemDiscount(itemDiscount);
			cartVO.setItemName(itemName);
			cartVO.setUserId(userId);
			cartVO.setItemDiscount(itemDiscount);
			cartVO.setItemInventory(itemInventory);
			cartVOList.add(cartVO);
			cartVO.setCartVOList(cartVOList);
		}
		cartVO.setCartVOList(cartVOList);
		cartService.insertCart(cartVOList , cartVO);
		return null;
	}
	
	// 장바구니 삭제 a-jax
	@ResponseBody
	@RequestMapping(value = "/cartDel.do")
	public int cartDel(Model model, CartVO cartVO  ) {

		String[] cartCodeSplit = cartVO.getCartCodeList().split(",");
		List<CartVO> cartVOList = new ArrayList<>();
		for (int i = 0; i < cartCodeSplit.length; i++) {
			cartVO = new CartVO();
			cartVO.setCartCode(Integer.parseInt(cartCodeSplit[i]));
			cartVOList.add(cartVO);
			cartVO.setCartVOList(cartVOList);
		}
		int result = cartService.deleteCart(cartVO);
		return result;
	}
	//아이템 인포 카테고리 이동 
	@ResponseBody
	@RequestMapping(value = "/categoryAllList.do")
	public Category03VO categoryAllList(Model model , CategoryVO categoryVO , Category02VO category02VO , Category03VO category03VO) {
		category03VO.setCategoryState("itemInfo");
		category03VO = categoryService.selectCategoryAllList(category03VO);
		return category03VO;
	}
	
	// 구매 리스트 인서트 a-jax
	@ResponseBody
	@RequestMapping(value = "/buyListInsert.do")
	public int buyListInsert(Model model , buyVO buyVO , CartVO cartVO , ItemVO itemVO ,String cartCodeList , String itemCodeList ,HttpSession session ) {
		String[] cartCodeListArray = cartCodeList.split(",");
		String[] itemCodeListArray = itemCodeList.split(",");
		List<CartVO> cartVOList = new ArrayList<>();
		List<ItemVO> itemVOList = new ArrayList<>();
		for (int i = 0; i < cartCodeListArray.length; i++) {
			cartVO = new CartVO();
			cartVO.setCartCode(Integer.parseInt(cartCodeListArray[i]));
			cartVOList.add(cartVO);
			cartVO.setCartVOList(cartVOList);
			itemVO.setItemCode(Integer.parseInt(itemCodeListArray[i]));
			itemVOList.add(itemVO);
			itemVO.setItemVOList(itemVOList);
		}
		cartVO.setUserId(((UserVO)session.getAttribute("userInfo")).getUserId());
		int result = cartService.insetBuyList(cartVO, buyVO, itemVO);
		return result;
	}
	
	//CartCountUpate 카드 수량 업데이트
	@ResponseBody
	@RequestMapping(value = "/cartCountUpate.do") 
	public int cartCountUpate(Model model , CartVO cartVO) {
	 	int result = cartService.cartCountUpate(cartVO);
	 		
	  	return result; 
	}

	// 좋아요 selectLike.do
	@ResponseBody
	@RequestMapping(value = "/selectLike.do")
	public LikeVO selectLike(Model model, LikeVO likeVO) {
		likeVO = likeService.selectLike(likeVO);
		return likeVO;
	}
	
	// 좋아요 인서트 insertLike.do
	@ResponseBody
	@RequestMapping(value = "/insertLike.do")
	public LikeVO insertLike(Model model, LikeVO likeVO, HttpSession session) {
		likeVO.setUserId(((UserVO) (session.getAttribute("userInfo"))).getUserId());
		likeVO = likeService.insertLike(likeVO);
		return likeVO;
	}

	//바로구매 cartInsert
	@ResponseBody
	@RequestMapping(value = "/baroBuy.do") 
	public int baroBuy( CartVO cartVO, buyVO buyVO ,ItemVO itemVO , String optionsArray ,String cartNumberCountArray ,String itemPriceCartArray ,int itemCode ,String itemThumbnail ,int itemDiscount , String itemName , String userId , int itemInventory) {
		
		String[] optionsArraySplit = optionsArray.split(",");
		String[] cartNumberCountArraySplit = cartNumberCountArray.split(",");
		String[] itemPriceCartArraySplit = itemPriceCartArray.split(",");
		List<buyVO> buyVOList = new ArrayList<>();
		
		for (int i = 0; i < optionsArraySplit.length; i++) {
			buyVO = new buyVO();
			buyVO.setOptions(optionsArraySplit[i]);
			buyVO.setItemCount(Integer.parseInt(cartNumberCountArraySplit[i]));
			buyVO.setItemPrice(Integer.parseInt(itemPriceCartArraySplit[i]));
			buyVO.setItemCode(itemCode);
			buyVO.setItemThumbnail(itemThumbnail);		
			buyVO.setItemName(itemName);
			buyVO.setUserId(userId);
			buyVO.setItemInventory(itemInventory);
			buyVOList.add(buyVO);
		}
		buyVO.setBuyVOList(buyVOList);
		
		int result = cartService.baroInsetBuyList(buyVO, itemVO);
		return result;
	}
	
	//아이템 변경 업데이트
	@ResponseBody
	@RequestMapping(value = "/itemUpdate.do")
	public int itemUpdate(ItemVO itemVO) {
		itemService.itemUpdate(itemVO);
		return 0;
	}
}
