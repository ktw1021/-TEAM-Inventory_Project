package com.inventory.controller;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;
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

@RequestMapping("/user")
@Controller
public class UserController {
	@Autowired
	private UserService userService;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@GetMapping("/join")
	public String join(Model model) {
		// 지점 목록을 모델에 추가
		List<UserVo> branches = userService.getAllBranches();
		model.addAttribute("branches", branches);
		return "users/join";
	}
	
	@PostMapping("/join")
	public String join(@ModelAttribute @Valid UserVo userVo,
			@RequestParam("checkedName") String checkedName,
			Model model) {
		
		if("y".equals(checkedName)) {	//	이름 중복 체크 여부 판단
			boolean success = userService.join(userVo);
			if (success) {	//	가입 성공
				System.out.println("가입 성공");
				return "redirect:/user/joinsuccess";
			} else {
				System.err.println("실패!");
				return "redirect:/user/join";
			}
			
		} else {
			System.err.println("중복 체크 안 함");
			return "redirect:/user/join";
		}
		
	}
	
	@GetMapping("/joinsuccess")
	public String joinsuccess() {
		return "users/joinsuccess";
	}
	
	@GetMapping("/waiting")
	public String waitingAuthCode() {
		return "users/authcode";
	}
	
	//	중복 이메일 체크(API) - 응답을 Json으로 
	@ResponseBody	//	메시지 컨버터 
	@RequestMapping("/checkName")
	public Object checkName(@RequestParam (value="name", required = true, defaultValue="") String name) {
		UserVo vo = userService.getUser(name);
		boolean exists = vo != null ? true : false;
		
		Map<String, Object> json = new HashMap<>();
		json.put("result", "success");
		json.put("exists", exists);
		return json;
	}
	
	@GetMapping ("/login")
	public String loginform () {
		return "users/loginform";
	}

	@GetMapping("/mypage")
	public String mypage(Authentication authentication, Model model) {
		String username = authentication.getName();
		UserVo vo = userService.getUserProfile(username);
		model.addAttribute("user", vo);
		return "users/mypage";
	}
	
	@GetMapping("/changePassword")
    public String changePasswordForm() {
        return "users/changePassword";
    }
	
	@PostMapping("/changePassword")
	public String changePassword(@RequestParam("currentPassword") String currentPassword,
	                             @RequestParam("newPassword") String newPassword,
	                             @RequestParam("confirmPassword") String confirmPassword,
	                             HttpSession session) {
	    UserVo userVo = (UserVo) session.getAttribute("authUser");
	    
	    if (newPassword.equals(confirmPassword)) {
	    	boolean success = userService.changePassword(userVo.getName(), currentPassword, newPassword);
	    	if (success) {
		    	session.removeAttribute("tempPasswordMessage");
		        return "redirect:/user/changePassword?status=success";
		    } else {
		        return "redirect:/user/changePassword?status=failure";
		    }
	    } else {
	    	return "redirect:/user/changePassword?status=failure";
	    }
	}
	
    @GetMapping("/forgotPassword")
    public String forgotPasswordForm() {
        return "users/forgotPassword";
    }

    // 비밀번호 재설정 요청 처리
    @PostMapping("/forgotPassword")
    public String forgotPassword(@RequestParam("username") String username, Model model) {
        UserVo userVo = userService.getUserByNameForLogin(username);

        if (userVo == null || userVo.getEmail() == null || userVo.getEmail().isEmpty()) {
            model.addAttribute("message", "존재하지 않거나 이메일이 등록되지 않은 사용자 아이디입니다.");
            return "users/forgotPassword";
        }

        String tempPassword = UUID.randomUUID().toString().substring(0, 8);
        String encodedPassword = passwordEncoder.encode(tempPassword);
        userService.updatePasswordTemporaryPassword(username, encodedPassword, new Timestamp(System.currentTimeMillis()));
        userService.sendEmail(userVo.getEmail(), "임시 비밀번호 발급", userVo.getName()+" 님의 임시 비밀번호: " + tempPassword);

        model.addAttribute("status", "success");
        return "redirect:/user/forgotPassword?status=success";
    }
	
	
}