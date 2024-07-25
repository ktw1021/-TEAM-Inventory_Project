package com.inventory.security;

import java.time.Duration;
import java.time.Instant;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.inventory.repositories.vo.UserVo;
import com.inventory.services.UserService;

@Service
public class CustomUserDetailsService implements UserDetailsService {

    @Autowired
    private UserService userService;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        UserVo userVo = userService.getUserByNameForLogin(username);

        if (userVo == null) {
            throw new UsernameNotFoundException("User not found with username: " + username);
        }

        // 임시 비밀번호 유효성 검사
        if (userVo.getTemporaryPasswordCreatedAt() != null) {
            Instant createdAtInstant = userVo.getTemporaryPasswordCreatedAt().toInstant();
            Instant now = Instant.now();
            Duration duration = Duration.between(createdAtInstant, now);

            if (duration.compareTo(Duration.ofHours(1)) > 0) {
                throw new BadCredentialsException("Temporary password has expired");
            } 
        }

        String role;
        if ("2".equals(userVo.getAuthCode())) {
            role = "ADMIN";
        } else if ("1".equals(userVo.getAuthCode())) {
            role = "USER";
        } else if ("0".equals(userVo.getAuthCode())) {
            role = "GUEST";
        } else {
            throw new BadCredentialsException("No valid role assigned to this user");
        }

        return User.builder()
                .username(userVo.getName())
                .password(userVo.getPassword())
                .roles(role)
                .build();
    }
}
