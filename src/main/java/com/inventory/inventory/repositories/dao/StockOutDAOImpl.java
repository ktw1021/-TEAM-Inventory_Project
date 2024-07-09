package com.inventory.repositories.dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.inventory.repositories.vo.StockOutVo;

@Repository
public class StockOutDAOImpl implements StockOutDAO {

    @Autowired
    private SqlSession sqlSession;
    
    private static final String NAMESPACE = "StockOut";

    @Override
    public List<StockOutVo> getAllStockOuts() {
        return sqlSession.selectList(NAMESPACE + ".getAllStockOuts");
    }
}
