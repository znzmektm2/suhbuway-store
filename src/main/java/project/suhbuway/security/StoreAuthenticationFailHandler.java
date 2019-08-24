package project.suhbuway.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.stereotype.Component;

/** 인증에 실패했을때 호출되는 객체 
 * */
@Component // id="memberAuthenticationFailHandler"
public class StoreAuthenticationFailHandler implements AuthenticationFailureHandler {
	
	@Override
	public void onAuthenticationFailure(
			HttpServletRequest request, 
			HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		
		// 인증에 실패했을때 해야 할 일 설정
		request.setAttribute( "errorMessage", exception.getMessage() );
		
		// 오류 후 이동은 직접이동 시켜줘야함 
		//request.getRequestDispatcher("/WEB-INF/views/user/login.jsp?error=true").forward(request, response);
		request.getRequestDispatcher("../errorLogin").forward(request, response);
	}

}
