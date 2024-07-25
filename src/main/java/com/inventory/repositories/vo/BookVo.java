package com.inventory.repositories.vo;

public class BookVo {

	private String bookCode;
	private String bookName;
	private int price;
	private String kindCode;

	public BookVo() {
		
	}

	public String getBookCode() {
		return bookCode;
	}

	public void setBookCode(String bookCode) {
		this.bookCode = bookCode;
	}

	public String getBookName() {
		return bookName;
	}

	public void setBookName(String bookName) {
		this.bookName = bookName;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getKindCode() {
		return kindCode;
	}

	public void setKindCode(String kindCode) {
		this.kindCode = kindCode;
	}

	@Override
	public String toString() {
		return "BookVo [bookCode=" + bookCode + ", bookName=" + bookName + ", price=" + price + ", kindCode="
				+ kindCode + "]";
	}

	public BookVo(String bookCode, String bookName, int price, String kindCode) {
		this.bookCode = bookCode;
		this.bookName = bookName;
		this.price = price;
		this.kindCode = kindCode;
	}

	public BookVo(String bookName) {
		this.bookName = bookName;
	}
}
