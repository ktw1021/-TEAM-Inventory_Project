package com.inventory.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.inventory.repositories.vo.BranchInventoryVo;
import com.inventory.services.BranchInventoryService;

@RequestMapping("/branches")
@Controller
public class BranchInventoryController {
    private final BranchInventoryService branchService;

    @Autowired
    public BranchInventoryController(BranchInventoryService branchService) {
        this.branchService = branchService;
    }

    @RequestMapping({"", "/","/home", "/branch_home"})
    public String branchHome(Model model) {
        // You can add attributes to the model here if needed
        return "branches/branch_home"; // Return the path to the JSP page
    }
    

    @GetMapping("/{branchId}/{bookCode}")
    public String getBranchInventory(@PathVariable("branchId") String branchId, 
                                     @PathVariable("bookCode") String bookCode, 
                                     Model model) {
        BranchInventoryVo branchInventoryVo = branchService.getBranch(branchId, bookCode);
        model.addAttribute("branchInventory", branchInventoryVo);
        return "branches/branch_order_detail";
    }

    @PostMapping("/add")
    public String addBranchInventory(@ModelAttribute BranchInventoryVo branchInventoryVo,
                                     RedirectAttributes redirectAttributes) {
        branchService.addBranch(branchInventoryVo);
        redirectAttributes.addFlashAttribute("message", "Branch inventory added successfully!");
        return "redirect:/branches";
    }

    @PostMapping("/delete/{branchId}/{bookCode}")
    public String deleteBranchInventory(@PathVariable("branchId") String branchId, 
                                        @PathVariable("bookCode") String bookCode,
                                        RedirectAttributes redirectAttributes) {
        branchService.deleteBranch(branchId, bookCode);
        redirectAttributes.addFlashAttribute("message", "Branch inventory deleted successfully!");
        return "redirect:/branches";
    }

    @GetMapping("/order_detail")
    public String branchOrderDetail(Model model) {
        // You can add attributes to the model here if needed
        return "branches/branch_order_detail";
    }

    @GetMapping("/order_list")
    public String branchOrderList(Model model) {
        // You can add attributes to the model here if needed
        return "branches/branch_order_list";
    }

    @GetMapping("/stock_in_detail")
    public String branchStockInDetail(Model model) {
        // You can add attributes to the model here if needed
        return "branches/branch_stock_in_detail";
    }

    @GetMapping("/stock_in_list")
    public String branchStockInList(Model model) {
        // You can add attributes to the model here if needed
        return "branches/branch_stock_in_list";
    }

    @GetMapping("/stock_out_detail")
    public String branchStockOutDetail(Model model) {
        // You can add attributes to the model here if needed
        return "branches/branch_stock_out_detail";
    }

    @GetMapping("/stock_out_list")
    public String branchStockOutList(Model model) {
        // You can add attributes to the model here if needed
        return "branches/branch_stock_out_list";
    }
}
