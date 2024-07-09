package com.inventory.repositories.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.inventory.repositories.vo.BookVo;


@Repository("BookDao")
public class BookDaoImpl implements BookDao{


	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<BookVo> selectAll() {
		List<BookVo> list = sqlSession.selectList("book.selectAll");
		System.out.println(list);
		return list;
	}

	@Override
	public int insert(BookVo vo) {
		
		return sqlSession.insert("book.insert", vo);
	}

	@Override
	public int delete(String book_code) {
	    System.out.println("service" + book_code + "count");
	    return sqlSession.delete("book.delete", book_code);
	}


	@Override
	public int update(BookVo vo) {
		sqlSession.update("book.updateData", vo);
		return 0;
	}

	@Override
	public List<BookVo> search(String book_name) {
		List<BookVo> list = sqlSession.selectList("book.searchList", book_name);
		System.out.println("dao" + list);
		return list;
	}

	@Override
	public BookVo getData(String book_code) {
		BookVo vo = sqlSession.selectOne("book.getData",book_code);
		return vo;
	}

	
	
	
}
