package com.inventory.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.inventory.repositories.vo.UserVo;
import com.inventory.services.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@RequestMapping("/users")
@Controller
public class UserController {
	@Autowired
	private UserService userService;
	

	@GetMapping("/join")
	public String join() {
		return "users/join";
	}
	
	@PostMapping("/join")
	public String join(@ModelAttribute @Valid UserVo userVo,
			@RequestParam("checkedName") String checkedName,
			Model model) {
		System.out.println(userVo);
		System.out.println(checkedName);
		
		if("y".equals(checkedName)) {
			boolean success = userService.join(userVo);
			if (success) {	//	가입 성공
			//	성공 페이지로 리다이렉트
				System.out.println("가입 성공");
				return "redirect:/users/joinsuccess";
			} else {
			//	다시 가입 폼으로 보내
				System.err.println("실패!");
				return "redirect:/users/join";
			}
			
		} else {
			System.err.println("실패!");
			return "redirect:/users/join";
		}
		
	}
	
	@GetMapping("/joinsuccess")
	public String joinsuccess() {
		return "users/joinsuccess";
	}
	
	//	중복 이메일 체크(API) - 응답을 Json으로 
	@ResponseBody	//	메시지 컨버터 
	@RequestMapping("/checkName")
	public Object checkName(@RequestParam (value="name", required = true, defaultValue="") String name) {
		System.err.println("작동함");
		UserVo vo = userService.getUser(name);
		System.out.println(vo);
		boolean exists = vo != null ? true : false;
		System.out.println(exists);
		
		Map<String, Object> json = new HashMap<>();
		json.put("result", "success");
		json.put("exists", exists);
		System.out.println(json);
		return json;
	}
	
	@GetMapping ("/login")
	public String loginform () {
		return "users/loginform";
	}
	
	@PostMapping("/login")
	public String loginAction(@RequestParam(value="name", required=false, defaultValue="") String name,
			@RequestParam(value="password", required=false, defaultValue="") String password,
			HttpSession session) {
		System.out.println("name: " + name);
		System.out.println("password: " + password);
		
		if (name.length() == 0 || password.length() == 0) {
			System.out.println("이메일 혹은 페스워드 입력되이 잖음");
			return "redirect:/users/login";
			
		}
		
		//	이메일과 패스워드 이용해서 사용자 정보 질의ㅏ
		UserVo authUser = userService.getUser(name, password);
		if (authUser != null) {
			//	록드인 처리 해주어야
			session.setAttribute("authUser", authUser);
			if (authUser.getAuthCode().equals("1")) {
				return "redirect:/branches/branch_home";
			} else if (authUser.getAuthCode().equals("2")) {
				return "redirect:/admins/admin_home"; 
			} else {
				return "users/authcode";
			}
		} else {
			return "redirect:/users/login";
		}
	}
	
}