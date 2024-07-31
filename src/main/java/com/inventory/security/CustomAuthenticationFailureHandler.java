package com.inventory.security;

import java.io.IOException;

import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.stereotype.Component;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Component
public class CustomAuthenticationFailureHandler implements AuthenticationFailureHandler {

    @Override
    public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, AuthenticationException exception)
            throws IOException, ServletException {
        
        String errorMessage = exception.getMessage(); // 기본 메시지

        if (exception.getMessage().equalsIgnoreCase("Temporary password has expired")) {
            errorMessage = "임시 비밀번호의 유효 시간이 지났습니다. 다시 요청하십시오.";
        } 
        if (exception.getMessage().equalsIgnoreCase("Bad credentials")) {
        	errorMessage = "아이디 또는 비밀번호가 잘못 되었습니다. 아이디와 비밀번호를 정확히 입력해 주세요.";
        } 

        HttpSession session = request.getSession();
        session.setAttribute("errorMessage", errorMessage);

        // 로그인 페이지로 리다이렉트
        response.sendRedirect(request.getContextPath() + "/user/login");
    }
}
