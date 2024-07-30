package com.inventory.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.inventory.repositories.vo.BookInventoryVo;
import com.inventory.repositories.vo.OrderVo;
import com.inventory.repositories.vo.StockVo;
import com.inventory.repositories.vo.UserVo;
import com.inventory.services.BookInventoryService;
import com.inventory.services.BookService;
import com.inventory.services.OrderCheckService;
import com.inventory.services.StockService;

import jakarta.servlet.http.HttpSession;

@RequestMapping("/branch/initial")
@Controller
public class InitialSettingController {
	@Autowired
	BookInventoryService bookInventoryService;
	@Autowired
	BookService bookService;
	@Autowired
	StockService stockService;
	@Autowired
	OrderCheckService orderCheckService;

	
	@RequestMapping("/setting/form")
    public String moveToStockOutFrom(HttpSession session) {
    	UserVo vo = (UserVo)session.getAttribute("authUser");
		session.setAttribute("authUser", vo);
		return "branches/initial_setting/initial_setting_form";
    }
	
	@RequestMapping(value = "/getListForform", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public List<BookInventoryVo> getListForform(HttpSession session) {
        UserVo vo = (UserVo) session.getAttribute("authUser");
        Map <String, Object> params = new HashMap<>();
        params.put("branchId", vo.getBranchId());
        params.put("orderBy", "kindcode desc, book_name asc");
        return bookInventoryService.invenList(params);
    }
	
	@RequestMapping(value = "/search", method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public List<BookInventoryVo> search(HttpSession session, @RequestParam("keyword") String keyword,
    		@RequestParam(value = "orderBy", defaultValue = "kindcode desc, book_name asc") String orderBy) {
        UserVo vo = (UserVo) session.getAttribute("authUser");
        
        Map <String, Object> params = new HashMap<>();
		params.put("branchId", vo.getBranchId());
	    params.put("keyword", keyword != null ? keyword : "");
	    params.put("orderBy", orderBy != null ? orderBy.trim() : null);
        return bookInventoryService.invenList(params);
    }
	
	@RequestMapping("/confirm")
    public ResponseEntity<String> confirmStockOut(HttpSession session, @RequestBody List<StockVo> vo) {
        if (vo == null || vo.isEmpty()) {
            // 빈 데이터가 넘어왔을 때 오류 응답 반환
            return new ResponseEntity<>("전송된 데이터가 없습니다.", HttpStatus.BAD_REQUEST);
        }

        UserVo userVo = (UserVo)session.getAttribute("authUser");
        String branchId = userVo.getBranchId();
        
        stockService.initialStockIn("-1", branchId, userVo.getName());
        
        int inId = stockService.getInId(userVo.getBranchId());
        
        vo.forEach(item -> {
            item.setId(inId);
            item.setBranchId(branchId);
            stockService.confirmStockIn(item);
            orderCheckService.confirmAndInsertInDetail(item);
        });
        
        return new ResponseEntity<>("성공적으로 처리되었습니다.", HttpStatus.OK);
    }
	
}
