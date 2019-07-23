package com.spring.view;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.biz.ItemService;
import com.spring.biz.UserService;
import com.spring.biz.vo.ItemVO;
import com.spring.biz.vo.UserVO;

@Controller
public class ShoppingController {
	@Resource(name = "UserService")
	UserService userService;

	@Resource(name = "ItemService")
	ItemService itemService;
	
	
	String viewPage = "viewPage";
	String viewTemplate = "/jsp/Template_main.jsp";
	String subViewTemplate = "/jsp/Template_sub.jsp";
	
	//메인 시작 페이지
	@RequestMapping(value = "/templateMain.do")
	public String mainPage(Model model , UserVO vo ,HttpServletRequest request , ItemVO itemVO) throws IOException {
		
		model.addAttribute("coolieItemVO", itemVO.getItemVOList());
		
		itemVO.setCategoryName("Best");
		List<ItemVO> itemBestList = itemService.selectItemList(itemVO);
		model.addAttribute("CategoryName", itemVO.getCategoryName());
		model.addAttribute("itemBestList", itemBestList);
		
		itemVO.setCategoryName("New");
		List<ItemVO> itemNewList = itemService.selectItemList(itemVO);
		model.addAttribute("CategoryName", itemVO.getCategoryName());
		model.addAttribute("itemNewList", itemNewList);
		
		model.addAttribute(viewPage, "item_main_list.jsp");
		model.addAttribute("main", "main");
		return viewTemplate;
	}
	
	
	
}
