package com.inventory.controller;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.inventory.repositories.vo.OrderVo;
import com.inventory.repositories.vo.StockVo;
import com.inventory.repositories.vo.UserVo;
import com.inventory.services.OrderCheckService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin/ordercheck")
public class OrderCheckController {

    @Autowired
    private OrderCheckService orderCheckService;
    
    @RequestMapping({"", "/", "/list"})
    public String orderCheckList(HttpSession session, RedirectAttributes redirectAttributes, Model model) {
        UserVo authUser = (UserVo) session.getAttribute("authUser");
        
        if (authUser == null || !"2".equals(authUser.getAuthCode())) {
            redirectAttributes.addFlashAttribute("errorMsg", "Authentication error");
            return "redirect:/";
        }

        List<OrderVo> list = orderCheckService.getList();
        List<OrderVo> branchList = orderCheckService.getBranchList();
        
        model.addAttribute("branchList", branchList);
        model.addAttribute("list", list);
        
        return "admins/order_check_list";
    }

    @RequestMapping("/list/{no}")
    public String branchOrderCheckList(HttpSession session, RedirectAttributes redirectAttributes, Model model, @PathVariable("no") String no) {
        UserVo authUser = (UserVo) session.getAttribute("authUser");

        if (authUser == null || !"2".equals(authUser.getAuthCode())) {
            redirectAttributes.addFlashAttribute("errorMsg", "Authentication error");
            return "redirect:/";
        }

        List<OrderVo> list = orderCheckService.getBranchsList(no);
        List<OrderVo> branchList = orderCheckService.getBranchList();
        
        model.addAttribute("branchList", branchList);
        model.addAttribute("list", list);

        return "admins/order_check_list";
    }
    
    @RequestMapping("/detail/{id}")
    public String orderCheckDetail(@PathVariable("id") String id, Model model) {
        List<OrderVo> list = orderCheckService.getOrderDetail(id);
        model.addAttribute("list", list);
        return "admins/order_check_detail";
    }

    @RequestMapping("/summary")
    public String getBranchListSummary(Model model) {
        List<OrderVo> branchListSummary = orderCheckService.getBranchListSummary();
        model.addAttribute("branchListSummary", branchListSummary);
        return "admins/order_detail_summary";
    }

    @RequestMapping("/summary/{column_list}")
    public String branchOrderCheckListSummary(HttpSession session, RedirectAttributes redirectAttributes, Model model,
                                              @PathVariable("column_list") String column_list) {
        UserVo authUser = (UserVo) session.getAttribute("authUser");

        if (authUser == null || !"2".equals(authUser.getAuthCode())) {
            redirectAttributes.addFlashAttribute("errorMsg", "Authentication error");
            return "redirect:/";
        }

        List<OrderVo> list = orderCheckService.getColumnsList(column_list);
        List<OrderVo> columnList = orderCheckService.getColumnList();
        
        model.addAttribute("columnList", columnList);
        model.addAttribute("list", list);

        return "admins/order_check_list_summary";
    }

    @GetMapping("/calendar/data")
    @ResponseBody
    public List<OrderVo> getOrderCalendarData() {
        List<OrderVo> orderDetail = orderCheckService.getList();

        if (orderDetail == null || orderDetail.isEmpty()) {
            return Collections.emptyList();
        }

        for (OrderVo order : orderDetail) {
            if (order.getOrderId() == null || order.getBranchId() == null || order.getOrderDate() == null) {
                return null;
            }
        }

        return orderDetail;
    }

    @GetMapping("/calendar")
    public String showOrderCalendar(Model model) {
        List<OrderVo> orderDetail = orderCheckService.getList();
        model.addAttribute("orderDetail", orderDetail);
        return "admins/order_check_detail_calender";
    }

    @RequestMapping("/refuse/{id}")
    public String orderRefuse(@PathVariable("id") String id) {
        orderCheckService.refuseOrder(id);
        return "redirect:/admin/ordercheck/list";
    }

    @RequestMapping("/confirm/{id}")
    public String orderConfirm(@PathVariable("id") String id) {
        orderCheckService.confirmOrderCode(id);

        String branchId = orderCheckService.getBranchId(id);
        orderCheckService.confirmAndInsertStockIn(id, branchId);

        int inId = orderCheckService.getStockIn(id);

        List<OrderVo> list = orderCheckService.getOrderDetail(id);
        for (OrderVo vo : list) {
            StockVo stockVo = new StockVo(inId, vo.getBookCode(), vo.getQuantity());
            orderCheckService.confirmAndInsertInDetail(stockVo);
        }

        return "redirect:/admin/ordercheck/list";
    }
}
