package com.inventory.services;

import java.util.List;

import com.inventory.repositories.vo.BookVo;



public interface BookService {
	public List<BookVo> getbookList();

	public List<BookVo> search(String book_name);

	public boolean writebook(BookVo vo);

	public boolean deletebook(String book_code);
	
	public boolean updatebook(BookVo vo);
	
	public BookVo getData(String book_code);
}
