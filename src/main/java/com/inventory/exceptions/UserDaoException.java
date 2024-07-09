package com.inventory.exceptions;

import com.inventory.repositories.vo.UserVo;

public class UserDaoException extends RuntimeException {
	private UserVo userVo = null;
	
	public UserDaoException() {
		
	}
	
	public UserDaoException(String message) {
		super(message);
	}
	
	public UserDaoException(String message, UserVo userVo) {
		super(message);
		this.userVo = userVo;
	}

	public UserVo getUserVo() {
		return userVo;
	}
	
}
