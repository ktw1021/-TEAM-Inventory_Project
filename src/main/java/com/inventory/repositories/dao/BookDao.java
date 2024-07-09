package com.inventory.repositories.dao;

import java.util.List;

import com.inventory.repositories.vo.BookVo;

public interface BookDao {
	public List<BookVo> selectAll();	//	게시물 목록
	public List<BookVo> search(String book_name);	//	게시물 목록
	public BookVo getData(String book_code);
	public int insert(BookVo vo);	//	게시물 작성
	public int delete(String book_code);	//	게시물 삭제
	public int update(BookVo vo);	//	게시물 수정
}
