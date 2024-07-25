package com.inventory.security;

import java.io.IOException;
import java.time.Duration;
import java.time.Instant;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import com.inventory.repositories.vo.UserVo;
import com.inventory.services.UserService;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Component
public class CustomAuthenticationSuccessHandler implements AuthenticationSuccessHandler {

    @Autowired
    private UserService userService;

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication)
            throws IOException, ServletException {
        String username = ((User) authentication.getPrincipal()).getUsername();
        UserVo authUser = userService.getUserByNameForLogin(username);
        
        HttpSession session = request.getSession();
        session.setAttribute("authUser", authUser);
        session.setAttribute("username", username);

        // 임시 비밀번호 안내 메시지 설정
        if (authUser.getTemporaryPasswordCreatedAt() != null) {
            Instant createdAtInstant = authUser.getTemporaryPasswordCreatedAt().toInstant();
            Instant now = Instant.now();
            Duration duration = Duration.between(createdAtInstant, now);

            if (duration.compareTo(Duration.ofHours(1)) <= 0) {
            	System.err.println("들어왔다 히히~~~~~~~~~~~~~~~~");
                session.setAttribute("tempPasswordMessage", "임시 비밀번호는 1시간 동안 유효합니다. 비밀번호를 변경하십시오.");
            } else {
            	session.removeAttribute("tempPasswordMessage");
            }
        }
        String asf = (String) session.getAttribute("tempPasswordMessage");
        System.err.println(asf);
        String targetUrl = determineTargetUrl(authentication);
        
        response.sendRedirect(request.getContextPath() + targetUrl);
    }

    protected String determineTargetUrl(Authentication authentication) {
        boolean isAdmin = authentication.getAuthorities().stream()
            .anyMatch(grantedAuthority -> grantedAuthority.getAuthority().equals("ROLE_ADMIN"));
        boolean isUser = authentication.getAuthorities().stream()
            .anyMatch(grantedAuthority -> grantedAuthority.getAuthority().equals("ROLE_USER"));
        boolean isGuest = authentication.getAuthorities().stream()
                .anyMatch(grantedAuthority -> grantedAuthority.getAuthority().equals("ROLE_GUEST"));

        if (isAdmin) {
            return "/admin/home";
        } else if (isUser) {
            return "/branch/inventory";
        } else if (isGuest) {
            return "/user/waiting";
        } else {
            return "/users/authcode";
        }
    }
}
