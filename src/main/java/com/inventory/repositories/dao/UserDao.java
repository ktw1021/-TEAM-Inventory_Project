package com.inventory.repositories.dao;

import com.inventory.repositories.vo.UserVo;

public interface UserDao {
	public int insert(UserVo vo);
	public UserVo selectUser(String name);
	public UserVo selectUser(String name, String password);
	public UserVo getUserByName(String userName);
	public void insertUser(UserVo user);
	public UserVo getUserByNameAndPassword(String userName, String password);
}
