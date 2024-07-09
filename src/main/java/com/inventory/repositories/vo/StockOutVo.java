package com.inventory.repositories.vo;

import java.util.Date;

public class StockOutVo {
    private int outId;
    private String bookName;
    private int quantity;
    private Date outDate;
    private String comments;
    private int branchId;

    // Getters and setters

    public int getOutId() {
        return outId;
    }

    public void setOutId(int outId) {
        this.outId = outId;
    }

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Date getOutDate() {
        return outDate;
    }

    public void setOutDate(Date outDate) {
        this.outDate = outDate;
    }

    public String getComments() {
        return comments;
    }

    public void setComments(String comments) {
        this.comments = comments;
    }

    public int getBranchId() {
        return branchId;
    }

    public void setBranchId(int branchId) {
        this.branchId = branchId;
    }
}
