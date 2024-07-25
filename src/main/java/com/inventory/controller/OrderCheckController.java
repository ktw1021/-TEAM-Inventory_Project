package com.inventory.controller;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.inventory.repositories.vo.OrderVo;
import com.inventory.repositories.vo.StockVo;
import com.inventory.repositories.vo.UserVo;
import com.inventory.services.OrderCheckService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@RequestMapping("/admin/ordercheck")
@Controller
public class OrderCheckController {

	@Autowired
	private OrderCheckService OrderCheckService;

	@RequestMapping({ "", "/", "/list" })
	public String orderCheckList(HttpServletRequest request, HttpSession session, Model model) {
		UserVo authUser = (UserVo) session.getAttribute("authUser");
		session.setAttribute("authUser", authUser);
		
		Map <String, String> params = new HashMap <>();
		
		String checked = request.getParameter("checked");
        if (checked != null && !checked.trim().isEmpty()) {
            params.put("checked", checked);
        }
        
        String branchId = request.getParameter("branchId");
        if (branchId != null && !branchId.trim().isEmpty()) {
            params.put("branchId", branchId);
        }
		
		List <OrderVo> list = OrderCheckService.newGetList(params);
		model.addAttribute("list", list);

		List<OrderVo> branchList = OrderCheckService.getBranchList();
		model.addAttribute("branchList", branchList);

		return "admins/order_check_list";
	}

	@RequestMapping("/detail/{id}")
	public String orderCheckdetail(@PathVariable("id") String id, HttpSession session, Model model) {

		List<OrderVo> list = OrderCheckService.getOrderDetail(id);
		
		String checked = null;
		for(OrderVo vo:list) {
			checked = vo.getChecked();
		}
		
		session.setAttribute("list", list);
		model.addAttribute("checked", checked);

		return "admins/order_check_detail";
	}

	@RequestMapping("/refuse/{id}")
	public String orderRefuse(@PathVariable("id") String id) {
		OrderCheckService.refuseOrder(id);
		return "redirect:/admin/ordercheck/list";
	}

	@RequestMapping("/confirm/{id}")
	public String orderConfirm(@PathVariable("id") String id) {
		OrderCheckService.confirmOrderCode(id);

		String branchId = OrderCheckService.getBranchId(id);
		OrderCheckService.confirmAndInsertStockIn(id, branchId);

		int inId = OrderCheckService.getStockIn(id);

		List<OrderVo> list = OrderCheckService.getOrderDetail(id);
		for (OrderVo vo : list) {
			StockVo stockVo = new StockVo(inId, vo.getBookCode(), vo.getQuantity());
			OrderCheckService.confirmAndInsertInDetail(stockVo);
		}

		return "redirect:/admin/ordercheck/list";
	}
	
	@RequestMapping ("/view")
	public String test(HttpSession session) {	
		List<OrderVo> list = OrderCheckService.getSum();  // bookCode와 inventory 정보만 있는 리스트
	    session.setAttribute("list", list);

	    List<OrderVo> branchList = OrderCheckService.getBranchList();  // branchId만 있는 리스트
	    session.setAttribute("branchList", branchList);

	    List<OrderVo> testList = OrderCheckService.getOrderQuantity();  // branchId, bookCode, inventory 정보가 있는 리스트
		// 데이터 가공
	    Map<String, Map<String, Integer>> bookBranchQuantities = new LinkedHashMap<>();
	    Map<String, Integer> bookTotalQuantities = new HashMap<>();

	    for (OrderVo order : testList) {
	        bookBranchQuantities
	            .computeIfAbsent(order.getBookName(), k -> new HashMap<>())
	            .put(order.getBranchId(), order.getInventory());
	    }

	    for (OrderVo order : list) {
	        bookTotalQuantities.put(order.getBookName(), order.getInventory());
	    }

	    session.setAttribute("bookBranchQuantities", bookBranchQuantities);
	    session.setAttribute("bookTotalQuantities", bookTotalQuantities);

	    return "admins/order_check_test";
	}
	
	@RequestMapping ("/order")
	public String test2 () {
		OrderCheckService.goodGije();
		return "redirect:/admin/ordercheck/list";
	}
}
