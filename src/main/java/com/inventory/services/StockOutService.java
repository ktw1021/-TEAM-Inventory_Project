package com.inventory.services;

import java.util.List;

import com.inventory.repositories.vo.StockOutVo;

public interface StockOutService {
    List<StockOutVo> getAllStockOuts();
}
