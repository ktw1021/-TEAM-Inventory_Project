package com.inventory.repositories.dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.inventory.exceptions.UserDaoException;
import com.inventory.repositories.vo.UserVo;

@Repository("userDao")
public class UserDaoImpl implements UserDao{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int insert(UserVo vo) {
		try {
			return sqlSession.insert("users.insert", vo);
		} catch(Exception e) {
			e.printStackTrace();
			throw new UserDaoException("회원 가입 중 문제", vo);
		}
		
	}

	@Override
	public UserVo selectUser(String name) {
		UserVo userVo = sqlSession.selectOne("selectUserByName", name);
		
		return userVo;
	}

	@Override
	public UserVo selectUser(String name, String password) {
		//	mybatis parameterType =map 으로 전달하기
		System.err.println(name + password);
		Map<String, String> userMap = new HashMap<>();
		userMap.put("name", name);
		userMap.put("password", password);
		System.out.println(userMap);
		
		UserVo userVo = sqlSession.selectOne("users.selectUserByNameAndPassword", userMap);
		System.err.println(userVo);
		return userVo;
	}

}
