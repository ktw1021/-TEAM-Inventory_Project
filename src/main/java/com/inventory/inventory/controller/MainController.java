package com.inventory.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.inventory.exceptions.MainControllerException;

@Controller
public class MainController {
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);

    @RequestMapping("/main") 
    public String main(Model model) {
    	logger.debug("메인 페이지");
        // 모델에 필요한 기본 속성을 추가할 수 있습니다.
        // model.addAttribute("key", "value");
        return "home";
    }

    // 루트 경로를 처리하는 메서드
    @RequestMapping("/")
    public String root() {
        return "redirect:/main"; // /main 경로로 리다이렉트
    }
    
    @GetMapping("/except")
    @ResponseBody
    public String raiseExcept() {
    	// RuntimeException -> 좀 더 구체적인 예외로 전환한 이후 throw 해준다
//    	throw new RuntimeException("force Exception");
    	throw new MainControllerException("메인 컨트롤러에서 예외가 발생했습니다.");
    }
    
//    @ExceptionHandler(RuntimeException.class)
//    @ResponseBody
//    public String handlerControllerException(RuntimeException e) {
//    	return "Exception: " + e.getMessage();
    	
//    }
   
}
