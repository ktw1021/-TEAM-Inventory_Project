package com.inventory.repositories.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonProperty;

public class StockVo {
	private int id;
	private String branchId;
	private Date flucDate;
	private int orderId;
	@JsonProperty("bookCode")
	private String bookCode;
	@JsonProperty("quantity")
	private int quantity;
	@JsonProperty("comments")
	private String comments;
	private String checkedIn;
	private String bookName;
	private String userName;

	public StockVo() {

	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	// stock_in detail 볼 때 사용
	public StockVo(int id, String branchId, Date flucDate, int orderId, String bookCode, int quantity, String comments,
			String checkedIn, String bookName) {
		this.id = id;
		this.branchId = branchId;
		this.flucDate = flucDate;
		this.orderId = orderId;
		this.bookCode = bookCode;
		this.quantity = quantity;
		this.comments = comments;
		this.checkedIn = checkedIn;
		this.bookName = bookName;
	}

	// stock_in list 볼 때 사용
	public StockVo(int id, String branchId, Date flucDate, int orderId, String checkedIn) {
		super();
		this.id = id;
		this.branchId = branchId;
		this.flucDate = flucDate;
		this.orderId = orderId;
		this.checkedIn = checkedIn;
	}

	// in_detail 입력에 사용
	public StockVo(int id, String bookCode, int quantity) {
		this.quantity = quantity;
		this.id = id;
		this.bookCode = bookCode;
	}

	// 재고 반영에 사용
	public StockVo(String branchId, String bookCode, int quantity) {
		this.branchId = branchId;
		this.bookCode = bookCode;
		this.quantity = quantity;
	}

	//	out detail 입력용
	public StockVo(int id, String bookCode, int quantity, String comments) {
		super();
		this.id = id;
		this.bookCode = bookCode;
		this.quantity = quantity;
		this.comments = comments;
	}

	public StockVo(String branchId, String bookCode, int quantity, String bookName) {
		this.branchId = branchId;
		this.bookCode = bookCode;
		this.quantity = quantity;
		this.bookName = bookName;
	}

	public StockVo(String bookCode, int quantity, String comments) {
		super();
		this.bookCode = bookCode;
		this.quantity = quantity;
		this.comments = comments;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getBranchId() {
		return branchId;
	}

	public void setBranchId(String branchId) {
		this.branchId = branchId;
	}

	public String getFlucDate() {
		if (flucDate == null) {
			return "";
		}
		SimpleDateFormat dateFormat = new SimpleDateFormat("yy/MM/dd HH:mm");
		return dateFormat.format(flucDate);
	}

	public void setFlucDate(Date flucDate) {
		this.flucDate = flucDate;
	}

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public String getBookCode() {
		return bookCode;
	}

	public void setBookCode(String bookCode) {
		this.bookCode = bookCode;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public String getCheckedIn() {
		return checkedIn;
	}

	public void setCheckedIn(String checkedIn) {
		this.checkedIn = checkedIn;
	}

	public String getBookName() {
		return bookName;
	}

	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
}
