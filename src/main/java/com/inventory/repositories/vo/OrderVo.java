package com.inventory.repositories.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Represents an Order with details such as order ID, branch ID, order date, etc.
 */
public class OrderVo {

    private String orderId;
    private String branchId;
    private Date orderDate;
    private String checked;
    private String bookCode;
    private String bookName;
    private String branchName;

    private int inventory;
    private int price;
    private int quantity;

    // Fields added for specific queries
    private String outId; // For specific queries
    private int totalQuantity; // For specific queries
    private String userName;
    
    private String content;

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

    // Constructor with bookName and quantity
    public OrderVo(String orderId, String branchId, Date orderDate, String bookName, int quantity) {
        this.orderId = orderId;
        this.branchId = branchId;
        this.orderDate = orderDate;
        this.bookName = bookName;
        this.quantity = quantity;
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
        this(orderId, branchId, orderDate, checked, bookCode, quantity);
        this.bookName = bookName;
        this.price = price;
    }

    // Full constructor with all fields
    public OrderVo(String orderId, String branchId, Date orderDate, String checked, String bookCode, String bookName,
                   String branchName, int inventory, int price, int quantity, String outId, int totalQuantity,
                   String userName) {
        this(orderId, branchId, orderDate, checked, bookCode, bookName, price, quantity);
        this.branchName = branchName;
        this.inventory = inventory;
        this.outId = outId;
        this.totalQuantity = totalQuantity;
        this.userName = userName;
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

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public String getOrderDateFormatted() {
        if (orderDate == null) {
            return "";
        }
        SimpleDateFormat dateFormat = new SimpleDateFormat("yy/MM/dd HH:mm");
        return dateFormat.format(orderDate);
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

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public String getBranchName() {
        return branchName;
    }

    public void setBranchName(String branchName) {
        this.branchName = branchName;
    }

    public int getInventory() {
        return inventory;
    }

    public void setInventory(int inventory) {
        this.inventory = inventory;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getOutId() {
        return outId;
    }

    public void setOutId(String outId) {
        this.outId = outId;
    }

    public int getTotalQuantity() {
        return totalQuantity;
    }

    public void setTotalQuantity(int totalQuantity) {
        this.totalQuantity = totalQuantity;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }
    
    
    
    public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
    public String toString() {
        return "OrderVo [orderId=" + orderId + ", branchId=" + branchId + ", orderDate=" + orderDate + ", checked="
                + checked + ", bookCode=" + bookCode + ", bookName=" + bookName + ", branchName=" + branchName
                + ", inventory=" + inventory + ", price=" + price + ", quantity=" + quantity + ", outId=" + outId
                + ", totalQuantity=" + totalQuantity + ", userName=" + userName + "]";
    }
}
