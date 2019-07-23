package com.study.aop;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Service;

@Service
@Aspect
public class LogAdvice {
	//포인트컷
	@Pointcut( "execution(* com.study.aop..*Impl.*(..))" )
	public void allPintCut(){}
	
	//포인트컷
	@Pointcut( "execution(* com.study.aop..*Impl.get*(..))" )
	public void getPintCut(){}
		
	//포인트컷
	@Pointcut( "execution(* com.study.aop..*Impl.insert*(..))" )
	public void insertPintCut(){}
	
	//어드바이스
	//@Before("allPintCut()")
	@Before("getPintCut()")
	//@After("getPintCut()")
	public void printLog(JoinPoint jp) {
		String methodName = jp.getSignature().getName();
		Object[] o = jp.getArgs();
		System.out.println("brfore advice methodName - " + methodName);
		System.out.println("brfore advice 매개변수 - " + o[0].toString());
		System.out.println("[공통로그] 비즈니스 로직 수행 전 동작");
	}
	
	//어드바이스
	@AfterReturning("insertPintCut()")
	@AfterThrowing("insertPintCut()")
	public void printLogAfter(JoinPoint jp , Object returnObj , Exception ex) {
		ex.getMessage();
	    if (returnObj.toString().equals("1")) {
	    	System.out.println("글 등록 성공");
				
		} 
	}
	

//	//어드바이스
//	@Around("insertPintCut()")
//	public void insertPintCut2()(ProceedingJpinPoint jp ) {
//	}
	
	
}
