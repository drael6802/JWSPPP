package com.spring.view;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.biz.BoardService;
import com.spring.biz.UserService;
import com.spring.biz.vo.BoardVO;
import com.spring.biz.vo.UserVO;

// 1. naverlogin.jsp
import java.net.URLEncoder;
import java.security.SecureRandom;
import java.io.UnsupportedEncodingException;
import java.math.BigInteger;


@Controller
public class UserController {
	@Resource(name = "userService")
	UserService userService;
	
	@Resource(name = "boardService")
	BoardService boardService;
	
	//로그인 폼
	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String login() {
		return "/jsp/loginForm.jsp";
	}
	//로그인 프로세스 
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String loginProc(@ModelAttribute("userVO") UserVO userVO , BoardVO boardVO , Model model, HttpSession session) {
		 userVO = userService.login(userVO);

		if (userVO != null) {
			session.setAttribute("id", userVO.getId());
//			List<BoardVO> list = boardService.bardList();
//			model.addAttribute("list", list);
			return "boardList.do";
		}
		return "/jsp/loginForm.jsp";
	}
	//logout.do 로그아웃
	@RequestMapping(value = "/logout.do")
	public String logout(HttpSession session) {
		System.out.println("띵");
		session.invalidate();
		return "/jsp/loginForm.jsp";
	}
	
	//네이버 로그인
		@RequestMapping(value = "/naverLogin.do")
		public String naverLogin(HttpSession session ,Model model) {
			 
			return "/jsp/naver_login.jsp";
		}
}
