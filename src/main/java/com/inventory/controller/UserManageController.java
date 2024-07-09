package com.inventory.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.inventory.repositories.vo.UserVo;

import jakarta.servlet.http.HttpSession;

@RequestMapping("/usermanage")
@Controller
public class UserManageController {

	@RequestMapping({"/list", "/", ""}) 
    public String userList(HttpSession session,  RedirectAttributes redirectAttributes) {
    	UserVo authUser = (UserVo) session.getAttribute("authUser");
    	if (authUser == null) {
			//	홈화면으로 보내
			redirectAttributes.addFlashAttribute("errorMsg", "로그인을 해얗자 ");
			return "redirect:/";
		}
        return "usersmanage/userlist";
    }
}
