package com.inventory.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.inventory.repositories.vo.OrderVo;
import com.inventory.repositories.vo.UserVo;
import com.inventory.services.OrderCheckService;
import com.inventory.services.UserService;

import jakarta.servlet.http.HttpSession;

@RequestMapping("/admin")
@Controller
public class AdminController {
	@Autowired
	private UserService userService;
	@Autowired
	private OrderCheckService orderCheckService;

    @RequestMapping({"/home", "/", ""}) 
    public String adminHome(HttpSession session,  RedirectAttributes redirectAttributes, Model model) {
    	UserVo authUser = (UserVo) session.getAttribute("authUser");
    	System.err.println(authUser);
    	//	authUser = null 일때 오류 나니까 수정 필요
//    	if (!("2").equals(authUser.getAuthCode())) {
//			//	홈화면으로 보내
//			redirectAttributes.addFlashAttribute("errorMsg", "auth code 불일치");
//			return "redirect:/";
//		}
    	
    	//	계정 승인 요청 
    	long taikiUser = userService.userCount();
    	
    	long orderCount = orderCheckService.getCount();
    	
    	List<OrderVo> branchList = orderCheckService.getBranchList();
    	
    	model.addAttribute("userCount", taikiUser);
    	model.addAttribute("orderCount", orderCount);
    	model.addAttribute("branchList", branchList);
    	
        return "admins/admin_home";
    }
    
    @RequestMapping("/branch/{branchId}")
    public String branch(HttpSession session, @PathVariable("branchId") String branchId) {
    	UserVo authUser = (UserVo) session.getAttribute("authUser");
    	authUser.setBranchId(branchId);
    	session.setAttribute("authUser", authUser);
    	return "redirect:/branch/home";
    }

    
}
