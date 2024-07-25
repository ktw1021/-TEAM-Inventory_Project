package com.inventory.interceptors;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerInterceptor;

import com.inventory.repositories.vo.UserVo;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class AuthInterceptor implements HandlerInterceptor {
    private static final Logger logger = LoggerFactory.getLogger(AuthInterceptor.class);

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
//        HttpSession session = request.getSession();
//        UserVo authUser = (UserVo) session.getAttribute("authUser");
//
//        // 인증된 사용자가 없으면 로그인 페이지로 리다이렉트
//        if (authUser == null) {
//            logger.warn("Unauthorized access detected. Redirecting to login page.");
//            response.sendRedirect(request.getContextPath() + "/user/login");
//            return false; // 요청 처리 중단
//        }
//
//        String authCode = authUser.getAuthCode();
//        if ("0".equals(authCode)) {
//            logger.warn("User with insufficient permissions tried to access. Redirecting to access denied page.");
//            response.sendRedirect(request.getContextPath() + "/access-denied");
//            return false; // 요청 처리 중단
//        }
//
//        // 인증된 사용자인 경우 요청 계속 진행
        return true;
    }
}
