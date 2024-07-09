package com.inventory.repositories.dao;

import java.util.List;

import com.inventory.repositories.vo.StockOutVo;

public interface StockOutDAO {
    List<StockOutVo> getAllStockOuts();
}
