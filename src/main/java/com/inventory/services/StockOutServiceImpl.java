package com.inventory.services;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.inventory.repositories.dao.StockOutDAO;
import com.inventory.repositories.vo.StockOutVo;

@Service
public class StockOutServiceImpl implements StockOutService {

    @Autowired
    private StockOutDAO stockOutDAO;

    @Override
    public List<StockOutVo> getAllStockOuts() {
        return stockOutDAO.getAllStockOuts();
    }
}
