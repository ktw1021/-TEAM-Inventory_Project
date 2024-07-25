package com.inventory.repositories.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

public class OrderVo {

	private String orderId;
	private String branchId;
	private Date orderDate;
	private String checked;
	private String bookCode;
	private String bookName;
	private String branchName;
	private int inventory;

	public int getInventory() {
		return inventory;
	}

	public void setInventory(int inventory) {
		this.inventory = inventory;
	}

	private int price;
	private int quantity;

	public String getBranchName() {
		return branchName;
	}

	public void setBranchName(String branchName) {
		this.branchName = branchName;
	}

	private String userName;

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	// Default constructor
	public OrderVo() {
	}

	// Constructor with branchId
	public OrderVo(String branchId) {
		this.branchId = branchId;
	}

	// Constructor with bookCode, bookName, and quantity
	public OrderVo(String bookCode, String bookName, int quantity) {
		this.bookCode = bookCode;
		this.bookName = bookName;
		this.quantity = quantity;
	}

	// Constructor for order list verification
	public OrderVo(String orderId, String branchId, Date orderDate, String checked) {
		this.orderId = orderId;
		this.branchId = branchId;
		this.orderDate = orderDate;
		this.checked = checked;
	}

	// Full constructor
	public OrderVo(String orderId, String branchId, Date orderDate, String checked, String bookCode, int quantity) {
		this.orderId = orderId;
		this.branchId = branchId;
		this.orderDate = orderDate;
		this.checked = checked;
		this.bookCode = bookCode;
		this.quantity = quantity;
	}

	// Full constructor with bookName and price
	public OrderVo(String orderId, String branchId, Date orderDate, String checked, String bookCode, String bookName,
			int price, int quantity) {
		this.orderId = orderId;
		this.branchId = branchId;
		this.orderDate = orderDate;
		this.checked = checked;
		this.bookCode = bookCode;
		this.bookName = bookName;
		this.price = price;
		this.quantity = quantity;
	}

	// Getters and Setters
	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public String getBranchId() {
		return branchId;
	}

	public void setBranchId(String branchId) {
		this.branchId = branchId;
	}

	public String getOrderDate() {
		if (orderDate == null) {
			return "";
		}
		SimpleDateFormat dateFormat = new SimpleDateFormat("yy/MM/dd HH:mm");
		return dateFormat.format(orderDate);
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public String getChecked() {
		return checked;
	}

	public void setChecked(String checked) {
		this.checked = checked;
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

	@Override
	public String toString() {
		return "OrderVo [orderId=" + orderId + ", branchId=" + branchId + ", orderDate=" + orderDate + ", checked="
				+ checked + ", bookCode=" + bookCode + ", bookName=" + bookName + ", branchName=" + branchName
				+ ", price=" + price + ", quantity=" + quantity + ", userName=" + userName + "]";
	}
}
