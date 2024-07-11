package com.inventory.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.inventory.repositories.vo.OrderCheckVo;
import com.inventory.repositories.vo.UserVo;
import com.inventory.services.OrderCheckService;

import jakarta.servlet.http.HttpSession;

@RequestMapping("/order/check")
@Controller
public class OrderCheckController {

	@Autowired
	private OrderCheckService OrderCheckService;
	
	@RequestMapping({"", "/", "list"})
	public String orderCheckList(HttpSession session,  RedirectAttributes redirectAttributes, Model model) {
		UserVo authUser = (UserVo) session.getAttribute("authUser");
    	//	로그인 정보 판단
    	if (!("2").equals(authUser.getAuthCode())) {
			//	로그인 안 한 경우 홈으로 리다이렉트
			redirectAttributes.addFlashAttribute("errorMsg", "auth code 불일치 ");
			return "redirect:/";
		}
    	
    	session.setAttribute("authUser", authUser);
    	List<OrderCheckVo> list = OrderCheckService.getList();
    	model.addAttribute("list", list);
    	
    	return "admins/order_check_list";
	}
	
	//	지점 별 오더 확인 위한 메서드
	@RequestMapping("/{no}/list")
	public String branchOrderCheckList (HttpSession session,  RedirectAttributes redirectAttributes, Model model, @PathVariable ("no") String no) {
		UserVo authUser = (UserVo) session.getAttribute("authUser");
		if (!("2").equals(authUser.getAuthCode())) {
			//	로그인 안 한 경우 홈으로 리다이렉트
			redirectAttributes.addFlashAttribute("errorMsg", "auth code 불일치 ");
			return "redirect:/";
		}
		
		List<OrderCheckVo> list = OrderCheckService.getBranchsList(no);
    	model.addAttribute("list", list);
		
		return "admins/order_check_list";
	}
	
	@RequestMapping("/{id}/detail")
	public String orderCheckdetail( @PathVariable ("id") String id, HttpSession session) {
		
		List <OrderCheckVo> list = OrderCheckService.getOrderDetail(id);
		session.setAttribute("list", list);
		
		return "admins/order_check_detail";
	}
	
	@RequestMapping("/{id}/ref")
	public String orderRefuse() {
		return "";
	}
	
	@RequestMapping("/{id}/con")
	public String orderConfirm() {
		return"";
	}
}
