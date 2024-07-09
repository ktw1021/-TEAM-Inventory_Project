package com.inventory.repositories.vo;

import java.math.BigDecimal;

public class BookVo {

	private String book_code;
	private String book_name;
	private int price;
	private String kindcode;
	
	

	public BookVo() {
		
	}

	public String getBook_code() {
		return book_code;
	}

	public void setBook_code(String book_code) {
		this.book_code = book_code;
	}

	public String getBook_name() {
		return book_name;
	}

	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getKindcode() {
		return kindcode;
	}

	public void setKindcode(String kindcode) {
		this.kindcode = kindcode;
	}

	@Override
	public String toString() {
		return "BookVo [book_code=" + book_code + ", book_name=" + book_name + ", price=" + price + ", kindcode="
				+ kindcode + "]";
	}

	public BookVo(String book_code, String book_name, int price, String kindcode) {
		this.book_code = book_code;
		this.book_name = book_name;
		this.price = price;
		this.kindcode = kindcode;
	}

	public BookVo(String book_name) {
		this.book_name = book_name;
	}
	
	

}
