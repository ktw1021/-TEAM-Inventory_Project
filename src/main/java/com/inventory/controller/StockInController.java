package com.inventory.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.inventory.repositories.vo.StockVo;
import com.inventory.repositories.vo.UserVo;
import com.inventory.services.StockService;
import com.inventory.services.UserService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@RequestMapping("/branch/stockin")
@Controller
public class StockInController {
	
	@Autowired
	StockService stockService;
	@Autowired
	UserService userService;

	@RequestMapping("/list")
	public String stockInList(Model model, HttpSession session, HttpServletRequest request) {
		UserVo vo = (UserVo) session.getAttribute("authUser");
		String checkedIn = request.getParameter("checked");
		if (!(checkedIn == null)) {
			if (!"0".equals(checkedIn)) {
				checkedIn = "1";
			}
		}
		
		Map <String, String> params = new HashMap <>();
		params.put("branchId", vo.getBranchId());
		params.put("checkedIn", checkedIn);
		
		String userName = request.getParameter("userName");
		if (userName != null && !userName.trim().isEmpty()) {
			params.put("userName", userName);
		}
		List <StockVo> list = stockService.getStockInList(params);
		List<UserVo> userList = userService.selectBranchUserList(vo.getBranchId());
		model.addAttribute("userList", userList);
		model.addAttribute("list", list);
		model.addAttribute("user", vo);
		return "branches/branch_stock_in_list";
	}
	
	@RequestMapping("/detail/{id}")
	public String stockIndetail(@PathVariable ("id") String inId, Model model) {
		List<StockVo> list = stockService.getStockInDetail(inId);
		
		String i = null;
		for(StockVo vo:list) {
			i = vo.getCheckedIn();
		}
		model.addAttribute("check", i);
		model.addAttribute("list", list);
		model.addAttribute("inId", inId);
		return "branches/branch_stock_in_detail";
	}
	
	@RequestMapping("/confirm/{id}")
	public String confirmStockIn(@PathVariable ("id") String inId) {
		stockService.stockInCheck(inId);
		List<StockVo>list = stockService.getStockInDetail(inId);
		
		for (StockVo vo :list) {
			StockVo insertVo = new StockVo (vo.getBranchId(), vo.getBookCode(), vo.getQuantity());
			stockService.confirmStockIn(insertVo);
		}
		
		return "redirect:/branch/inventory";
	}
}
