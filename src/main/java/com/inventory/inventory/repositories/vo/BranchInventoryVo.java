package com.inventory.repositories.vo;

public class BranchInventoryVo {

    private Long id;
    private BranchInventoryVo branchInventory; // renamed from branchInventoryVo
    private BookVo book;
    private Integer inventory;

    // Getters and setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public BranchInventoryVo getBranchInventory() {
        return branchInventory;
    }

    public void setBranchInventory(BranchInventoryVo branchInventory) {
        this.branchInventory = branchInventory;
    }

    public BookVo getBook() {
        return book;
    }

    public void setBook(BookVo book) {
        this.book = book;
    }

    public Integer getInventory() {
        return inventory;
    }

    public void setInventory(Integer inventory) {
        this.inventory = inventory;
    }

    // Setter method for branchInventoryVo
    public void setBranchInventoryVo(BranchInventoryVo branchInventoryVo) {
        this.branchInventory = branchInventoryVo;
    }
}
