package com.inventory.services;

import com.inventory.repositories.vo.UserVo;

import jakarta.servlet.http.HttpServletRequest;

public interface UserService {
	public boolean join(UserVo vo);
	public UserVo getUser(String name);
	public UserVo getUser(String name, String password);
	
	//	인증 체크 메서드 
	public boolean isAuthenticated(HttpServletRequest request);
}
