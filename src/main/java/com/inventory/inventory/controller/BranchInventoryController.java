package com.inventory.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.inventory.repositories.vo.BranchInventoryVo;
import com.inventory.services.BranchInventoryService;

@Controller
@RequestMapping("/branches")
public class BranchInventoryController {
    private final BranchInventoryService branchService;

    @Autowired
    public BranchInventoryController(BranchInventoryService branchService) {
        this.branchService = branchService;
    }

    @GetMapping
    public String branchHome() {
        return "branch_home";
    }
    
    @GetMapping("/all")
    public List<BranchInventoryVo> getAllBranchInventories() {
        return branchService.getAllBranches();
    }

    @GetMapping("/{branchId}/{bookCode}")
    public BranchInventoryVo getBranchInventory(@PathVariable String branchId, @PathVariable String bookCode) {
        return branchService.getBranch(branchId, bookCode);
    }

    @PostMapping("/add")
    public void addBranchInventory(@RequestBody BranchInventoryVo branchInventoryVo) {
        branchService.addBranch(branchInventoryVo);
    }

    @DeleteMapping("/delete/{branchId}/{bookCode}")
    public void deleteBranchInventory(@PathVariable String branchId, @PathVariable String bookCode) {
        branchService.deleteBranch(branchId, bookCode);
    }

    @GetMapping("/order_detail")
    public String branchOrderDetail() {
        return "branch_order_detail";
    }

    @GetMapping("/order_list")
    public String branchOrderList() {
        return "branch_order_list";
    }

    @GetMapping("/stock_in_detail")
    public String branchStockInDetail() {
        return "branch_stock_in_detail";
    }

    @GetMapping("/stock_in_list")
    public String branchStockInList() {
        return "branch_stock_in_list";
    }

    @GetMapping("/stock_out_detail")
    public String branchStockOutDetail() {
        return "branch_stock_out_detail";
    }

    @GetMapping("/stock_out_list")
    public String branchStockOutList() {
        return "branch_stock_out_list";
    }
}
