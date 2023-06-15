package com.five.goodchoice.aop;


import java.io.IOException;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;

import org.springframework.stereotype.Component;

import com.five.goodchoice.member.model.MemberVO;

import com.five.goodchoice.util.Myutil;


// === #53. 공통관심사 클래스(Aspect Class) === //
//     AOP(Aspect Oriented Programming) 
//     OOP(Object Oriented Programming) ==> field, method 상속성 추상화 캡슐화 다형성 
@Aspect    // 공통관심사 클래스(Aspect Class)로 올라간다
@Component // bean으로 등록된다.
public class MemberAOP {
	
	// ===== Before Advice(보조업무) 만들기 ====== // 
	   /*
		       주업무(<예: 글쓰기, 글수정, 댓글쓰기 직원목록조회 등등>)를 실행하기 앞서서  
		       이러한 주업무들은 먼저 로그인을 해야만 사용가능한 작업이므로
		       주업무에 대한 보조업무<예: 로그인 유무검사> 객체로 로그인 여부를 체크하는
		       관심 클래스(Aspect 클래스)를 생성하여 포인트컷(주업무)과 어드바이스(보조업무)를 생성하여
		       동작하도록 만들겠다.
		       
	   */   
	// == pointcut(주업무)을 설정해야 한다. === //
	//    pointcut 이란 공통관심사<예 :로그인 유무검사>를 필요로 하는 메소드를 말한다.
	@Pointcut("execution(public * com.five..*Controller.requiredLogin_*(..) )")
	public void requiredLogin() {}
	
	
	
	// == Before Advice(공통관심사, 보조업무)를 구현한다.
	@Before("requiredLogin()")
	public void loginCheck(JoinPoint joinpoint) { // 로그인 유무 검사를 하는 메소드 작성하기 
		// *암기* JoinPoint joinpoint는 포인트 컷 되어진 주업무인 메소드이다.
		
		// 로그인 유무를 확인하기 위해서는 request를 session을 얻어와야 한다.
		HttpServletRequest request = (HttpServletRequest)joinpoint.getArgs()[0];    // 주업무 메소드의 첫번쨰 파라미터를 얻어오는 것이다.		
		HttpServletResponse response = (HttpServletResponse)joinpoint.getArgs()[1]; // 주업무 메소드의 두번쨰 파라미터를 얻어오는 것이다.	
		
		HttpSession session = request.getSession();
		if(session.getAttribute("loginuser") == null) {

			String message = "먼저 로그인 하세요!";
			String loc = request.getContextPath()+"/memberLogin.gc";
			
			request.setAttribute("message", message);
			request.setAttribute("loc", loc);
			
			//>>> 로그인 성공후 로그인 하기전 페이지로 돌아가는 작업 만들기 <<< //
			// === 현재페이지의 주소(URL) 알아오기  === //
			
			String url = Myutil.getCurrentURL(request);
			// System.out.println(url);
			
			session.setAttribute("goBackURL", url); // 세션에 url정보를 저장시켜준다 
			
			RequestDispatcher dispather = request.getRequestDispatcher("/WEB-INF/views/msg.jsp");
			
			try {
				dispather.forward(request, response);
			} catch (ServletException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
	}
	
	@Pointcut("execution(public * com.five..Controller.empmanager_*(..))")
    public void empmanager() {}
    
    // == Around Advice(공통관심사, 보조업무)를 구현한다.
    // - 직원관리와 관련된 주업무를 실행하는 데 있어서 권한이 있는지(로그인 되어진 사용자의 gradelevel 값이 10)를 알아보는것을 보조업무로 보겠다. 
    // - 인사관리 페이지에 접속한 이후에, 인사관리 페이지에 접속한 페이지URL, 사용자ID, 접속IP주소, 접속시간을 기록으로 DB에 insert 하도록 한다.
    @Around("empmanager()")
    public String checkAuthority(ProceedingJoinPoint joinPoint) {
       /* Around Advice 에서는 ProceedingJoinPoint joinPoint 가
             포인트컷 되어진 주업무의 메소드이다. */
       
       String viewPage = null;
       
       // ============== 보조업무1 ============== //
       // - 직원관리와 관련된 주업무를 실행하는 데 있어서 권한이 있는지(로그인 되어진 사용자의 gradelevel 값이 10)를 알아보는것을 보조업무로 보겠다.
       HttpServletRequest request = (HttpServletRequest) joinPoint.getArgs()[0];
       HttpSession session = request.getSession();
       MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
       
       if(loginuser == null || loginuser.getIs_admin() == "1") {
       
          
          String message = "접근할 수 있는 권한이 없습니다.(Arround Advice 활용)";
          String loc = "javascript:history.back()";
          
          request.setAttribute("message", message);
          request.setAttribute("loc", loc);
          
          viewPage = "msg";
       }
       
       //////////////////////////////////////////////////////////////////////
       else {
           // 로그인 되어진 사용자의 gradelevel 값이 10 이상 인 경우
          
          try {
              viewPage = (String) joinPoint.proceed(); 
              // !!!! 중요!!!! 주업무 메소드가 실행되는 것이다. !!!!!
              
              //System.out.println("viewPage => " + viewPage);
              // viewPage => emp/empList.tiles2 
              // viewPage => emp/chart.tiles2
            /* 
                 joinPoint.proceed(); 은 
                 Pointcut 에 설정된 주업무 메소드를 실행하라는 것이다.
                 지금은  String com.spring..EmpController.empmanager_*(..) 이다.
                  
                Object org.aspectj.lang.ProceedingJoinPoint.proceed() throws Throwable
                 Throwable 클래스는 예외처리를 할 수 있는 최상위 클래스이다. 
                 Throwable 클래스의 자식 클래스가 Exception 과 Error 클래스이다.
                   
                     그리고 joinPoint.proceed()메소드의 리턴값은 Object 이다.
                 이를 통해 Aspect 로 연결된 Original Method(주업무 메소드, 지금은 EmpController 클래스의 메소드명이 empmanager_ 으로 시작하는 메소드임)의 리턴값을  
                 형변환(캐스팅)을 통하여 받을수 있다.
               */
          } catch (Throwable e) {
            e.printStackTrace();
          }
       }
       
       return viewPage;
      /* 
         return viewPage; 의 뜻은 
           주업무 메소드인 public String com.spring..EmpController.empmanager_*(..) 쪽으로 넘겨준다는 것이다.
           그러므로 주업무 메소드의 리턴타입이 String 이므로 viewPage 타입도 String 이어야 하는 것이다.
       */
    }
	
	
}

