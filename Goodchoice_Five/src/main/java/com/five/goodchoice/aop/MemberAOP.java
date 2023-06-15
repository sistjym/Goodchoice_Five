package com.five.goodchoice.aop;

/*
 * import java.io.IOException;
 * 
 * 
 * import javax.servlet.RequestDispatcher; import
 * javax.servlet.ServletException; import javax.servlet.http.HttpServletRequest;
 * import javax.servlet.http.HttpServletResponse; import
 * javax.servlet.http.HttpSession;
 * 
 * import org.aspectj.lang.JoinPoint; import
 * org.aspectj.lang.ProceedingJoinPoint; import
 * org.aspectj.lang.annotation.Around; import
 * org.aspectj.lang.annotation.Aspect; import
 * org.aspectj.lang.annotation.Before; import
 * org.aspectj.lang.annotation.Pointcut;
 * 
 * import org.springframework.stereotype.Component;
 * 
 * import com.five.goodchoice.member.model.MemberVO;
 * 
 * import com.five.goodchoice.util.Myutil;
 * 
 * 
 * // === #53. 공통관심사 클래스(Aspect Class) === // // AOP(Aspect Oriented
 * Programming) // OOP(Object Oriented Programming) ==> field, method 상속성 추상화
 * 캡슐화 다형성
 * 
 * @Aspect // 공통관심사 클래스(Aspect Class)로 올라간다
 * 
 * @Component // bean으로 등록된다. public class MemberAOP {
 * 
 * // ===== Before Advice(보조업무) 만들기 ====== //
 * 
 * 주업무(<예: 글쓰기, 글수정, 댓글쓰기 직원목록조회 등등>)를 실행하기 앞서서 이러한 주업무들은 먼저 로그인을 해야만 사용가능한
 * 작업이므로 주업무에 대한 보조업무<예: 로그인 유무검사> 객체로 로그인 여부를 체크하는 관심 클래스(Aspect 클래스)를 생성하여
 * 포인트컷(주업무)과 어드바이스(보조업무)를 생성하여 동작하도록 만들겠다.
 * 
 * 
 * // == pointcut(주업무)을 설정해야 한다. === // // pointcut 이란 공통관심사<예 :로그인 유무검사>를 필요로
 * 하는 메소드를 말한다.
 * 
 * @Pointcut("execution(public * com.five..*Controller.requiredLogin_*(..) )")
 * public void requiredLogin() {}
 * 
 * 
 * 
 * // == Before Advice(공통관심사, 보조업무)를 구현한다.
 * 
 * @Before("requiredLogin()") public void loginCheck(JoinPoint joinpoint) { //
 * 로그인 유무 검사를 하는 메소드 작성하기 // *암기* JoinPoint joinpoint는 포인트 컷 되어진 주업무인 메소드이다.
 * 
 * // 로그인 유무를 확인하기 위해서는 request를 session을 얻어와야 한다. HttpServletRequest request =
 * (HttpServletRequest)joinpoint.getArgs()[0]; // 주업무 메소드의 첫번쨰 파라미터를 얻어오는 것이다.
 * HttpServletResponse response = (HttpServletResponse)joinpoint.getArgs()[1];
 * // 주업무 메소드의 두번쨰 파라미터를 얻어오는 것이다.
 * 
 * HttpSession session = request.getSession();
 * if(session.getAttribute("loginuser") == null) {
 * 
 * String message = "먼저 로그인 하세요!"; String loc =
 * request.getContextPath()+"/memberLogin.gc";
 * 
 * request.setAttribute("message", message); request.setAttribute("loc", loc);
 * 
 * //>>> 로그인 성공후 로그인 하기전 페이지로 돌아가는 작업 만들기 <<< // // === 현재페이지의 주소(URL) 알아오기 ===
 * //
 * 
 * String url = Myutil.getCurrentURL(request); // System.out.println(url);
 * 
 * session.setAttribute("goBackURL", url); // 세션에 url정보를 저장시켜준다
 * 
 * RequestDispatcher dispather =
 * request.getRequestDispatcher("/WEB-INF/views/msg.jsp");
 * 
 * try { dispather.forward(request, response); } catch (ServletException |
 * IOException e) { // TODO Auto-generated catch block e.printStackTrace(); }
 * 
 * } }
 * 
 * 
 * 
 * 
 * }
 */
