package com.inventory.security;

import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.stereotype.Component;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Component
public class CustomAuthenticationFailureHandler implements AuthenticationFailureHandler {

    @Override
    public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, AuthenticationException exception)
            throws IOException, ServletException {
        
        String errorMessage = exception.getMessage(); // 기본 메시지

        if (exception.getMessage().equalsIgnoreCase("Temporary password has expired")) {
            errorMessage = "임시 비밀번호의 유효 시간이 지났습니다. 다시 요청하십시오.";
        } 

        String encodedErrorMessage = URLEncoder.encode(errorMessage, StandardCharsets.UTF_8.toString());
        response.sendRedirect(request.getContextPath() + "/user/login?error=" + encodedErrorMessage);
    }
}
