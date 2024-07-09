package com.inventory.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.inventory.repositories.vo.StockOutVo;
import com.inventory.services.StockOutService;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/branch_stock_out_list")
public class StockOutController {

    @Autowired
    private StockOutService stockOutService;

    @GetMapping
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<StockOutVo> stockOuts = stockOutService.getAllStockOuts();
        request.setAttribute("stockOuts", stockOuts);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/branches/branch_stock_out_list.jsp");
        dispatcher.forward(request, response);
    }
}
