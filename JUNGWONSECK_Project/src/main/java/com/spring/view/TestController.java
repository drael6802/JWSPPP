package com.spring.view;

import java.util.List;

import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.biz.TestSertvice;
import com.spring.biz.vo.TestVO;


@Controller
public class TestController {
	@Resource(name = "TestSertvice")
	TestSertvice testSertvice;
	
	@RequestMapping(value = "/javatest.do")
	public String test(Model model , TestVO vo ) {
		System.out.println("==========>test");
		List<TestVO> list = testSertvice.selectItemList(vo);
		model.addAttribute("list" , list);
		return "jsp/test.jsp";
	}
	
	//아이템 인서트
	@ResponseBody
	@RequestMapping(value = "/itemProc.do")
	public String itemProc(Model model , TestVO vo ) {
		System.out.println("==========>testItemInsertProc");
		int result = testSertvice.insertItem(vo);
		model.addAttribute("result" , result);
		return "jsp/test.jsp";
	}
	

}
