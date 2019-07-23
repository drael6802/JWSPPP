package com.study.aop;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class TestApp {
	public static void main(String[] args) {
		AbstractApplicationContext container = new GenericXmlApplicationContext("applicationContext.xml");
	      BoardService service = (BoardService) container.getBean("boardService");

		 service.getSelectBoardList("title");
		 service.insertBoardList();
		 service.delelteBoardList();
		 service.delelteBoardList2();
		 service.delelteBoardList3();
		
	}
}
